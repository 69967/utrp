local CurTime,IsValid,util,math,table,timer,game,engine,net=CurTime,IsValid,util,math,table,timer,game,engine,net
local mathRandom,mathMin,mathMax,mathSqrt,mathSin,mathCos,mathRad,mathCeil,mathClamp,mathAbs=math.random,math.min,math.max,math.sqrt,math.sin,math.cos,math.rad,math.ceil,math.Clamp,math.abs
local utilSharedRandom,utilTraceLine,utilBlastDamageInfo,utilPointContents=util.SharedRandom,util.TraceLine,util.BlastDamageInfo,util.PointContents
local tableRandom,tableCopy=table.Random,table.Copy
local Lerp,Angle,Vector,DamageInfo,EffectData=Lerp,Angle,Vector,DamageInfo,EffectData
local TICK_INTERVAL=engine.TickInterval()
local SQRT_2=1.4142135623730
local DEG_TO_RAD=0.017453292519943
local rings={1,9,24,45}
local doorclasses={["func_door_rotating"]=true,["prop_door_rotating"]=true,["prop_door_rotating_checkpoint"]=true}
local type_to_cvar={["2Magnum Pistol"]="mult_damage_magnum",["7Sniper Rifle"]="mult_damage_sniper",["6Launcher"]="",["7Special Weapon"]="",["8Melee Weapon"]="",["9Equipment"]="",["9Throwable"]=""}
local TacRP_ConVars,TacRP_GetBalanceMode,TacRP_BALANCE_OLDSCHOOL,TacRP_BLINDFIRE_KYS,TacRP_AmmoJamMSB=TacRP.ConVars,TacRP.GetBalanceMode,TacRP.BALANCE_OLDSCHOOL,TacRP.BLINDFIRE_KYS,TacRP.AmmoJamMSB

local function ringnum(i)return rings[i]or(rings[4]+i*i)end
local function getring(x)local i=1 while x>ringnum(i)do i=i+1 end return i end
local function anglerotate(m,o)local f,u,r=m:Forward(),m:Up(),m:Right()m:RotateAroundAxis(r,o.p)m:RotateAroundAxis(u,o.y)m:RotateAroundAxis(f,o.r)return m end

function SWEP:StillWaiting(c,r)local t=CurTime()if self:GetNextPrimaryFire()>t then return true end if self:GetNextSecondaryFire()>t and(not r or not self:GetReloading())then return true end if self:GetAnimLockTime()>t and(not r or not self:GetReloading())then return true end if not c and self:GetBlindFireFinishTime()>t then return true end if not c and self:GetCustomize()then return true end return self:GetPrimedGrenade()end

function SWEP:SprintLock(s)local t=CurTime()if self:GetSprintLockTime()>t or self:GetIsSprinting()or self:ShouldLowerWeapon()then return true end if s and self:DoForceSightsBehavior()and(self:GetSprintDelta()>0 or self:GetSightDelta()<0.75)and not self:GetBlindFire()then return true end return self:GetValue("CannotHipFire")and self:GetSightAmount()<1 and not self:GetBlindFire()end

