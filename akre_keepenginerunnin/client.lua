local function exitVehicleKeepEngineOn()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= 0 then
        local wasEngineRunning = GetIsVehicleEngineRunning(vehicle)
        TaskLeaveVehicle(playerPed, vehicle, 0)
        Wait(1000)
        if wasEngineRunning then
            SetVehicleEngineOn(vehicle, true, true, false)
        end
    end
end

CreateThread(function()
    while true do
        Wait(500)
        if IsControlPressed(0, 75) then
            local playerPed = PlayerPedId()
            if IsPedInAnyVehicle(playerPed, false) then
                exitVehicleKeepEngineOn()
                Wait(3000)
            end
        end
    end
end)