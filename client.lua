local function LoadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(500)
    end
end

local function tworzeniepeda()
    LoadModel(Config.PedModel)
    
    local ped = CreatePed(4, GetHashKey(Config.PedModel), Config.PedCoords.x, Config.PedCoords.y, Config.PedCoords.z - 1.0, Config.PedCoords.w, false, true)

    SetEntityAsMissionEntity(ped, true, true)
    SetPedFleeAttributes(ped, 0, false)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)

    exports.qtarget:AddBoxZone("ped_interaction_zone", Config.TargetZone.coords, Config.TargetZone.size.x, Config.TargetZone.size.y, {
        name = "ped_interaction_zone",
        heading = Config.TargetZone.heading,
        debugPoly = false,
        minZ = Config.TargetZone.minZ,
        maxZ = Config.TargetZone.maxZ
    }, {
        options = {
            {
                event = "ms_jobcenter:opencenter",
                icon = "fas fa-sign-in-alt", -- ikona
                label = "Otwórz Job Center", -- nazwa targeta
            },
        },
        distance = 3.5
    })
end

RegisterNetEvent("ms_jobcenter:opencenter")
AddEventHandler("ms_jobcenter:opencenter", function()
    local jobs = Config.Jobs

    SetNuiFocus(true, true)

    SendNUIMessage({
        action = "updateJobs",
        jobs = jobs
    })
end)

RegisterNUICallback("closeUI", function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close"
    })
    cb("ok")
end)

RegisterNUICallback("jobSelected", function(data, cb)
    if data.jobName and type(data.jobName) == "string" then
        TriggerServerEvent('ms_jobcenter:setJob', data.jobName)

        SetNuiFocus(false, false)
        SendNUIMessage({
            action = "close"
        })

        cb("ok")
    else
        print("Nie można zczytać JobName")
    end
end)

tworzeniepeda()