function SWEP:PrimaryAttack()if self:GetOwner():IsNPC()then self:NPC_PrimaryAttack()return end
local o=self:GetOwner()if (self:GetValue("Melee")or false)and o:KeyDown(IN_USE)and not((self:GetValue("RunawayBurst")or false)and self:GetBurstCount()>0)then self:SetSafe(false)self:Melee()return end
local fm=self:GetCurrentFiremode()if fm<0 and self:GetBurstCount()>=-fm then return end
if self:GetReloading()and(self:GetValue("ShotgunReload")or false)then if TacRP_ConVars["reload_sg_cancel"]:GetBool()and not(self:GetValue("ShotgunFullCancel")or false)then self:CancelReload(false)self:Idle()else self:CancelReload(true)end end
if self:SprintLock(true)then return end
if DarkRP and self:GetNWBool("TacRP_PoliceBiocode")and not o:isCP()then return end
if self:GetSafe()and not self:GetReloading()then self:ToggleSafety(false)return end
if self:StillWaiting()then return end
local le=self:GetLockOnEntity()if(self:GetValue("RequireLockOn")or false)and not(IsValid(le)and CurTime()>self:GetLockOnStartTime()+(self:GetValue("LockOnTime")or 0))then return end
local aps=self:GetValue("AmmoPerShot")or 1 if self:Clip1()<aps or self:GetJammed()then if self:RunHook("Hook_PreDryfire")~=true then self.Primary.Automatic=false self:PlayAnimation(self:GetBlindFire()and"blind_dryfire"or"dryfire")self:EmitSound(self:GetValue("Sound_DryFire")or"",75,100,1,CHAN_ITEM)self:SetBurstCount(0)self:SetNextPrimaryFire(CurTime()+0.2)self:RunHook("Hook_PostDryfire")end return end
if utilSharedRandom("tacRP_shootChance",0,1)<=(self:GetJamChance(false)or 0)then if self:RunHook("Hook_PreJam")~=true then if self:GetBurstCount()==0 then self.Primary.Automatic=false end self:PlayAnimation(self:GetBlindFire()and"blind_dryfire"or"dryfire")self:EmitSound(self:GetValue("Sound_Jam")or"",75,100,1,CHAN_ITEM)self:SetBurstCount(0)self:SetPatternCount(0)local jt=CurTime()+(self:GetValue("JamWaitTime")or 0.5)self:SetNextPrimaryFire(jt)self:SetNextSecondaryFire(jt)if(self:GetValue("JamTakesRound")or false)then self:TakePrimaryAmmo(aps)end if self:Clip1()>0 and not(self:GetValue("JamSkipFix")or false)then self:SetJammed(true)end self:RunHook("Hook_PostJam")end return end
self:SetBaseSettings()if self:RunHook("Hook_PreShoot")then return end
local seq,idle,mult,bf,clip1="fire",true,self:GetValue("ShootTimeMult")or 1,self:GetBlindFire(),self:Clip1()
if(self:GetValue("LastShot")or false)and clip1==aps then seq=self:TranslateSequence("lastshot")idle=false end
if bf then seq="blind_"..seq end
if(self:GetValue("Akimbo")or false)and not bf then seq=(self:GetNthShot()%2==0)and"shoot_left"or"shoot_right"if(self:GetValue("LastShot")or false)then if clip1==aps then seq=seq.."_lastshot"elseif clip1==aps*2 then seq=seq.."_second_2_lastshot"end end end
local pi,sl=self:DoProceduralIrons(),self:GetScopeLevel()
if sl>0 and pi then if(self:GetValue("LastShot")or false)and clip1==aps then self:PlayAnimation(self:TranslateSequence("dryfire"),mult,false)end self:SetLastProceduralFireTime(CurTime())
elseif self:HasSequence(seq.."1")then local seq1=seq.."1"if not self:GetInBipod()and(sl<1 or self:GetPeeking())then seq1=seq..tostring(self:GetBurstCount()+1)end if self:HasSequence(seq1)then self:PlayAnimation(seq1,mult,false,idle)elseif sl<1 or self:GetPeeking()then for i=self:GetBurstCount()+1,1,-1 do local seq2=seq..tostring(i)if self:HasSequence(seq2)then self:PlayAnimation(seq2,mult,false,idle)break end end end else self:PlayAnimation(seq,mult,false,idle)end
local sshoot,silencer=self:GetValue("Sound_Shoot")or"",self:GetValue("Silencer")or false
local tr=utilTraceLine({start=self:GetPos(),endpos=self:GetPos()+Vector(0,0,1000),mask=MASK_PLAYERSOLID_BRUSHONLY})
local indoors=not(tr.HitWorld and tr.HitSky)
if silencer then sshoot=indoors and(self:GetValue("Sound_Shoot_Silenced_Indoors")or sshoot)or(self:GetValue("Sound_Shoot_Silenced")or sshoot)elseif indoors then sshoot=self:GetValue("Sound_Shoot_Indoors")or sshoot end
o:DoAnimationEvent(self:GetValue("GestureShoot")or 0)
local pvar,pitch=(self:GetValue("ShootPitchVariance")or 0),self:GetValue("Pitch_Shoot")or 100+utilSharedRandom("TacRP_sshoot",-(self:GetValue("ShootPitchVariance")or 0),self:GetValue("ShootPitchVariance")or 0)
if type(sshoot)=="table"then sshoot=tableRandom(sshoot)end
local shootAdd=self:GetValue("Sound_ShootAdd")if shootAdd then self:EmitSound(shootAdd,self:GetValue("Vol_Shoot")or 75,pitch,self:GetValue("Loudness_Shoot")or 1,CHAN_BODY)end
local bfm=self:GetBlindFireMode()if bfm==TacRP_BLINDFIRE_KYS then if SERVER then sound.Play(sshoot,self:GetMuzzleOrigin(),self:GetValue("Vol_Shoot")or 75,pitch,self:GetValue("Loudness_Shoot")or 1)end else self:EmitSound(sshoot,self:GetValue("Vol_Shoot")or 75,pitch,self:GetValue("Loudness_Shoot")or 1,CHAN_WEAPON)end
local delay,curatt,diff=60/self:GetRPM(),self:GetNextPrimaryFire(),CurTime()-self:GetNextPrimaryFire()
if diff>TICK_INTERVAL or diff<0 then curatt=CurTime()end
self:SetNthShot(self:GetNthShot()+1)
local ed=self:GetValue("EjectDelay")or 0 if ed==0 then self:DoEject()else self:SetTimer(ed,function()self:DoEject()end)end
self:DoEffects()
if(self:GetValue("EffectsDoubled")or false)then self:DoEffects(true)if ed==0 then self:DoEject(true)else self:SetTimer(ed,function()self:DoEject(true)end)end end
local num,isShotgun,fixed_spread,pellet_spread,spread,dir,tr,shootent=self:GetValue("Num")or 1,self:IsShotgun(),TacRP_ConVars["fixedspread"]:GetBool(),(self:GetValue("ShotgunPelletSpread")or 0)>0 and TacRP_ConVars["pelletspread"]:GetBool(),self:GetSpread(),self:GetShootDir(),self:GetValue("TracerNum")or 0,self:GetValue("ShootEnt")
if IsFirstTimePredicted()then
local hitscan,dist=not TacRP_ConVars["physbullet"]:GetBool(),100000
if not hitscan and not TacRP_ConVars["client_damage"]:GetBool()then local muzzleVel=mathMax(self:GetValue("MuzzleVelocity")or 15000,15000)dist=muzzleVel*TICK_INTERVAL*(num==1 and 2 or 1)*(game.IsDedicated()and 1 or 2)
local muzzleOrigin=self:GetMuzzleOrigin()local inst_tr=utilTraceLine({start=muzzleOrigin,endpos=muzzleOrigin+(dir:Forward()*dist),mask=MASK_SHOT,filter={o,o:GetVehicle(),self}})if inst_tr.Hit and not inst_tr.HitSky then hitscan=true end end
if shootent or not hitscan or(isShotgun and fixed_spread)then
local d=mathRandom()for i=1,num do local new_dir=Angle(dir)if isShotgun and fixed_spread then local sgp_x,sgp_y=self:GetShotgunPattern(i,d)new_dir=anglerotate(new_dir,Angle(sgp_x,sgp_y,0)*36*SQRT_2)if pellet_spread then new_dir=anglerotate(new_dir,self:RandomSpread(self:GetValue("ShotgunPelletSpread")or 0,i))end else new_dir=anglerotate(new_dir,self:RandomSpread(spread,i))end
if shootent then self:ShootRocket(new_dir)elseif hitscan then o:FireBullets({Damage=self:GetValue("Damage_Max")or 0,Force=8,Tracer=tr,TracerName="tacrp_tracer",Num=1,Dir=new_dir:Forward(),Src=self:GetMuzzleOrigin(),Spread=Vector(),IgnoreEntity=o:GetVehicle(),Distance=dist,Callback=function(att,btr,dmg)local range=(btr.HitPos-btr.StartPos):Length()self:AfterShotFunction(btr,dmg,range,self:GetValue("Penetration")or 0,{})end})else TacRP:ShootPhysBullet(self,self:GetMuzzleOrigin(),new_dir:Forward()*(self:GetValue("MuzzleVelocity")or 15000)*3)end end
else
o:FireBullets({Damage=self:GetValue("Damage_Max")or 0,Force=8,Tracer=tr,TracerName="tacrp_tracer",Num=num,Dir=dir:Forward(),Src=self:GetMuzzleOrigin(),Spread=Vector(spread,spread,0),IgnoreEntity=o:GetVehicle(),Distance=dist,Callback=function(att,btr,dmg)local range=(btr.HitPos-btr.StartPos):Length()if IsValid(btr.Entity)and TacRP_ConVars["client_damage"]:GetBool()then if CLIENT then net.Start("tacrp_clientdamage")net.WriteEntity(self)net.WriteEntity(btr.Entity)net.WriteVector(btr.Normal)net.WriteVector(btr.Entity:WorldToLocal(btr.HitPos))net.WriteUInt(btr.HitGroup,8)net.WriteFloat(range)net.WriteFloat(self:GetValue("Penetration")or 0)net.WriteUInt(0,4)net.SendToServer()else self:AfterShotFunction(btr,dmg,range,self:GetValue("Penetration")or 0,{[btr.Entity]=true})end else self:AfterShotFunction(btr,dmg,range,self:GetValue("Penetration")or 0,{})end if SERVER then debugoverlay.Cross(btr.HitPos,4,5,Color(255,0,0),false)else debugoverlay.Cross(btr.HitPos,4,5,Color(255,255,255),false)end end})end end
self:ApplyRecoil()self:SetNextPrimaryFire(curatt+delay)self:TakePrimaryAmmo(aps)self:SetBurstCount(self:GetBurstCount()+1)self:SetPatternCount(self:GetPatternCount()+1)self:DoBulletBodygroups()
if self:Clip1()==0 then self.Primary.Automatic=false end
if SERVER and bfm==TacRP_BLINDFIRE_KYS and not shootent then timer.Simple(0,function()if not(IsValid(self)and IsValid(o))then return end local damage=DamageInfo()damage:SetAttacker(o)damage:SetInflictor(self)damage:SetDamage((self:GetValue("Damage_Max")or 0)*num*self:GetConfigDamageMultiplier())damage:SetDamageType(self:GetValue("DamageType")or(isShotgun and DMG_BUCKSHOT or DMG_BULLET))damage:SetDamagePosition(self:GetMuzzleOrigin())damage:SetDamageForce(dir:Forward()*num)damage:ScaleDamage(self:GetBodyDamageMultipliers()[HITGROUP_HEAD])o:TakeDamageInfo(damage)end)end
if CLIENT and o==LocalPlayer()then self:DoMuzzleLight()elseif game.SinglePlayer()then self:CallOnClient("DoMuzzleLight")end
self:SetCharge(false)
local bc=self:GetBurstCount()if bc>=8 and TacRP.ShouldWeFunny(true)and(self.NextTroll or 0)<CurTime()and mathRandom()<=0.02 then timer.Simple(mathRandom(0,250)/1000,function()if IsValid(self)then self:EmitSound("tacrp/discord-notification.wav",nil,100,mathRandom(100,500)/1000,CHAN_BODY)end end)self.NextTroll=CurTime()+180 end
self:RunHook("Hook_PostShoot")end

