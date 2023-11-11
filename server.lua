ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('gcPhone:tchat_addMessage')
AddEventHandler('gcPhone:tchat_addMessage', function(channel, message)
  TchatAddMessage(channel, message)
end)

max = 25000
ESX.RegisterServerCallback("cn-witwas:server:wasMoney", function(source, callback)
    local src = source 
    local user = ESX.GetPlayerFromId(src)
    local black_money = user.getAccount("black_money").money
    local x = 0
    if black_money >= max then 
        x = max 
    else
        x = black_money
    end
    if x > 0 then 
        user.removeAccountMoney('black_money', x)
        TriggerClientEvent("cn-witwas:client:notification", src, "~g~U heeft succesvol " .. x .. " euro gewassen")
        user.addMoney(x)
        callback(true)
        
    else
        callback(false)
        TriggerClientEvent("cn-witwas:client:notification", src, "~r~ speler jij hebt geen geld")
    end
end)