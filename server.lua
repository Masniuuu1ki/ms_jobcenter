ESX = exports.es_extended.getSharedObject()


RegisterNetEvent("ms_jobcenter:setJob")
AddEventHandler("ms_jobcenter:setJob", function(jobName)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        local selectedJob = nil
        for _, job in pairs(Config.Jobs) do
            if job.jobName == jobName then
                selectedJob = job
                break
            end
        end

        if selectedJob and type(jobName) == "string" then
            xPlayer.setJob(jobName, 0)
            TriggerClientEvent('esx:showNotification', source, 'Zostałeś zatrudniony jako ' .. selectedJob.title)
        else
            print("nie mozna wczytac id")
        end
    else
        print("nie mozna znalezc id")
    end
end)