function SWEP:GetShotgunPattern(i,d)local num,ring_spread,pelspread=self:GetValue("Num")or 1,self:GetSpread(),(self:GetValue("ShotgunPelletSpread")or 0)>0 and TacRP_ConVars["pelletspread"]:GetBool()
if num==1 then return 0,0 end
if pelspread then ring_spread=ring_spread-(self:GetValue("ShotgunPelletSpread")or 0)else d=0 end
local x,y=0,0 local red=num<=3 and 0 or 1 local f=(i-red)/(num-red)
if num==2 then local angle=f*180+(pelspread and(d-0.5)*60 or 0)x=mathSin(angle*DEG_TO_RAD)*ring_spread y=mathCos(angle*DEG_TO_RAD)*ring_spread
elseif num==3 then local angle=(f*360+d*180+30)*DEG_TO_RAD x=mathSin(angle)*ring_spread y=mathCos(angle)*ring_spread
elseif i==1 then return x,y
else local tr,ri,rin,rln=getring(num),getring(i),ringnum(getring(i)),ringnum(getring(i)-1)
local l=(ri-1)/(tr-1)f=(ri==tr)and(i-rln)/(mathMin(rin,num)-rln)or(i-rln)/(rin-rln)
local angle=(360*(f+l+d))*DEG_TO_RAD x=mathSin(angle)*ring_spread*l y=mathCos(angle)*ring_spread*l end
return x,y end

