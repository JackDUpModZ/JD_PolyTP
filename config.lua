Config = {}

Config.targetType = 'qtarget' -- qtarget , bt-target , fivem-target

Config.TPZones = {
    ['ems_1'] = {
        label = "Pillbox Ground Floor",
        icon = 'fas fa-helicopter',
        pos = vector4(327.1104, -603.7758, 43.28402, 163.2705),
        destination = 'ems_2',
    },
    ['ems_2'] = {
        label = "Pillbox Roof Helipad",
        icon = 'fas fa-hospital',
        pos = vector4(338.567, -583.7258, 74.16563, 70.43237),
        destination = 'ems_1',
    },
    ['morgue_outside'] = {
        label = "Morgue Outside",
        icon = 'fas fa-procedures',
        pos = vector4(294.1169, -1449.003, 29.96638, 141.4044),
        destination = 'morgue_inside',
    },
    ['morgue_inside'] = {
        label = "Morgue",
        icon = 'fas fa-procedures',
        pos = vector4(275.8083, -1361.463, 24.5378, 230.4762),
        destination = 'morgue_outside',
    },
}
