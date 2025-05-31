local TacRP=TacRP
local net=net
local util=util
local game=game
local bit=bit
local math=math
local table=table
local pairs=pairs
local IsValid=IsValid
local Vector=Vector
local CurTime=CurTime
local FrameTime=FrameTime
local CLIENT=CLIENT
local SERVER=SERVER
local NULL=NULL
local engine=engine
local debugoverlay=debugoverlay
local GetConVar=GetConVar
local Color=Color
local cam=cam
local render=render
local Material=Material
local LerpVector=LerpVector
local LocalPlayer=LocalPlayer
local EyeAngles=EyeAngles
local EyePos=EyePos
local DamageInfo=DamageInfo
local SuppressHostEvents=SuppressHostEvents
local DMG_BULLET=DMG_BULLET
local CONTENTS_WATER=CONTENTS_WATER
local MASK_SHOT=MASK_SHOT
local MASK_WATER=MASK_WATER

TacRP.PhysBullets={}
local bullets=TacRP.PhysBullets
local max,min,abs,floor,log,pow,clamp=math.max,math.min,math.abs,math.floor,math.log,math.pow,math.Clamp
local band=bit.band
local insert=table.insert
local tickint=engine.TickInterval
local curtime=CurTime
local frametime=FrameTime
local pointcontents=util.PointContents
local traceline=util.TraceLine
local tracehull=util.TraceHull

function TacRP:SendBullet(b,a)
net.Start("TacRP_sendbullet",true)
net.WriteVector(b.Pos)
net.WriteAngle(b.Vel:Angle())
net.WriteFloat(b.Vel:Length())
net.WriteFloat(b.Drag)
net.WriteFloat(b.Gravity)
net.WriteEntity(b.Weapon)
if a and IsValid(a) and a:IsPlayer() and not game.SinglePlayer() then
net.SendOmit(a)
else
if game.SinglePlayer() then net.WriteEntity(a) end
net.Broadcast()
end
end

function TacRP:ShootPhysBullet(w,p,v,t)
t=t or {}
local b={
Penleft=w:GetValue("Penetration"),
Gravity=1,
Pos=p,
StartPos=Vector(p),
Vel=v,
Drag=1,
Travelled=0,
StartTime=curtime(),
Imaginary=false,
Underwater=false,
Weapon=w,
Attacker=w:GetOwner(),
Filter={w:GetOwner()},
Damaged={},
Dead=false,
NPC=w:GetOwner():IsNPC(),
HullSize=w:IsShotgun() and 2 or 0
}
local tn=w:GetValue("TracerNum")
if tn==0 then
b.Invisible=true
elseif w:Clip1()%tn~=0 then
b.Invisible=true
end
for i,k in pairs(t) do b[i]=k end
if band(pointcontents(p),CONTENTS_WATER)==CONTENTS_WATER then b.Underwater=true end
local add=game.SinglePlayer() or not TacRP.ConVars["client_damage"]:GetBool() or CLIENT
if add then insert(bullets,b) end
if w:GetOwner():IsPlayer() and SERVER and add then
local l=floor(engine.TickCount()-w:GetOwner():GetCurrentCommand():TickCount()-1)
local ts=tickint()
while l>0 do
TacRP:ProgressPhysBullet(b,ts)
l=l-1
end
end
if SERVER then TacRP:SendBullet(b,w:GetOwner()) end
end

if CLIENT then
net.Receive("TacRP_sendbullet",function()
local p=net.ReadVector()
local a=net.ReadAngle()
local v=net.ReadFloat()
local d=net.ReadFloat()
local g=net.ReadFloat()
local w=net.ReadEntity()
if game.SinglePlayer() then net.ReadEntity() end
if not IsValid(w) or not w.GetValue then return end
local b={
Pos=p,
StartPos=p,
Vel=a:Forward()*v,
Travelled=0,
StartTime=curtime(),
Imaginary=false,
Underwater=false,
Dead=false,
Damaged={},
Drag=d,
Gravity=g,
Weapon=w,
Filter={w:GetOwner()},
HullSize=w:IsShotgun() and TacRP.ShotgunHullSize or 0
}
local tn=w:GetValue("TracerNum")
if tn==0 then
b.Invisible=true
elseif w:Clip1()%tn~=0 then
b.Invisible=true
end
if band(pointcontents(p),CONTENTS_WATER)==CONTENTS_WATER then b.Underwater=true end
insert(bullets,b)
end)
end

