require "NPCs/BaseGameCharacterDetails"

-- Получаем существующие профессии gardener и farmer
local gardener = ProfessionFactory.getProfession("gardener")
local farmer = ProfessionFactory.getProfession("farmer")

-- Добавляем рецепт для gardener
if gardener then
    gardener:getFreeRecipes():add("Apple Growing Season")
end

-- Добавляем рецепт для farmer
if farmer then
    farmer:getFreeRecipes():add("Apple Growing Season")
end