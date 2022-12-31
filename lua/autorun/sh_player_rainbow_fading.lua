local addonName = 'Player Rainbow Fading'

-- gLua Refresh Protection
pAddons = pAddons or {}
if pAddons[ addonName ] then return end
pAddons[ addonName ] = true

if CLIENT then

    CreateClientConVar( 'colorfade_enable', 0, true, true, 'Makes your character glow like a Mario after eating a star (Works only with colorable models)', 0, 1 )
    CreateClientConVar( 'colorfade_speed', 50, true, true, 'Changing the speed of fading', 0, 9999 )

end

if SERVER then

    local HSVToColor = HSVToColor
    local CurTime = CurTime
    local Vector = Vector

    hook.Add('PlayerPostThink', addonName, function( ply )
        if ply:GetInfoNum( 'colorfade_enable', 0 ) == 1 and ply:Alive() then
            local color = HSVToColor( (CurTime() * ply:GetInfoNum( 'colorfade_speed', 20 )) % 360, 1, 1 )
            ply:SetPlayerColor( Vector( color.r / 255, color.g / 255, color.b / 255 ) )
        end
    end)

end