local new={}
function TacRP:DoPhysBullets()
local c=0
for i=1,#bullets do
local b=bullets[i]
TacRP:ProgressPhysBullet(b,frametime())
if not b.Dead then
c=c+1
new[c]=b
end
end
for i=c+1,#new do new[i]=nil end
bullets,new=new,bullets
end

hook.Add("Think","TacRP_DoPhysBullets",TacRP.DoPhysBullets)

local function indim(v,m)
return abs(v.x)<=m and abs(v.y)<=m and abs(v.z)<=m
end

function TacRP:ProgressPhysBullet(b,ts)
ts=ts or frametime()
if b.Dead then return end
local op,ov=b.Pos,b.Vel
local d=ov:GetNormalized()
local s=ov:Length()*ts
local dr=b.Drag*s*s/150000
local gv=ts*(b.Gravity or 1)*600
local f=abs(b.StartTime-curtime())<=0.001
local a=b.Attacker or NULL
local w=b.Weapon
if SERVER and not IsValid(a) then b.Dead=true return end
if CLIENT and not IsValid(a) then a=game.GetWorld() end
if not IsValid(w) then b.Dead=true return end
if b.Underwater then dr=dr*3 end
if s<=0.001 then b.Dead=true return end
local np=op+ov*ts
local nv=ov-d*dr-Vector(0,0,gv)
if b.Imaginary then
b.Pos,b.Vel,b.Travelled=np,nv,b.Travelled+s
else
if not f and a:IsPlayer() then a:LagCompensation(true) end
local tr
local hs=b.HullSize or 0
if hs>0 then
hs=hs*0.5
tr=tracehull{start=op,endpos=np,filter=b.Filter,mask=MASK_SHOT,mins=Vector(-hs,-hs,-hs),maxs=Vector(hs,hs,hs)}
else
tr=traceline{start=op,endpos=np,filter=b.Filter,mask=MASK_SHOT}
end
if not f and a:IsPlayer() then a:LagCompensation(false) end
if GetConVar("developer"):GetInt()>1 then
if SERVER then
debugoverlay.Line(op,tr.HitPos,5,Color(100,100,255),true)
else
debugoverlay.Line(op,tr.HitPos,5,Color(255,200,100),true)
end
end
if tr.HitSky then
if CLIENT then b.Imaginary=true else b.Dead=true end
b.Pos,b.Vel,b.Travelled=np,nv,b.Travelled+s
if SERVER then b.Dead=true end
elseif tr.Hit then
b.Travelled=b.Travelled+(op-tr.HitPos):Length()
b.Pos=tr.HitPos
if not f and a:IsPlayer() then a:LagCompensation(true) end
if SERVER then
debugoverlay.Cross(tr.HitPos,5,5,Color(100,100,255),true)
else
debugoverlay.Cross(tr.HitPos,5,5,Color(255,200,100),true)
end
local e=tr.Entity:EntIndex()
if CLIENT then
if not game.SinglePlayer() then
a:FireBullets{Src=op,Dir=d,Distance=s+16,Tracer=0,Damage=0,IgnoreEntity=a,HullSize=w:IsShotgun() and 2 or 0,Callback=function()
if TacRP.ConVars["client_damage"]:GetBool() then
net.Start("tacrp_clientdamage")
net.WriteEntity(w)
net.WriteEntity(tr.Entity)
net.WriteVector(d)
net.WriteVector(tr.Entity:WorldToLocal(tr.HitPos))
net.WriteUInt(tr.HitGroup,8)
net.WriteFloat(b.Travelled or 0)
net.WriteFloat(b.Penleft or 0)
net.WriteUInt(#b.Damaged,4)
for i=1,#b.Damaged do net.WriteEntity(b.Damaged[i]) end
net.SendToServer()
end
end}
end
b.Dead=true
return
elseif SERVER then
b.Damaged[e]=true
b.Dead=true
if game.SinglePlayer() or not TacRP.ConVars["client_damage"]:GetBool() then
b.Attacker:FireBullets{Damage=w:GetValue("Damage_Max"),Force=8,Tracer=0,Num=1,Dir=b.Vel:GetNormalized(),Src=op,Spread=Vector(0,0,0),HullSize=w:IsShotgun() and 2 or 0,Callback=function(at,bt,dm)
if IsValid(w) then w:AfterShotFunction(bt,dm,b.Travelled,b.Penleft,b.Damaged) end
end}
end
end
if not f and a:IsPlayer() then a:LagCompensation(false) end
else
b.Pos,b.Vel,b.Travelled=tr.HitPos,nv,b.Travelled+s
local pc=pointcontents(tr.HitPos)
if b.Underwater then
if band(pc,CONTENTS_WATER)~=CONTENTS_WATER then
local ut=traceline{start=tr.HitPos,endpos=op,filter=b.Attacker,mask=MASK_WATER}
if ut.Hit then
local fx=EffectData()
fx:SetOrigin(ut.HitPos)
fx:SetScale(5)
fx:SetFlags(0)
util.Effect("gunshotsplash",fx)
end
b.Underwater=false
end
else
if band(pc,CONTENTS_WATER)==CONTENTS_WATER then
local ut=traceline{start=op,endpos=tr.HitPos,filter=b.Attacker,mask=MASK_WATER}
if ut.Hit then
local fx=EffectData()
fx:SetOrigin(ut.HitPos)
fx:SetScale(5)
fx:SetFlags(0)
util.Effect("gunshotsplash",fx)
end
b.Underwater=true
end
end
end
end
local md,wd=65536,16384
local ct=curtime()
if b.StartTime<=ct-10 then
b.Dead=true
elseif not indim(b.Pos,md) then
b.Dead=true
elseif not indim(b.Pos,wd) then
b.Imaginary=true
end
end

local h=Material("particle/fire")
local tr=Material("tacrp/tracer")
function TacRP:DrawPhysBullets()
cam.Start3D()
for i=1,#bullets do
local b=bullets[i]
if not b.Invisible then
local p=b.Pos
local sv=-b.Vel:GetNormalized()
local v=sv
if IsValid(b.Weapon) then
local fv=(b.Weapon:GetTracerOrigin()-p):GetNormalized()
local d=min(b.Travelled/1024,1)
if b.Indirect then d=1 end
v=LerpVector(d,fv,sv)
end
local sz=clamp(log(EyePos():DistToSqr(p)-pow(512,2)),0,math.huge)
local vel=b.Vel-LocalPlayer():GetVelocity()
local dt=abs(EyeAngles():Forward():Dot(vel:GetNormalized()))
local hs=sz*dt*2
local c=b.Color or Color(255,225,200)
render.SetMaterial(h)
render.DrawSprite(p,hs,hs,c)
render.SetMaterial(tr)
local t=v:GetNormalized()*min(vel:Length()/25,512,b.Travelled-64)
render.DrawBeam(p,p+t,sz*0.75,0,1,c)
end
end
cam.End3D()
end

hook.Add("PreDrawEffects","TacRP_DrawPhysBullets",TacRP.DrawPhysBullets)
hook.Add("PostCleanupMap","TacRP_CleanPhysBullets",function()TacRP.PhysBullets={}end)

if SERVER then
net.Receive("tacrp_clientdamage",function(l,p)
local w=net.ReadEntity()
local t=net.ReadEntity()
if not IsValid(t) then return end
local d=net.ReadVector()
local h=t:LocalToWorld(net.ReadVector())
local g=net.ReadUInt(8)
local r=net.ReadFloat()
local pe=net.ReadFloat()
local c=net.ReadUInt(3)
local dm={}
for i=1,c do insert(dm,net.ReadEntity()) end
if not p:Alive() or not IsValid(w) or w:GetOwner()~=p then return end
local su=not(t:IsNPC() or t:IsNextBot())
if su then SuppressHostEvents(p) end
local dmg=DamageInfo()
dmg:SetAttacker(p)
dmg:SetInflictor(p)
dmg:SetDamagePosition(h)
dmg:SetDamageType(DMG_BULLET)
local bt=traceline{start=h-d*2,endpos=h,mask=MASK_SHOT}
bt.Entity,bt.HitGroup=t,g
w:AfterShotFunction(bt,dmg,r,pe,dm,true)
t:DispatchTraceAttack(dmg,bt,d)
if su then SuppressHostEvents() end
end)
end