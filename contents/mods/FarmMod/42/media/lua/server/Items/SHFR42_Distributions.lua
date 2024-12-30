local SHFR_Items = {}

function SHFR_Items:getLunchboxItems(rarity)
    rarity = rarity or 3;

    local items = {{"SHFR42.AppleBagSeed", rarity}}

    return items or {}
end

return SHFR_Items