function SWEP:AfterShotFunction(tr,dmg,range,penleft,ap,forced)
if not forced and not(IsFirstTimePredicted()or game.SinglePlayer())then return end
local dt=self:GetValue("DamageType")if dt then dmg:SetDamageType(dt)elseif self:IsShotgun()then dmg:SetDamageType(DMG_BUCKSHOT+(engine.ActiveGamemode()=="terrortown"and DMG_BULLET or 0))end
local matpen,te=self:GetValue("Penetration")or 0,tr.Entity
if te and ap[te]then dmg:SetDamage(0)elseif IsValid(te)then dmg:SetDamage(self:GetDamageAtRange(range))local bd=self:GetBodyDamageMultipliers()local hg=tr.HitGroup if bd[hg]then dmg:ScaleDamage(bd[hg])end
if te:IsNextBot()or te:IsNPC()then dmg:ScaleDamage(self:GetValue("DamageMultNPC")or 1)end
TacRP.CancelBodyDamage(te,dmg,hg)
local o=self:GetOwner()if o:IsNPC()and not TacRP_ConVars["npc_equality"]:GetBool()then dmg:ScaleDamage(0.25)elseif matpen>0 and TacRP_ConVars["penetration"]:GetBool()and not o:IsNPC()then dmg:ScaleDamage(Lerp(penleft/matpen,mathClamp(matpen*0.005,0.1,0.25),1))end ap[te]=true
if te.LVS and not self:IsShotgun()then dmg:ScaleDamage(0.5)dmg:SetDamageForce(dmg:GetDamageForce():GetNormalized()*matpen*75)dmg:SetDamageType(DMG_AIRBOAT+DMG_SNIPER)penleft=0 end
if SERVER and dt==DMG_BURN and IsValid(te)then te:Ignite(1,64)end end
local ed=self:GetValue("ExplosiveDamage")or 0 if ed>0 then timer.Simple(0,function()if not IsValid(self)then return end local di=DamageInfo()di:SetAttacker(self:GetOwner())di:SetInflictor(self)di:SetDamageType(DMG_BLAST+DMG_AIRBOAT)di:SetDamage(ed)utilBlastDamageInfo(di,tr.HitPos,self:GetValue("ExplosiveRadius")or 100)end)penleft=0 end
local ee=self:GetValue("ExplosiveEffect")if ee then local fx=EffectData()fx:SetOrigin(tr.HitPos)fx:SetNormal(tr.HitNormal)
if bit.band(utilPointContents(tr.HitPos),CONTENTS_WATER)==CONTENTS_WATER then util.Effect("WaterSurfaceExplosion",fx,true)else util.Effect(ee,fx,true)end end
if SERVER and IsValid(te)and not te.TacRP_DoorBusted and doorclasses[te:GetClass()]and(self:GetValue("DoorBreach")or false)then
local th=te.TacRP_BreachThreshold local ct=CurTime()
if not th or ct-th[1]>0.1 then te.TacRP_BreachThreshold={ct,0}th=te.TacRP_BreachThreshold end
th[2]=th[2]+dmg:GetDamage()if th[2]>(self:GetValue("DoorBreachThreshold")or 100)then te:EmitSound("ambient/materials/door_hit1.wav",80,mathRandom(95,105))for _,od in pairs(ents.FindInSphere(te:GetPos(),72))do if te~=od and od:GetClass()==te:GetClass()then local v=(od.TacRP_BreachThreshold and ct-od.TacRP_BreachThreshold[1]<=0.1)and 800 or 200 TacRP.DoorBust(od,tr.Normal*v,dmg:GetAttacker())break end end TacRP.DoorBust(te,tr.Normal*800,dmg:GetAttacker())te.TacRP_BreachThreshold=nil end end
self:Penetrate(tr,range,penleft,ap)end

