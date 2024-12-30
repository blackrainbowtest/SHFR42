require "Farming/farming_vegetableconf"

-- Apple
farming_vegetableconf.props["Apple"] = {
    icon = "Item_Apple",
    texture = "Appleplant_07",
--     waterLvl = 35,
    waterLvl = 30,
    waterNeeded = 70,
--     timeToGrow = 432,
    timeToGrow = 960,
    minVeg = 2,
    maxVeg = 4,
    minVegAutorized = 6,
    maxVegAutorized = 8,
    vegetableName =  "Base.Apple",
    -- produceExtra =  "Base.HayTuft",
    seedName = "SHFR42.AppleSeed",
    -- seedTypes = { "SHFR42.AppleSeed",}, -- несколько типы семян
    badMonth = { 6, 7 },
    sowMonth = { 8, 9, 10 },
    bestMonth = { 9 },
    riskMonth = { 10 },
    seasonRecipe = "Apple Growing Season",
    harvestLevel = 6,
    mature = 5,
    fullGrown = 6,
    scytheHarvest = true,
    harvestPosition = "High",
--     coldHardy = true,
    growBack = 4,
    -- слизни могут съесть
    slugsProof = true,
    -- болезнь мучнистой росы
    mothFood = true,
    -- тлятая болезнь
    aphidsBane = true,
    -- болезнь мучнистой росы
    fliesBane = true,
    -- могут съесть кролики
    rabbitBane = true,
    -- холодостойкость
    coldHardy = true,
    group = "IGUI_BTSE.Farming_Group_Fruits"
}
