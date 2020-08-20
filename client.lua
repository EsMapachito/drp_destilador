-- RECURSO CREADO PARA EL SERVIDOR RP DESPERADOSRP.COM --
-- Implementado por Mapachito.

local tent = 0

RegisterCommand('destilador', function(source, args, rawCommand)
    if tent ~= 0 then
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        tent = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "Preparando destilador")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("p_still04x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    tent = prop
end, false)

RegisterCommand('-destilador', function(source, args, rawCommand)
    if tent == 0 then
        print("No hay ningun destilador cerca.")
    else
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        tent = 0
    end
end, false)