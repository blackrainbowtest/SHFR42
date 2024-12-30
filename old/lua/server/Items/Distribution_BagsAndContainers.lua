-- require "Items/Distribution_BagsAndContainers"

-- BagsAndContainers = BagsAndContainers or {}

-- -- Инициализируем пустые таблицы, если они не существуют
-- BagsAndContainers.Farming = BagsAndContainers.Farming or { items = {} }
-- BagsAndContainers.Gardening = BagsAndContainers.Gardening or { items = {} }

-- -- Функция для добавления элементов в таблицу
-- local function addItemToTable(table, item, count)
--     table.insert(table.items, item)
--     table.insert(table.items, count)
-- end

-- -- Добавляем элементы в BagsAndContainers.Farming.items
-- addItemToTable(BagsAndContainers.Farming, "SHFR42.AppleBagSeed", 1)

-- -- Добавляем элементы в BagsAndContainers.Gardening.items
-- addItemToTable(BagsAndContainers.Gardening, "SHFR42.AppleBagSeed", 1)


-- require "Items/Distribution_BagsAndContainers"

-- if BagsAndContainers then
--     print('BagsAndContainers keys:')
--     for key, _ in pairs(BagsAndContainers) do
--         print(key)
--     end
-- else
--     print('BagsAndContainers is nil')
-- end

-- BagsAndContainers = BagsAndContainers

-- if BagsAndContainers then
--     print('BagsAndContainers keys:')
--     for key, _ in pairs(BagsAndContainers) do
--         print(key)
--     end
-- else
--     print('BagsAndContainers is nil')
-- end
