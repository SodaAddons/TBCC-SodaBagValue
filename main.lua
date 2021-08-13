local button = CreateFrame("Button", "MyButton", ContainerFrame1, "UIPanelButtonTemplate")
button:SetPoint("TOPLEFT", 50, -27)
button:SetSize(20, 20)


myArray = {}
totalSlots = 0
currentIndex = 1

trashTotal = 0
--[[whiteTotal = 0
greenTotal = 0--]]

button:SetScript("OnClick", function(self)
    for i = 0, NUM_BAG_SLOTS do
        local numberOfSlots = GetContainerNumSlots(i);
        local bagName = GetBagName(i);

        for j = numberOfSlots, 1, -1 do
            
            totalSlots = totalSlots + 1

            itemId = GetContainerItemLink(i, j);
            if (itemId ~= nil) then
              itemName, itemLink, itemRarity, _, _, itemType, _, _, _, _, itemSellPrice = GetItemInfo(itemId)
              texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(i, j);
              if (itemRarity < 1 and itemType ~= "Consumable") then
                itemvalue = GetCoinText(itemSellPrice, " ");
                itemstackvalue = GetCoinText(itemCount * itemSellPrice, " ");
                trashTotal = trashTotal + (itemSellPrice * itemCount)
              end
            end
            
        end
        
    end
    formattedAmount = GetCoinText(trashTotal, " ");
    printToAllChatWindows(formattedAmount)
    trashTotal = 0
end)