function SWEP:GetMinMaxRange(b,s)local vf=b and self.GetBaseValue or self.GetValue local max,min=vf(self,"Damage_Max")or 0,vf(self,"Damage_Min")or 0 return vf(self,"Range_Min",s,max<min)or 0,vf(self,"Range_Max",s,max<min)or 1000 end

function SWEP:GetDamageAtRange(r,nr)local r_min,r_max=self:GetMinMaxRange()local d=r<=r_min and 0 or r>=r_max and 1 or(r-r_min)/(r_max-r_min)return nr and Lerp(d,self:GetValue("Damage_Max")or 0,self:GetValue("Damage_Min")or 0)*self:GetConfigDamageMultiplier()or mathCeil(Lerp(d,self:GetValue("Damage_Max")or 0,self:GetValue("Damage_Min")or 0)*self:GetConfigDamageMultiplier())end

function SWEP:GetShootDir(ns)local o=self:GetOwner()if not IsValid(o)then return self:GetAngles()end local dir=o:EyeAngles()
local bf=self:GetBlindFireMode()if bf==TacRP_BLINDFIRE_KYS then dir.y=dir.y+180 elseif bf==TacRP.BLINDFIRE_LEFT then dir.y=dir.y+75 elseif bf==TacRP.BLINDFIRE_RIGHT then dir.y=dir.y-75 end
local u,r=dir:Up(),dir:Right()local oa=ns and self:GetFreeAimOffset()or(self:GetFreeAimOffset()+self:GetSwayAngles())dir:RotateAroundAxis(u,oa.y)dir:RotateAroundAxis(r,-oa.p)return dir+(self:GetValue("ShootOffsetAngle")or Angle(0,0,0))end

