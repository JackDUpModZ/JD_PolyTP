Config = {}

Config.targetType = 'fivem-target' -- qtarget , bt-target , fivem-target
Config.WeatherSync = 'vsync' -- [easytime] == Codesign Easytime / [vsync] == vSync

Config.TPZones = {
    ['ems_1'] = {
        label = "Pillbox Ground Floor",
        icon = 'fas fa-helicopter',
        pos = vector4(331.3532, -595.4238, 43.28403, 250.268),
        destination = 'ems_2',
        ShellWeatherSync = false,
    },
    ['ems_2'] = {
        label = "Pillbox Roof Helipad",
        icon = 'fas fa-hospital',
        pos = vector4(338.567, -583.7258, 74.16563, 70.43237),
        destination = 'ems_1',
        ShellWeatherSync = false,
    },
    ['morgue_outside'] = {
        label = "Morgue Outside",
        icon = 'fas fa-procedures',
        pos = vector4(294.1169, -1449.003, 29.96638, 141.4044),
        destination = 'morgue_inside',
        ShellWeatherSync = false,
    },
    ['morgue_inside'] = {
        label = "Morgue",
        icon = 'fas fa-procedures',
        pos = vector4(275.8083, -1361.463, 24.5378, 230.4762),
        destination = 'morgue_outside',
        ShellWeatherSync = false,
    },
}

-- PRODUCED BY JackDUpModZ 2021/2022 
-- V1.0
-- https://discord.gg/qvWktZPgnQ
