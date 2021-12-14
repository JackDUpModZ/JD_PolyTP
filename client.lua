--BUILD EVENTS--
Citizen.CreateThread(function()
    for k,v in pairs(Config.TPZones) do
        print(v.pos.z)
		if Config.targetType == 'qtarget' then
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
		elseif Config.targetType == 'bt-target' then
			exports['bt-target']:AddBoxZone("TeleportZone"..k, v.pos.xyz, 1, 2, {
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
					distance = 1.5
				})
		elseif Config.targetType == 'fivem-target' then
			local pos = vector3(v.pos.x,v.pos.y,v.pos.z)
			local name = k
			local TPZones = {}
			exports["fivem-target"]:AddTargetPoint({
			name = name,
			label = "Door",
			icon = "fas fa-door-open",
			point = pos,
			interactDist = 2.5,
			onInteract = enterMorgue,
			options = {
				{
				name = "enter_morgue",
				label = "Enter"
				},           
			},
			vars = {
				label = "Go To".." "..Config.TPZones[v.destination].label.."",
				tp = v.destination,
				destLabel = Config.TPZones[v.destination].label,
				headingToTurnTo = v.pos.w
			}
			})
			table.insert(TPZones,name)
		end
	end
end)

enterMorgue = function(targetName,optionName,vars,entityHit)
    if optionName == "enter_morgue" then
        local pos = Config.TPZones[vars.tp].pos
		local entity = PlayerPedId()
        SetPedDesiredHeading(GetPlayerPed(-1), vars.headingToTurnTo)
        exports.rprogress:Start("Waiting On Access", '3000')
		SetEntityVisible(entity, false)
        DoScreenFadeOut()
        exports.rprogress:Start("Going To".." "..vars.destLabel.." Please Wait..", '5000')
        SetEntityCoords(GetPlayerPed(-1), pos.xyz)
        SetEntityHeading(GetPlayerPed(-1), pos.w -180.0)
        SetGameplayCamRelativeHeading(pos.w -180.0)
		SetEntityVisible(entity, true)
        DoScreenFadeIn()
    end
end

RegisterNetEvent('JD_PolyTP:TPLocation')
AddEventHandler('JD_PolyTP:TPLocation', function(data)
    local pos = Config.TPZones[data.tp].pos
    SetPedDesiredHeading(GetPlayerPed(-1), data.headingToTurnTo)
    exports.rprogress:Start("Waiting On Access", '3000')
	local entity = PlayerPedId()
	SetEntityVisible(entity, false)
    DoScreenFadeOut()
    exports.rprogress:Start("Going To".." "..data.destLabel.." Please Wait..", '5000')
    SetEntityCoords(entity, pos.xyz)
    SetEntityHeading(entity, pos.w -180.0)
    SetGameplayCamRelativeHeading(pos.w -180.0)
  	SetEntityVisible(entity, true)
    DoScreenFadeIn()
end)