function SWEP:ShootRocket(dir)if CLIENT then return end
local src=self:GetMuzzleOrigin()dir=dir or self:GetShootDir()local ent=self:GetValue("ShootEnt")if not ent then return end local rocket=ents.Create(ent)
if not IsValid(rocket)then return end
rocket:SetPos(src)local o=self:GetOwner()
if self:GetBlindFireMode()~=TacRP_BLINDFIRE_KYS then rocket:SetOwner(o)else rocket.Attacker=o end
rocket.Inflictor=self rocket:SetAngles(dir)
if isfunction(rocket.SetWeapon)then rocket:SetWeapon(self)end
if o:IsNPC()then rocket.LockOnEntity=o:GetTarget()else local le=self:GetLockOnEntity()if IsValid(le)and CurTime()>=(self:GetValue("LockOnTime")or 0)+self:GetLockOnStartTime()then rocket.LockOnEntity=le end end
self:RunHook("Hook_PreShootEnt",rocket)rocket:Spawn()self:RunHook("Hook_PostShootEnt",rocket)
local phys=rocket:GetPhysicsObject()if phys:IsValid()and(self:GetValue("ShootEntForce")or 0)>0 then phys:SetVelocityInstantaneous(dir:Forward()*(self:GetValue("ShootEntForce")or 0)*5)end end

