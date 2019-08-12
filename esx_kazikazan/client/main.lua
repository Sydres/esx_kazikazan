------------------------------------
--- Kazı Kazan, jAw   ---
------------------------------------
local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                           = nil
local PlayerData              = {}
local kazanc 				  = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('esx_kazikazan:onStart')
AddEventHandler('esx_kazikazan:onStart', function()
  SetNuiFocus(true, true)
  SendNUIMessage({
      action = "openui"
  })
end)

RegisterNUICallback('reward', function(data, cb)
kazanc = data.price
    if kazanc then
      TriggerServerEvent('esx_kazikazan:withdraw', data.price)
	  exports.pNotify:SendNotification(
							{
								text = ("Tebrikler! Kazı Kazandan $" .. data.price .. " kazandın"),
								type = "info",
								theme = "metroui",
								timeout = 3000,
								layout = "topRight"
							}
						)
      --exports['mythic_notify']:DoHudText('inform', 'Tebrikler Kazı Kazandan $' ..data.price.. ' Dolar Kazandınız')
    else
	exports.pNotify:SendNotification(
							{
								text = ("Kazı kazandan hiçbir şey kazanamadın"),
								type = "error",
								theme = "metroui",
								timeout = 3000,
								layout = "topRight"
							}
						)
     -- exports['mythic_notify']:DoHudText('error', 'Kazı kazandan hiç birşey kazanamadın.')
    end
    SetNuiFocus(false, false)
  
    SendNUIMessage({
      action = "closeui"
    })
end)

RegisterNUICallback('escape', function(data, cb)
   
    SetNuiFocus(false, false)
  
    SendNUIMessage({
      action = "closeui"
    })
end)