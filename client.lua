--BUILD EVENTS--
Citizen.CreateThread(function()
    for k,v in pairs(Config.TPZones) do
        print(v.pos.z)
        exports.qtarget:AddBoxZone("TeleportZone"..k, v.pos.xyz, 1, 2, {
			name="TeleportZone"..k,
			heading= v.pos.w,
			debugPoly=false,
			minZ= v.pos.z -1,
			maxZ= v.pos.z +1,
			}, {
				options = {
					{
						event = "JD_PolyTP:TPLocation",
						icon = v.icon,
						label = "Go To".." "..Config.TPZones[v.destination].label.."",
                        tp = v.destination,
                        destLabel = Config.TPZones[v.destination].label,
                        headingToTurnTo = v.pos.w
					},
				},
			distance = 3.5
		})
	end
end)

RegisterNetEvent('JD_PolyTP:TPLocation')
AddEventHandler('JD_PolyTP:TPLocation', function(data)
    local pos = Config.TPZones[data.tp].pos
    SetPedDesiredHeading(GetPlayerPed(-1), data.headingToTurnTo)
    exports.rprogress:Start("Waiting On Access", '3000')
    DoScreenFadeOut()
    exports.rprogress:Start("Going To".." "..data.destLabel.." Please Wait..", '5000')
    SetEntityCoords(GetPlayerPed(-1), pos.xyz)
    SetEntityHeading(GetPlayerPed(-1), pos.w -180.0)
    SetGameplayCamRelativeHeading(pos.w -180.0)
    DoScreenFadeIn()
end)