function SWEP:GetSpread(b)local spread=self:GetValue("Spread")or 0 if b then return spread end
local ply,hippenalty,movepenalty=self:GetOwner(),self:GetValue("HipFireSpreadPenalty")or 0,self:GetValue("MoveSpreadPenalty")or 0
if TacRP_ConVars.oldschool:GetBool()or TacRP_GetBalanceMode()==TacRP_BALANCE_OLDSCHOOL then movepenalty=movepenalty+hippenalty*0.25 hippenalty=hippenalty*Lerp(12/((self:GetValue("ScopeFOV")or 90)-1.1),0.05,0.5)end
spread=spread+(self:GetInBipod()and self:GetScopeLevel()==0 and Lerp(1-(self:GetValue("PeekPenaltyFraction")or 0),hippenalty,0)or Lerp(self:GetSightAmount()-(self:GetPeeking()and(self:GetValue("PeekPenaltyFraction")or 0)or 0),hippenalty,0))
if not self:UseAltRecoil()then spread=spread+self:GetRecoilAmount()*(self:GetValue("RecoilSpreadPenalty")or 0)end
local v=ply:GetAbsVelocity()spread=spread+mathMin(mathSqrt(v.x*v.x+v.y*v.y)*0.004,1)*movepenalty
local ct,gt=CurTime(),ct-(ply.TacRP_LastOnGroundTime or 0)local gd=mathClamp(ply:IsOnGround()and gt/mathClamp((ply.TacRP_LastAirDuration or 0)-0.25,0.1,1.5)or 0,0,1)^0.75
if gd<1 and ply:GetMoveType()~=MOVETYPE_NOCLIP then spread=spread+Lerp(gd+((ply:WaterLevel()>0 or ply:GetMoveType()==MOVETYPE_LADDER)and 0.5 or 0),self:GetValue("MidAirSpreadPenalty")or 0,0)end
if ply:OnGround()and ply:Crouching()then spread=spread+(self:GetValue("CrouchSpreadPenalty")or 0)end
if self:GetBlindFire()then spread=spread+(self:GetValue("BlindFireSpreadPenalty")or 0)end
local qsd=((ct-self:GetLastScopeTime())/(self:GetValue("QuickScopeTime")or 0.3))^4 if qsd<1 then spread=spread+Lerp(qsd,self:GetValue("QuickScopeSpreadPenalty")or 0,0)end
return mathMax(spread,0)end

function SWEP:GetConfigDamageMultiplier()return self:IsShotgun()and TacRP_ConVars.mult_damage_shotgun:GetFloat()or(self:GetValue("PrimaryMelee")or false)and TacRP_ConVars.mult_damage_melee:GetFloat()or(type_to_cvar[self.SubCatType]or"mult_damage")==""and 1 or TacRP_ConVars[type_to_cvar[self.SubCatType]or"mult_damage"]:GetFloat()end

function SWEP:GetBodyDamageMultipliers(b)local vf=b and self.GetBaseValue or self.GetValue local btbl=tableCopy(vf(self,"BodyDamageMultipliers")or{})local extra=vf(self,"BodyDamageMultipliersExtra")
if extra then for k,v in pairs(extra)do btbl[k]=v<0 and mathAbs(v)or(btbl[k]or 1)*v end end
local mult=TacRP_ConVars.mult_headshot:GetFloat()local head=btbl[HITGROUP_HEAD]or 1
btbl[HITGROUP_HEAD]=mult<=0 and 1 or mult<=1 and Lerp(mult,1,head)or head*mult return btbl end

function SWEP:FireAnimationEvent()return true end

function SWEP:RandomSpread(s,seed)seed=(seed or 0)+self:EntIndex()+engine.TickCount()local a=utilSharedRandom("tacrp_randomspread",0,360,seed)local s,c=mathSin(a),mathCos(a)local rand=utilSharedRandom("tacrp_randomspread2",0,45,seed)*SQRT_2 return Angle(s*s*rand,c*s*rand,0)end

function SWEP:IsShotgun(b)local vf=b and self.GetBaseValue or self.GetValue return(vf(self,"Num")or 1)>1 and not(vf(self,"NotShotgun")or false)end

function SWEP:GetJamChance(b)local vf=b and self.GetBaseValue or self.GetValue local factor=vf(self,"JamFactor")or 0 if factor<=0 then return 0 end return 1/((vf(self,"JamBaseMSB")or(TacRP_AmmoJamMSB[self:GetAmmoType(b)]or 15))/mathSqrt(factor))end

function SWEP:GetRPM(b,fm)fm=fm or self:GetCurrentFiremode()local vf=b and self.GetBaseValue or self.GetValue local rpm=vf(self,"RPM")or 600 return fm==1 and rpm*(vf(self,"RPMMultSemi")or 1)or fm<0 and rpm*(vf(self,"RPMMultBurst")or 1)or rpm end