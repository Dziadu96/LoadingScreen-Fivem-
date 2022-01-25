--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS


ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local loadingStatus = 0
local loadingPosition = nil

local awayTimer = 0
local awayThread = nil
local aspectThread = nil
local _in = Citizen.InvokeNative

AddEventHandler('elfeedoo.exe:loading', function(cb)
	cb(loadingStatus)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	print('[StarLeaks.exe] Postać załadowana')
	if not loadingPosition then
		ESX.UI.HUD.SetDisplay(0.0)

		local update = true
		if xPlayer.loadPosition then
			local t = type(xPlayer.loadPosition)
			if t == 'table' or t == 'vec3' or t == 'vec4' then
				update = false
				loadingPosition = xPlayer.loadPosition
			end
		end

		loadingStatus = 1
		if update then
			loadingPosition = {x = -1044.5974, y = -2749.9673, z = 20.4134}
		end

		local ped = PlayerPedId()
		SetEntityVisible(ped, false)
		SetPlayerInvincible(PlayerId(), true)

		FreezeEntityPosition(ped, true)
		SetEntityCoords(ped, -1427.299, -245.1012, 16.8039)
		print('[StarLeaks.exe] Przeniesiono do poczekalni')
	end
end)

AddEventHandler('skinchanger:modelLoaded', function()
	print('[StarLeaks.exe] Model załadowany')
	ModelLoaded()
end)

AddEventHandler('elfeedoo.exe:passthrough', function()
	print('[StarLeaks.exe] Nowy gracz, ładowanie')
	ModelLoaded()
end)

function ModelLoaded()
	if loadingStatus < 2 then
		Citizen.CreateThreadNow(function()
			print('[StarLeaks.exe] Oczekiwanie na załadowanie postaci')
			while not loadingPosition do
				Citizen.Wait(0)
			end

			Citizen.Wait(1000)
			loadingStatus = 2
			SendLoadingScreenMessage(json.encode({allow = true}))
			print('[StarLeaks.exe] Odblokowano wejście (LPM)')
		end)
	end
end

Citizen.CreateThread(function()
	SetManualShutdownLoadingScreenNui(true)
	StartAudioScene("MP_LEADERBOARD_SCENE")
	SendLoadingScreenMessage(json.encode({ready = true}))

	TriggerEvent('chat:display', false)
	while true do
		Citizen.Wait(0)
		if loadingStatus == 2 and IsControlJustPressed(0, 18) then
			StarLeaks()
			break
		end
	end
end)

RegisterCommand('lpm', function(source, args, raw)
	if loadingStatus == 2 then
		Citizen.CreateThreadNow(StarLeaks)
	else
		awayTimer = 0
		if awayThread then
			TerminateThread(awayThread)
			awayThread = nil
		end
	end
end, false)

function StarLeaks()
	PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

	local ped = PlayerPedId()
	SetEntityCoords(ped, loadingPosition.x, loadingPosition.y, loadingPosition.z)
	Citizen.Wait(0)

	ped = PlayerPedId()
	if loadingPosition.heading then
		SetEntityHeading(ped, loadingPosition.heading)
	end

	FreezeEntityPosition(ped, false)
	SetEntityVisible(ped, true)
	SetPlayerInvincible(PlayerId(), false)
	SetPedMaxHealth(ped, 200)

	DoScreenFadeOut(0)
	ShutdownLoadingScreen()
	ShutdownLoadingScreenNui()

	loadingStatus = 3
	StopAudioScene("MP_LEADERBOARD_SCENE")
	Citizen.Wait(1000)

	DoScreenFadeIn(1000)
	while IsScreenFadingIn() do
		Citizen.Wait(0)
	end

	ESX.UI.HUD.SetDisplay(1.0)
	TriggerEvent('chat:display', true)
	TriggerEvent('chat:clear')

	Citizen.Wait(1000)
	_in(0x10D373323E5B9C0D)
end

--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS

--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
--https://discord.gg/XHTBdFcfNP STAR LEAKS
