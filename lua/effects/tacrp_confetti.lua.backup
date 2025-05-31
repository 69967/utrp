function EFFECT:Init( data )

    local vOffset = data:GetOrigin()
    local dir = data:GetAngles()
    local velocity = data:GetMagnitude()
    local spread = data:GetScale()

    // sound.Play( "tacrp/kids_cheering.mp3", vOffset, 80, 100 )

    local NumParticles = 100

    local emitter = ParticleEmitter( vOffset, true )

    local forward, up, right = dir:Forward(), dir:Up(), dir:Right()

    for i = 0, NumParticles do

        local oDir = Angle(dir)
        local a = math.Rand(0, 360)
        local angleRand = Angle(math.sin(a), math.cos(a), 0)
        angleRand:Mul(spread * math.Rand(0, 45) * 1.4142135623730)

        oDir:RotateAroundAxis(right, angleRand.p)
        oDir:RotateAroundAxis(up, angleRand.y)
        oDir:RotateAroundAxis(forward, angleRand.r)

        local particle = emitter:Add( "particles/balloon_bit", vOffset + VectorRand(spread) )
        if ( particle ) then

            particle:SetVelocity( oDir:Forward() * math.Rand(0.5, 1) * velocity)

            particle:SetLifeTime( 0 )
            particle:SetDieTime( 10 )

            particle:SetStartAlpha( 255 )
            particle:SetEndAlpha( 255 )

            local Size = math.Rand( 1.5, 3 )
            particle:SetStartSize( Size )
            particle:SetEndSize( 0 )

            particle:SetRoll( math.Rand( 0, 360 ) )
            particle:SetRollDelta( math.Rand( -2, 2 ) )

            particle:SetAirResistance( 50 )
            particle:SetGravity( Vector( 0, 0, -75 ) )

            particle:SetColor( math.Rand(50, 255), math.Rand(50, 255), math.Rand(50, 255) )

            particle:SetCollide( true )

            particle:SetAngleVelocity( Angle( math.Rand( -160, 160 ), math.Rand( -160, 160 ), math.Rand( -160, 160 ) ) )

            particle:SetBounce( 0.7 )
            particle:SetLighting( true )
        end
    end
    emitter:Finish()
end

function EFFECT:Think()
    return false
end

function EFFECT:Render()
end