ESX = nil


ingeklokt, injob = false, false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

--[[
    Made by Lowsocket,
    Quad Development,
    All rights reserved this wil not fuck up you're script
]]



Citizen.CreateThread(function()
    while true do 
        Wait(3)
        local ped , coords = PlayerPedId(), GetEntityCoords(PlayerPedId())
        local sleep = true
        for k,v in pairs(markers) do 
            local x,y,z = table.unpack(v.coords)
            local dist = #(vector3(x,y,z) - coords)

            if dist < 10 then
                sleep = false
                if v.ingeklokt then
                    if not ingeklokt then 
                        break 
                    end 
                end
                DrawMarker(1,x,y,z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 0.9, 144, 238, 208, 100, false, true, 2, true, nil, nil, false)


                if dist < 1.5 then 
                    ESX.ShowHelpNotification('Klik ~INPUT_CONTEXT~ ' .. v.text)
                    if (IsControlJustReleased(0, 38)) then 
                        TriggerEvent(v.trigger)
                    end
                end
            end
        end 
        if sleep then 
            Wait(500)
        end
    end
end)


menuData = {
    {label = "Laad truck in", value = true},
    {label = "Burger kleding", value = false}
}

RegisterNetEvent("cn-witwas:client:openMenu")
AddEventHandler("cn-witwas:client:openMenu", function()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mn-scripts', {
        title = "Witwas",
        align = "top-right",
        elements = menuData
    }, function(data, menu)
        ingeklokt = data.current.value 
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end)


function RandomNumber()
    return math.random(1,50)
end

RegisterNetEvent("cn-witwas:client:spawnVehicle")
AddEventHandler("cn-witwas:client:spawnVehicle", function()
    if not injob then 
        local x,y,z,h = table.unpack(vehicleSpawnLocation)
        ESX.Game.SpawnVehicle("mule", vector3(x,y,z), h, function(veh) 
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            local plate = GetVehicleNumberPlateText(veh)
            local myPos = GetEntityCoords(PlayerPedId())
            if RandomNumber() < 15 then 
                TriggerServerEvent('gcPhone:tchat_addMessage', "witwas", "Er is een witwas run gestart vanuit het  Voertuig: nspeedo | Kenteken: " .. plate .." | Locatie: "..myPos.x..", "..myPos.y.."") -- Darkweb message
            end
            injob = true
            startRun()
            ESX.ShowNotification("~r~Witwassen met je auto is streng verboden! Enkel jou eigen busje is toegestaan.") 
        end)
    end
end)



RegisterNetEvent("cn-witwas:client:noMoreMoney")
AddEventHandler("cn-witwas:client:noMoreMoney", function()
    ESX.ShowNotification("~r~Al uw geld is gewassen keer terug naar de startlocatie") 
    injob = false
end)


createBlip = function(coords) 
    local x,y,z = table.unpack(coords)
    if not DoesBlipExist(blip) then 
        blip = AddBlipForCoord(x, y, z)
        SetBlipSprite(blip, 1)
        SetBlipColour(blip, 5)
        SetBlipRoute(blip, true)
        SetBlipScale(blip, 0.8)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Witwas locatie')
        EndTextCommandSetBlipName(blip)
    else
        RemoveBlip(blip)

        blip = AddBlipForCoord(x, y, z)
        SetBlipSprite(blip, 1)
        SetBlipColour(blip, 5)
        SetBlipRoute(blip, true)
        SetBlipScale(blip, 0.8)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Witwas locatie')
        EndTextCommandSetBlipName(blip)
    end
end

startRun = function()
    index = math.random(1, #deliverData)
    createBlip(deliverData[index].coords)
    Citizen.CreateThread(function()
        while injob do 
            Wait(3)
            local ped , coords = PlayerPedId(), GetEntityCoords(PlayerPedId())
            local x,y,z = table.unpack(deliverData[index].coords)
            local dist = #(vector3(x,y,z) - coords)
            local veh = GetVehiclePedIsIn(PlayerPedId(), true)
            local plate = GetVehicleNumberPlateText(veh)
            local myPos = GetEntityCoords(PlayerPedId())

            if dist < 10 then 
                DrawMarker(1,x,y,z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 0.9, 144, 238, 208, 100, false, true, 2, true, nil, nil, false)

                if dist < 1.5 then 
                    ESX.ShowHelpNotification('Klik ~INPUT_CONTEXT~ om te wassen')
                    
                    if IsControlJustReleased(0, 38) then 
                        ESX.TriggerServerCallback("cn-witwas:server:wasMoney", function(x)
                            if x then
                                index = math.random(1, #deliverData) 
                                createBlip(deliverData[index].coords)
                                if RandomNumber() < 15 then 
                                    TriggerServerEvent('gcPhone:tchat_addMessage', "witwasser", "Er is een witwas run afgerond, ze zijn onderweg naar een nieuwe locatie | Voertuig: nspeedo | Kenteken: " .. plate .." | Locatie: "..myPos.x..", "..myPos.y.."") -- Darkweb message
                                end
                            else
                                injob = false
                                ESX.ShowNotification("~r~Je hebt geen geld meer skeere flikker, ga je auto terug brengen")
                                RemoveBlip(blip)
                            end
                        end)
                    end
                end
            end
        end
    end)
end

RegisterNetEvent("cn-witwas:client:despawnVehicle")
AddEventHandler("cn-witwas:client:despawnVehicle", function()
    ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
    injob = false
    RemoveBlip(blip)
end)


RegisterNetEvent("cn-witwas:client:notification")
AddEventHandler("cn-witwas:client:notification", function(msg)
    ESX.ShowNotification(msg)
end)