Config = {}

Config.PedModel = "s_m_y_cop_01" 

Config.PedCoords = vector4(-517.4479, -211.2477, 38.1690, 121.3468)

Config.TargetZone = {
    coords = vector3(-517.44, -211.24, 38.16),
    size = vector3(3.0, 0.8, 1.0),
    heading = 0.0,
    maxZ = 28.23
}


Config.Jobs = {
    {
        title = "LSPD", -- Tytuł w UI
        jobName = "police", -- Nazwa joba
        salary = "5000$", -- Kwota w UI
        description = "Testowy Opis, Testowy Opis.", -- Opis w UI
        image = "images/work1.png" -- Zdjęcie w UI
    },
    {
        title = "EMS",
        jobName = "ambulance",
        salary = "6000$",
        description = "Testowy Opis, Testowy Opis.",
        image = "images/work2.png"
    },
    {
        title = "LSC",
        jobName = "mechanic",
        salary = "4000$",
        description = "Testowy Opis, Testowy Opis.",
        image = "images/work3.png"
    }
}
