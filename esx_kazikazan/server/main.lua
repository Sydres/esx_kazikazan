ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('kazikazan', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('kazikazan', 1)
	TriggerClientEvent("esx_inventoryhud:envanterKapat", source)
	Citizen.Wait(600)
	TriggerClientEvent('esx_kazikazan:onStart', _source)
end)

RegisterServerEvent('esx_kazikazan:withdraw')
AddEventHandler('esx_kazikazan:withdraw', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	amount = tonumber(amount)

	xPlayer.addMoney(amount)
end)