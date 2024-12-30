require 'Items/SuburbsDistributions'
require 'Items/ProceduralDistributions'
local SHFR_Items = require "Items/SHFR42_ItemsSpawn"

-- Переобразует таблицы в одну большую
function mergeTables(...)
    local mergedTable = {} -- Создаем новую пустую таблицу для объединенных данных

    -- Проходим по всем аргументам функции (каждый из которых должен быть таблицей!!!)
    for _, tbl in ipairs({...}) do
        -- Проходим по каждому элементу в текущей таблице
        for _, childTbl in ipairs(tbl) do
            for _, value in ipairs(childTbl) do
                -- Добавляем значение в объединенную таблицу
                table.insert(mergedTable, value)
            end
        end
    end

    return mergedTable -- Возвращаем объединенную таблицу
end

local function addSandboxLoot()
    local defaultLoot = 3;
    
    -- Обект редкости лута
    LootRarity = {
        Common = (SandboxVars.SHFR.SeedsCount or defaultLoot) * 4,
        Uncommon = (SandboxVars.SHFR.SeedsCount or defaultLoot) * 3,
        Rare = (SandboxVars.SHFR.SeedsCount or defaultLoot) * 2,
        VeryRare = (SandboxVars.SHFR.SeedsCount or defaultLoot) * 1,
        ExtraRare = (SandboxVars.SHFR.SeedsCount or defaultLoot) * 0.5,
        Elite = (SandboxVars.SHFR.SeedsCount or defaultLoot) * 0.01,
    }

    local suburbsDistribution = {
        -- общее
        all = {
            -- Crate контейнеры
            crate = {
                items = mergeTables(SHFR_Items:getLunchboxItems(LootRarity.VeryRare))
            },
            -- Zombie female inventory
            inventoryfemale = {
                items = {
                    
                }
            },
            -- Zombie male inventory
            inventorymale = {
                items = {
                    
                }
            },
            Outfit_Farmer = {
                items = mergeTables(SHFR_Items:getLunchboxItems(LootRarity.Rare))
            }
        },
        -- большая походная сумка
        Bag_BigHikingBag = {
            items = mergeTables(SHFR_Items:getLunchboxItems(LootRarity.VeryRare))
        },
        -- обычная походная сумка
        Bag_NormalHikingBag = {
            items = mergeTables(SHFR_Items:getLunchboxItems(LootRarity.ExtraRare))
        },
        -- сумка выжившего
        Bag_SurvivorBag = {
            items = mergeTables(SHFR_Items:getLunchboxItems(LootRarity.Rare))
        },
        -- Сумка с семенами
        SeedBag = {
            items = mergeTables(SHFR_Items:getLunchboxItems(LootRarity.Common))
        }
    }

    local proceduralDistribution = {
        list = {
            ArmyStorageMedical = {
                items = {
                    -- "Base.HeartRateMonitorLeft", LootRarity.ExtraRare,
                },
            },
            -- Фермерские ящики
            CrateFarming = {
                items = mergeTables(SHFR_Items:getLunchboxItems(LootRarity.Uncommon))
            },
            -- Магазин садоводства
            GardenStoreMisc = {
                items = mergeTables(SHFR_Items:getLunchboxItems(LootRarity.Common))
            },
            -- Гигамаркеты садоводства
            GigamartFarming = {
                items = mergeTables(SHFR_Items:getLunchboxItems(LootRarity.Common))
            },
            -- Усадьбы
            Homesteading = {
                items = mergeTables(SHFR_Items:getLunchboxItems(LootRarity.Rare))
            },
            -- Магазин инструментов
            ToolStoreFarming = {
                items = mergeTables(SHFR_Items:getLunchboxItems(LootRarity.Uncommon))
            },
            BakeryKitchenFridge = {
                items = {
                    -- "SHFR.TeaLeaves", LootRarity.Uncommon,
                }
            },
            BandPracticeFridge = {
                items = {

                }
            },
            BurgerKitchenFridge = {
                items = {

                }
            },
            CafeKitchenFridge = {
                items = {

                }
            },
            CrateTea = {
                items = {

                }
            },
            FridgeBreakRoom = {
                items = {

                }
            },
            FridgeGeneric = {
                items = {

                }
            },
            FridgeOffice = {
                items = {

                }
            },
            FridgeOther = {
                items = {

                }
            },
            FridgeRich = {
                items = {

                }
            },
            SpiffosKitchenFridge = {
                items = {

                }
            },
            SushiKitchenFridge = {
                items = {

                }
            },
            WesternKitchenFridge = {
                items = {

                }
            },
        }
    }

    -- Добавляем новые дистрибутивы лута в существующий общий дистрибутив.
    for somekey, somedata in pairs(suburbsDistribution) do
        if somekey == "all" then
            for location, data in pairs(suburbsDistribution[somekey]) do
                for _, value in ipairs(data.items) do
                    table.insert(SuburbsDistributions[somekey][location].items, value)
                end
            end
        else
            for _, value in ipairs(somedata.items) do
                table.insert(SuburbsDistributions[somekey].items, value)
            end
        end
    end

    -- Добавляем новые дистрибутивы лута в существующий общий дистрибутив.
    for location, data in pairs(proceduralDistribution.list) do
        for _, value in ipairs(data.items) do
            table.insert(ProceduralDistributions['list'][location].items, value);
        end
    end

    -- Иницируем парсинг
    ItemPickerJava.doParse = true
end

-- Считывает и перезагружает спавны, таким образом, он должен учитывать настройки песочницы.
local function parseTables()
    if ItemPickerJava.doParse then
        ItemPickerJava.Parse()
        ItemPickerJava.doParse = nil
    end
end

Events.OnInitGlobalModData.Add(addSandboxLoot)
Events.OnLoadedMapZones.Add(parseTables)
