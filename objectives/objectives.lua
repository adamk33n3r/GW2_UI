local _, GW = ...
local RoundDec = GW.RoundDec
local lerp = GW.lerp
local GetSetting = GW.GetSetting
local CommaValue = GW.CommaValue
local animations = GW.animations
local AddToAnimation = GW.AddToAnimation
local IsIn = GW.IsIn
local TRACKER_TYPE_COLOR = GW.TRACKER_TYPE_COLOR

local questInfo = {}

local function IsQuestAutoTurnInOrAutoAccept(blockQuestID, checkType)
    for i = 1, GetNumAutoQuestPopUps() do
        local questID, popUpType = GetAutoQuestPopUp(i)
        if blockQuestID and questID and popUpType and popUpType == checkType and blockQuestID == questID then
            return true
        end
    end

    return false
end

local function wiggleAnim(self)
    if self.animation == nil then
        self.animation = 0
    end
    if self.doingAnimation == true then
        return
    end
    self.doingAnimation = true
    AddToAnimation(
        self:GetName(),
        0,
        1,
        GetTime(),
        2,
        function()
            local prog = animations[self:GetName()].progress

            self.flare:SetRotation(lerp(0, 1, prog))

            if prog < 0.25 then
                self.texture:SetRotation(lerp(0, -0.5, math.sin((prog / 0.25) * math.pi * 0.5)))
                self.flare:SetAlpha(lerp(0, 1, math.sin((prog / 0.25) * math.pi * 0.5)))
            end
            if prog > 0.25 and prog < 0.75 then
                self.texture:SetRotation(lerp(-0.5, 0.5, math.sin(((prog - 0.25) / 0.5) * math.pi * 0.5)))
            end
            if prog > 0.75 then
                self.texture:SetRotation(lerp(0.5, 0, math.sin(((prog - 0.75) / 0.25) * math.pi * 0.5)))
            end

            if prog > 0.25 then
                self.flare:SetAlpha(lerp(1, 0, ((prog - 0.25) / 0.75)))
            end
        end,
        nil,
        function()
            self.doingAnimation = false
        end
    )
end
GW.AddForProfiling("objectives", "wiggleAnim", wiggleAnim)

local function NewQuestAnimation(block)
    block.flare:Show()
    block.flare:SetAlpha(1)
    AddToAnimation(
        block:GetName() .. "flare",
        0,
        1,
        GetTime(),
        1,
        function(step)
            block:SetWidth(300 * step)
            block.flare:SetSize(300 * (1 - step), 300 * (1 - step))
            block.flare:SetRotation(2 * step)

            if step > 0.75 then
                block.flare:SetAlpha((step - 0.75) / 0.25)
            end
        end,
        nil,
        function()
            block.flare:Hide()
        end
    )
end
GW.NewQuestAnimation = NewQuestAnimation

local function ParseSimpleObjective(text)
    local itemName, numItems, numNeeded = string.match(text, "(.*):%s*([%d]+)%s*/%s*([%d]+)")

    if itemName == nil then
        numItems, numNeeded, _ = string.match(text, "(%d+)/(%d+) (%S+)")
    end
    local ndString = ""

    if numItems ~= nil then
        ndString = numItems
    end

    if numNeeded ~= nil then
        ndString = ndString .. "/" .. numNeeded
    end

    return string.gsub(text, ndString, "")
end
GW.ParseSimpleObjective = ParseSimpleObjective

local function ParseCriteria(quantity, totalQuantity, criteriaString)
    if quantity ~= nil and totalQuantity ~= nil and criteriaString ~= nil then
        if totalQuantity == 0 then
            return string.format("%d %s", quantity, criteriaString)
        else
            return string.format("%d/%d %s", quantity, totalQuantity, criteriaString)
        end
    end

    return criteriaString
end
GW.ParseCriteria = ParseCriteria

local function ParseObjectiveString(block, text, objectiveType, quantity, numItems, numNeeded)
    if objectiveType == "progressbar" then
        block.StatusBar:SetMinMaxValues(0, 100)
        block.StatusBar:SetValue(quantity or 0)
        block.StatusBar:Show()
        block.StatusBar.precentage = true
        return true
    end
    block.StatusBar.precentage = false

    local numItems, numNeeded = numItems, numNeeded
    if not numItems and not numNeeded then
        _, numItems, numNeeded = string.match(text, "(.*):%s*([%d]+)%s*/%s*([%d]+)")
        if numItems == nil then
            numItems, numNeeded, _ = string.match(text, "(%d+)/(%d+) (%S+)")
        end
    end
    numItems = tonumber(numItems)
    numNeeded = tonumber(numNeeded)

    if numItems ~= nil and numNeeded ~= nil and numNeeded > 1 and numItems < numNeeded then
        block.StatusBar:Show()
        block.StatusBar:SetMinMaxValues(0, numNeeded)
        block.StatusBar:SetValue(numItems)
        block.progress = numItems / numNeeded
        return true
    end
    return false
end
GW.ParseObjectiveString = ParseObjectiveString

local function FormatObjectiveNumbers(text)
    local itemName, numItems, numNeeded = string.match(text, "(.*):%s*([%d]+)%s*/%s*([%d]+)")

    if itemName == nil then
        numItems, numNeeded, itemName = string.match(text, "(%d+)/(%d+) ((.*))")
    end
    numItems = tonumber(numItems)
    numNeeded = tonumber(numNeeded)

    if numItems ~= nil and numNeeded ~= nil then
        return CommaValue(numItems) .. " / " .. CommaValue(numNeeded) .. " " .. itemName
    end
    return text
end
GW.FormatObjectiveNumbers = FormatObjectiveNumbers

local function setBlockColor(block, string)
    block.color = TRACKER_TYPE_COLOR[string]
end
GW.setBlockColor = setBlockColor
GW.AddForProfiling("objectives", "setBlockColor", setBlockColor)

local function statusBar_OnShow(self)
    local f = self:GetParent()
    if not f then
        return
    end
    f:SetHeight(50)
    f.StatusBar.statusbarBg:Show()
end
GW.AddForProfiling("objectives", "statusBar_OnShow", statusBar_OnShow)

local function statusBar_OnHide(self)
    local f = self:GetParent()
    if not f then
        return
    end
    f:SetHeight(20)
    f.StatusBar.statusbarBg:Hide()
end
GW.AddForProfiling("objectives", "statusBar_OnHide", statusBar_OnHide)

local function statusBarSetValue(self)
    local f = self:GetParent()
    if not f then
        return
    end
    local _, mx = f.StatusBar:GetMinMaxValues()
    local v = f.StatusBar:GetValue()
    local width = math.max(1, math.min(10, 10 * ((v / mx) / 0.1)))
    f.StatusBar.Spark:SetPoint("RIGHT", f.StatusBar, "LEFT", 280 * (v / mx), 0)
    f.StatusBar.Spark:SetWidth(width)
    if f.StatusBar.precentage == nil or f.StatusBar.precentage == false then
        f.StatusBar.progress:SetText(v .. " / " .. mx)
    else
        f.StatusBar.progress:SetText(math.floor((v / mx) * 100) .. "%")
    end
end
GW.AddForProfiling("objectives", "statusBarSetValue", statusBarSetValue)

local function CreateObjectiveNormal(name, parent)
    local f = CreateFrame("Frame", name, parent, "GwQuesttrackerObjectiveNormal")
    f.ObjectiveText:SetFont(UNIT_NAME_FONT, 12)
    f.ObjectiveText:SetShadowOffset(-1, 1)
    f.StatusBar.progress:SetFont(UNIT_NAME_FONT, 11)
    f.StatusBar.progress:SetShadowOffset(-1, 1)
    if f.StatusBar.animationOld == nil then
        f.StatusBar.animationOld = 0
    end
    f.StatusBar:SetScript("OnShow", statusBar_OnShow)
    f.StatusBar:SetScript("OnHide", statusBar_OnHide)
    hooksecurefunc(f.StatusBar, "SetValue", statusBarSetValue)

    return f
end
GW.CreateObjectiveNormal = CreateObjectiveNormal

local function blockOnEnter(self)
    if not self.hover then
        self.oldColor = {}
        self.oldColor.r, self.oldColor.g, self.oldColor.b = self:GetParent().Header:GetTextColor()
        self:GetParent().Header:SetTextColor(self.oldColor.r * 2, self.oldColor.g * 2, self.oldColor.b * 2)

        self = self:GetParent()
    end

    self.hover:Show()
    if self.objectiveBlocks == nil then
        self.objectiveBlocks = {}
    end
    for _, v in pairs(self.objectiveBlocks) do
        v.StatusBar.progress:Show()
    end
    AddToAnimation(
        self:GetName() .. "hover",
        0,
        1,
        GetTime(),
        0.2,
        function(step)
            self.hover:SetAlpha(step - 0.3)
            self.hover:SetTexCoord(0, step, 0, 1)
        end
    )
    if self.event then
        BonusObjectiveTracker_ShowRewardsTooltip(self)
    end
end

local function blockOnLeave(self)
    if not self.hover then
        if self.oldColor ~= nil then
            self:GetParent().Header:SetTextColor(self.oldColor.r, self.oldColor.g, self.oldColor.b)
        end

        self = self:GetParent()
    end

    self.hover:Hide()
    if self.objectiveBlocks == nil then
        self.objectiveBlocks = {}
    end
    for _, v in pairs(self.objectiveBlocks) do
        v.StatusBar.progress:Hide()
    end
    if animations[self:GetName() .. "hover"] then
        animations[self:GetName() .. "hover"].complete = true
    end
    GameTooltip_Hide()
end

local function CreateTrackerObject(name, parent)
    local f = CreateFrame("Button", name, parent, "GwQuesttrackerObject")
    f.Header:SetFont(UNIT_NAME_FONT, 14)
    f.SubHeader:SetFont(UNIT_NAME_FONT, 12)
    f.Header:SetShadowOffset(1, -1)
    f.SubHeader:SetShadowOffset(1, -1)
    f:SetScript("OnEnter", blockOnEnter)
    f:SetScript("OnLeave", blockOnLeave)
    f.clickHeader:SetScript("OnEnter", blockOnEnter)
    f.clickHeader:SetScript("OnLeave", blockOnLeave)
    f.turnin:SetScript(
        "OnShow",
        function(self)
            self:SetScript("OnUpdate", wiggleAnim)
        end
    )
    f.turnin:SetScript(
        "OnHide",
        function(self)
            self:SetScript("OnUpdate", nil)
        end
    )
    f.popupQuestAccept:SetScript(
        "OnShow",
        function(self)
            self:SetScript("OnUpdate", wiggleAnim)
        end
    )
    f.popupQuestAccept:SetScript(
        "OnHide",
        function(self)
            self:SetScript("OnUpdate", nil)
        end
    )

    return f
end
GW.CreateTrackerObject = CreateTrackerObject

local function getObjectiveBlock(self, index)
    if _G[self:GetName() .. "GwQuestObjective" .. index] ~= nil then
        return _G[self:GetName() .. "GwQuestObjective" .. index]
    end

    if self.objectiveBlocksNum == nil then
        self.objectiveBlocksNum = 0
    end
    if self.objectiveBlocks == nil then
        self.objectiveBlocks = {}
    end

    self.objectiveBlocksNum = self.objectiveBlocksNum + 1

    local newBlock = CreateObjectiveNormal(self:GetName() .. "GwQuestObjective" .. self.objectiveBlocksNum, self)
    newBlock:SetParent(self)
    self.objectiveBlocks[#self.objectiveBlocks] = newBlock
    if self.objectiveBlocksNum == 1 then
        newBlock:SetPoint("TOPRIGHT", self, "TOPRIGHT", 0, -25)
    else
        newBlock:SetPoint(
            "TOPRIGHT",
            _G[self:GetName() .. "GwQuestObjective" .. (self.objectiveBlocksNum - 1)],
            "BOTTOMRIGHT",
            0,
            0
        )
    end

    newBlock.StatusBar:SetStatusBarColor(self.color.r, self.color.g, self.color.b)

    return newBlock
end
GW.AddForProfiling("objectives", "getObjectiveBlock", getObjectiveBlock)

local function getBlockQuest(blockIndex, isFrequency)
    if _G["GwQuestBlock" .. blockIndex] ~= nil then
        local block = _G["GwQuestBlock" .. blockIndex]
        -- set the correct block color for an existing block here
        setBlockColor(block, isFrequency and "DAILY" or "QUEST")
        block.Header:SetTextColor(block.color.r, block.color.g, block.color.b)
        block.hover:SetVertexColor(block.color.r, block.color.g, block.color.b)
        for i = 1, 20 do
            if _G[block:GetName() .. "GwQuestObjective" .. i] ~= nil then
                _G[block:GetName() .. "GwQuestObjective" .. i].StatusBar:SetStatusBarColor(block.color.r, block.color.g, block.color.b)
            end
        end
        return block
    end

    local newBlock = CreateTrackerObject("GwQuestBlock" .. blockIndex, GwQuesttrackerContainerQuests)
    newBlock:SetParent(GwQuesttrackerContainerQuests)

    if blockIndex == 1 then
        newBlock:SetPoint("TOPRIGHT", GwQuesttrackerContainerQuests, "TOPRIGHT", 0, -20)
    else
        newBlock:SetPoint("TOPRIGHT", _G["GwQuestBlock" .. (blockIndex - 1)], "BOTTOMRIGHT", 0, 0)
    end

    newBlock.index = blockIndex
    newBlock.clickHeader:Show()
    setBlockColor(newBlock, isFrequency and "DAILY" or "QUEST")
    newBlock.Header:SetTextColor(newBlock.color.r, newBlock.color.g, newBlock.color.b)
    newBlock.hover:SetVertexColor(newBlock.color.r, newBlock.color.g, newBlock.color.b)

    -- quest item button here
    newBlock.actionButton = CreateFrame("Button", nil, GwQuestTracker, "GwQuestItemTemplate")
    newBlock.actionButton.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    newBlock.actionButton.NormalTexture:SetTexture(nil)
    newBlock.actionButton:RegisterForClicks("AnyUp")
    newBlock.actionButton:SetScript("OnShow", QuestObjectiveItem_OnShow)
    newBlock.actionButton:SetScript("OnHide", QuestObjectiveItem_OnHide)
    newBlock.actionButton:SetScript("OnEnter", QuestObjectiveItem_OnEnter)
    newBlock.actionButton:SetScript("OnLeave", GameTooltip_Hide)
    newBlock.actionButton:SetScript("OnEvent", QuestObjectiveItem_OnEvent)

    return newBlock
end
GW.AddForProfiling("objectives", "getBlockQuest", getBlockQuest)

local function getBlockCampaign(blockIndex)
    if _G["GwCampaignBlock" .. blockIndex] ~= nil then
        return _G["GwCampaignBlock" .. blockIndex]
    end

    local newBlock = CreateTrackerObject("GwCampaignBlock" .. blockIndex, GwQuesttrackerContainerCampaign)
    newBlock:SetParent(GwQuesttrackerContainerCampaign)

    if blockIndex == 1 then
        newBlock:SetPoint("TOPRIGHT", GwQuesttrackerContainerCampaign, "TOPRIGHT", 0, -20)
    else
        newBlock:SetPoint("TOPRIGHT", _G["GwCampaignBlock" .. (blockIndex - 1)], "BOTTOMRIGHT", 0, 0)
    end

    newBlock.index = blockIndex
    newBlock.clickHeader:Show()
    setBlockColor(newBlock, "CAMPAIGN")
    newBlock.Header:SetTextColor(newBlock.color.r, newBlock.color.g, newBlock.color.b)
    newBlock.hover:SetVertexColor(newBlock.color.r, newBlock.color.g, newBlock.color.b)

    -- quest item button here
    newBlock.actionButton = CreateFrame("Button", nil, GwQuestTracker, "GwQuestItemTemplate")
    newBlock.actionButton.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    newBlock.actionButton.NormalTexture:SetTexture(nil)
    newBlock.actionButton:RegisterForClicks("AnyUp")
    newBlock.actionButton:SetScript("OnShow", QuestObjectiveItem_OnShow)
    newBlock.actionButton:SetScript("OnHide", QuestObjectiveItem_OnHide)
    newBlock.actionButton:SetScript("OnEnter", QuestObjectiveItem_OnEnter)
    newBlock.actionButton:SetScript("OnLeave", GameTooltip_Hide)
    newBlock.actionButton:SetScript("OnEvent", QuestObjectiveItem_OnEvent)

    return newBlock
end
GW.AddForProfiling("objectives", "getBlockCampaign", getBlockCampaign)

local function getBlockById(questID)
    for i = 1, 50 do -- loop quest and campaign
        local block = _G[(i <= 25 and "GwCampaignBlock" or "GwQuestBlock") .. (i <= 25 and i or i - 25)]
        if block then
            if block.questID == questID then
                return block
            end
        end
    end

    return nil
end

local function getBlockByIdOrCreateNew(questID, isCampaign, isFrequency)
    local blockName = isCampaign and "GwCampaignBlock" or "GwQuestBlock"

    for i = 1, 25 do
        if _G[blockName .. i] then
            if _G[blockName .. i].questID == questID then
                return _G[blockName .. i]
            elseif _G[blockName .. i].questID == nil then
                return isCampaign and getBlockCampaign(i) or getBlockQuest(i, isFrequency)
            end
        else
            return isCampaign and getBlockCampaign(i) or getBlockQuest(i, isFrequency)
        end
    end

    return nil
end

local function getQuestWatchId(questID)
    for i = 1, C_QuestLog.GetNumQuestWatches() do
        if questID == C_QuestLog.GetQuestIDForQuestWatchIndex(i) then
            return i
        end
    end

    return nil
end

local function addObjective(block, text, finished, objectiveIndex, objectiveType)
    if finished == true then
        return
    end
    local objectiveBlock = getObjectiveBlock(block, objectiveIndex)

    if text then
        objectiveBlock:Show()
        objectiveBlock.ObjectiveText:SetText(text)
        objectiveBlock.ObjectiveText:SetHeight(objectiveBlock.ObjectiveText:GetStringHeight() + 15)
        if finished then
            objectiveBlock.ObjectiveText:SetTextColor(0.8, 0.8, 0.8)
        else
            objectiveBlock.ObjectiveText:SetTextColor(1, 1, 1)
        end

        if objectiveType == "progressbar" or ParseObjectiveString(objectiveBlock, text) then
            if objectiveType == "progressbar" then
                objectiveBlock.StatusBar:Show()
                objectiveBlock.StatusBar:SetMinMaxValues(0, 100)
                objectiveBlock.StatusBar:SetValue(GetQuestProgressBarPercent(block.questID))
                objectiveBlock.progress = GetQuestProgressBarPercent(block.questID) / 100
                objectiveBlock.StatusBar.precentage = true
            end
        else
            objectiveBlock.StatusBar:Hide()
        end
        local h = objectiveBlock.ObjectiveText:GetStringHeight() + 10
        objectiveBlock:SetHeight(h)
        if objectiveBlock.StatusBar:IsShown() then
            if block.numObjectives >= 1 then
                h = h + objectiveBlock.StatusBar:GetHeight() + 10
            else
                h = h + objectiveBlock.StatusBar:GetHeight() + 5
            end
            objectiveBlock:SetHeight(h)
        end
        block.height = block.height + objectiveBlock:GetHeight()
        block.numObjectives = block.numObjectives + 1
    end
end
GW.AddForProfiling("objectives", "addObjective", addObjective)

local function updateQuestObjective(block, numObjectives)
    local addedObjectives = 1
    for objectiveIndex = 1, numObjectives do
        --local text, _, finished = GetQuestLogLeaderBoard(objectiveIndex, block.questLogIndex)
        local text, objectiveType, finished = GetQuestObjectiveInfo(block.questID, objectiveIndex, false)
        if not finished then
            addObjective(block, text, finished, addedObjectives, objectiveType)
            addedObjectives = addedObjectives + 1
        end
    end
end
GW.AddForProfiling("objectives", "updateQuestObjective", updateQuestObjective)

local function UpdateQuestItem(block)
    local link, item, charges, showItemWhenComplete = nil, nil, nil, false

    if block.questLogIndex then
        link, item, charges, showItemWhenComplete = GetQuestLogSpecialItemInfo(block.questLogIndex)
    end

    local isQuestComplete = (block and block.questID) and QuestCache:Get(block.questID):IsComplete() or false
    local shouldShowItem = item and (not isQuestComplete or showItemWhenComplete)
    if shouldShowItem then
        block.hasItem = true
        block.actionButton:SetID(block.questLogIndex)

        block.actionButton:SetAttribute("type", "item")
        block.actionButton:SetAttribute("item", link)

        block.actionButton.charges = charges
        block.actionButton.rangeTimer = -1
        SetItemButtonTexture(block.actionButton, item)
        SetItemButtonCount(block.actionButton, charges)

        QuestObjectiveItem_UpdateCooldown(block.actionButton)
        block.actionButton:SetScript("OnUpdate", QuestObjectiveItem_OnUpdate)
        block.actionButton:Show()
    else
        block.hasItem = false
        block.actionButton:Hide()
        block.actionButton:SetScript("OnUpdate", nil)
    end
end
GW.UpdateQuestItem = UpdateQuestItem

local function OnBlockClick(self, button, isHeader)
    if button == "RightButton" then
        ObjectiveTracker_ToggleDropDown(self, QuestObjectiveTracker_OnOpenDropDown)
        return
    end
    CloseDropDownMenus()

    if ChatEdit_TryInsertQuestLinkForQuestID(self.questID) then
        return
    end

    if isHeader and not IsModifiedClick("QUESTWATCHTOGGLE") then
        C_SuperTrack.SetSuperTrackedQuestID(self.questID)
        return
    end

    if button ~= "RightButton" then
        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
        if IsModifiedClick("QUESTWATCHTOGGLE") then
            QuestObjectiveTracker_UntrackQuest(nil, self.questID)
        else
            QuestMapFrame_OpenToQuestDetails(self.questID)
        end
    end
end
GW.AddForProfiling("objectives", "OnBlockClick", OnBlockClick)

local function OnBlockClickHandler(self, button)
    if self.questID == nil then 
        OnBlockClick(self:GetParent(), button, true)
    else
        OnBlockClick(self, button, false)
    end
end
GW.AddForProfiling("objectives", "OnBlockClickHandler", OnBlockClickHandler)

local function updateQuest(self, block, quest)
    local questID = quest:GetID()
    local numObjectives = C_QuestLog.GetNumQuestObjectives(questID)
    local isComplete = quest:IsComplete()
    local questLogIndex = quest:GetQuestLogIndex()
    local requiredMoney = C_QuestLog.GetRequiredMoney(questID)
    local questFailed = C_QuestLog.IsFailed(questID)

    block.height = 25
    block.numObjectives = 0
    block.turnin:SetShown(IsQuestAutoTurnInOrAutoAccept(questID, "COMPLETE"))
    block.popupQuestAccept:SetShown(IsQuestAutoTurnInOrAutoAccept(questID, "OFFER"))

    if questID and questLogIndex and questLogIndex > 0 then
        if requiredMoney then
            self.watchMoneyReasons = self.watchMoneyReasons + 1
        else
            self.watchMoneyReasons = self.watchMoneyReasons - 1
        end

        block.questID = questID
        block.id = questID
        block.questLogIndex = questLogIndex

        block.Header:SetText(quest.title)

        --Quest item
        GW.CombatQueue_Queue(nil, UpdateQuestItem, {block})

        if numObjectives == 0 and GetMoney() >= requiredMoney and not quest.startEvent then
            isComplete = true
        end

        updateQuestObjective(block, numObjectives)

        if requiredMoney ~= nil and requiredMoney > GetMoney() then
            addObjective(
                block,
                GetMoneyString(GetMoney()) .. " / " .. GetMoneyString(requiredMoney),
                isComplete,
                block.numObjectives + 1,
                nil
            )
        end

        if isComplete then
            if quest.isAutoComplete then
                addObjective(block, QUEST_WATCH_CLICK_TO_COMPLETE, false, block.numObjectives + 1, nil)
            else
                local completionText = GetQuestLogCompletionText(questLogIndex)

                if (completionText) then
                    addObjective(block, completionText, false, block.numObjectives + 1, nil)
                else
                    addObjective(block, QUEST_WATCH_QUEST_READY, false, block.numObjectives + 1, nil)
                end
            end
        elseif questFailed then
            addObjective(block, FAILED, false, block.numObjectives + 1, nil)
        end
        block.clickHeader:SetScript("OnClick", OnBlockClickHandler)
        block:SetScript("OnClick", OnBlockClickHandler)

        wipe(questInfo)
    end
    if block.objectiveBlocks == nil then
        block.objectiveBlocks = {}
    end

    for i = block.numObjectives + 1, 20 do
        if _G[block:GetName() .. "GwQuestObjective" .. i] ~= nil then
            _G[block:GetName() .. "GwQuestObjective" .. i]:Hide()
        end
    end
    block.height = block.height + 5
    block:SetHeight(block.height)
end
GW.AddForProfiling("objectives", "updateQuest", updateQuest)

local function updateQuestByID(self, block, quest, questID, questLogIndex)
    local numObjectives = C_QuestLog.GetNumQuestObjectives(questID)
    local isComplete = quest:IsComplete()
    local requiredMoney = C_QuestLog.GetRequiredMoney(questID)
    local questFailed = C_QuestLog.IsFailed(questID)

    block.height = 25
    block.numObjectives = 0
    block.turnin:SetShown(IsQuestAutoTurnInOrAutoAccept(questID, "COMPLETE"))
    block.popupQuestAccept:SetShown(IsQuestAutoTurnInOrAutoAccept(questID, "OFFER"))

    if requiredMoney then
        self.watchMoneyReasons = self.watchMoneyReasons + 1
    else
        self.watchMoneyReasons = self.watchMoneyReasons - 1
    end

    block.questID = questID
    block.id = questID
    block.questLogIndex = questLogIndex

    block.Header:SetText(quest.title)

    --Quest item
    GW.CombatQueue_Queue(nil, UpdateQuestItem, {block})

    if numObjectives == 0 and GetMoney() >= requiredMoney and not quest.startEvent then
        isComplete = true
    end

    updateQuestObjective(block, numObjectives)

    if requiredMoney ~= nil and requiredMoney > GetMoney() then
        addObjective(
            block,
            GetMoneyString(GetMoney()) .. " / " .. GetMoneyString(requiredMoney),
            isComplete,
            block.numObjectives + 1,
            nil
        )
    end

    if isComplete then
        if quest.isAutoComplete then
            addObjective(block, QUEST_WATCH_CLICK_TO_COMPLETE, false, block.numObjectives + 1, nil)
        else
            local completionText = GetQuestLogCompletionText(questLogIndex)

            if (completionText) then
                addObjective(block, completionText, false, block.numObjectives + 1, nil)
            else
                addObjective(block, QUEST_WATCH_QUEST_READY, false, block.numObjectives + 1, nil)
            end
        end
    elseif questFailed then
        addObjective(block, FAILED, false, block.numObjectives + 1, nil)
    end
    block.clickHeader:SetScript("OnClick", OnBlockClickHandler)
    block:SetScript("OnClick", OnBlockClickHandler)

    if block.objectiveBlocks == nil then
        block.objectiveBlocks = {}
    end

    for i = block.numObjectives + 1, 20 do
        if _G[block:GetName() .. "GwQuestObjective" .. i] ~= nil then
            _G[block:GetName() .. "GwQuestObjective" .. i]:Hide()
        end
    end
    block.height = block.height + 5
    block:SetHeight(block.height)
    wipe(questInfo)
end
GW.AddForProfiling("objectives", "updateQuestByID", updateQuestByID)

local function updateQuestItemPositions(button, height, type, block)
    if not button or not block.hasItem then
        return
    end

    local height = height + GwQuesttrackerContainerScenario:GetHeight() + GwQuesttrackerContainerAchievement:GetHeight() + GwQuesttrackerContainerBossFrames:GetHeight() + GwQuesttrackerContainerArenaBGFrames:GetHeight()
    if GwObjectivesNotification:IsShown() then
        height = height + GwObjectivesNotification.desc:GetHeight()
    else
        height = height - 40
    end
    if type == "SCENARIO" then
        height = height - (GwQuesttrackerContainerAchievement:GetHeight() + GwQuesttrackerContainerBossFrames:GetHeight() + GwQuesttrackerContainerArenaBGFrames:GetHeight())
    end
    if type == "EVENT" then
        height = height + GwQuesttrackerContainerQuests:GetHeight()
    end
    if type == "QUEST" or type == "EVENT" then
        height = height + GwQuesttrackerContainerCampaign:GetHeight()
    end

    button:SetPoint("TOPLEFT", GwQuestTracker, "TOPRIGHT", -330, -height)
end
GW.updateQuestItemPositions = updateQuestItemPositions
GW.AddForProfiling("objectives", "updateQuestItemPositions", updateQuestItemPositions)

local questExraButtonHelperFrame = CreateFrame("Frame")
questExraButtonHelperFrame:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    GW.updateExtraQuestItemPositions(self.height)
end)

local function updateExtraQuestItemPositions(height)
    if GwBonusItemButton == nil or GwScenarioItemButton == nil then
        return
    end

    if InCombatLockdown() then
        questExraButtonHelperFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
        questExraButtonHelperFrame.height = height
        return
    end

    local height = height or 0

    if GwObjectivesNotification:IsShown() then
        height = height + GwObjectivesNotification.desc:GetHeight() + 50
    end

    height = height + GwQuesttrackerContainerBossFrames:GetHeight() + GwQuesttrackerContainerArenaBGFrames:GetHeight()

    GwScenarioItemButton:SetPoint("TOPLEFT", GwQuestTracker, "TOPRIGHT", -330, -height)

    height = height + GwQuesttrackerContainerScenario:GetHeight() + GwQuesttrackerContainerQuests:GetHeight() + GwQuesttrackerContainerAchievement:GetHeight() + GwQuesttrackerContainerCampaign:GetHeight()

    -- get correct height for WQ block
    for i = 1, 20 do
        if _G["GwBonusObjectiveBlock" .. i] ~= nil and _G["GwBonusObjectiveBlock" .. i].questID then
            if _G["GwBonusObjectiveBlock" .. i].hasItem then
                break
            end
            height = height + _G["GwBonusObjectiveBlock" .. i]:GetHeight()
        end
    end

    GwBonusItemButton:SetPoint("TOPLEFT", GwQuestTracker, "TOPRIGHT", -330, -height + -25)
end
GW.updateExtraQuestItemPositions = updateExtraQuestItemPositions
GW.AddForProfiling("objectives", "updateExtraQuestItemPositions", updateExtraQuestItemPositions)

--[[
function gwRequestQustlogUpdate()
    updateQuestLogLayout()
end
--]]
local function QuestTrackerLayoutChanged()
    updateExtraQuestItemPositions()
    -- adjust scrolframe height
    local height = GwQuesttrackerContainerBonusObjectives:GetHeight() + GwQuesttrackerContainerQuests:GetHeight() + GwQuesttrackerContainerCampaign:GetHeight() + GwQuesttrackerContainerAchievement:GetHeight() + 60 + (GwQuesttrackerContainerWQT and GwQuesttrackerContainerWQT:GetHeight() or 0)
    local scroll = 0
    local trackerHeight = GetSetting("QuestTracker_pos_height") - GwQuesttrackerContainerBossFrames:GetHeight() - GwQuesttrackerContainerArenaBGFrames:GetHeight() - GwQuesttrackerContainerScenario:GetHeight() - GwObjectivesNotification:GetHeight()
    if height > tonumber(trackerHeight) then
        scroll = math.abs(trackerHeight - height)
    end
    GwQuestTrackerScroll.maxScroll = scroll

    GwQuestTrackerScroll:SetSize(GwQuestTracker:GetWidth(), height)
end
GW.QuestTrackerLayoutChanged = QuestTrackerLayoutChanged

local function updateQuestLogLayout(self)
    if self.isUpdating or not self.init then
        return
    end
    self.isUpdating = true

    local counterQuest = 0
    local counterCampaign = 0
    local savedHeightQuest = 1
    local savedHeightCampagin = 1
    local shouldShowQuests = true
    local shouldShowCampaign = true
    GwQuesttrackerContainerQuests.header:Hide()

    local numQuests = C_QuestLog.GetNumQuestWatches()
    if GwQuesttrackerContainerCampaign.collapsed == true then
        GwQuesttrackerContainerCampaign.header:Show()
        savedHeightCampagin = 20
        shouldShowCampaign = false
    end
    if GwQuesttrackerContainerQuests.collapsed == true then
        GwQuesttrackerContainerQuests.header:Show()
        savedHeightQuest = 20
        shouldShowQuests = false
    end

    for i = 1, numQuests do
        local questID = C_QuestLog.GetQuestIDForQuestWatchIndex(i)

        -- check if we have a quest id to prevent errors
        if questID then
            local q = QuestCache:Get(questID)
            -- Campaing Quests
            if q and q:IsCampaign() then
                if shouldShowCampaign then
                    GwQuesttrackerContainerCampaign.header:Show()
                    counterCampaign = counterCampaign + 1

                    if counterCampaign == 1 then
                        savedHeightCampagin = 20
                    end
                    local block = getBlockCampaign(counterCampaign)
                    if block == nil then
                        return
                    end

                    updateQuest(self, block, q)
                    block:Show()
                    savedHeightCampagin = savedHeightCampagin + block.height
                    GW.CombatQueue_Queue("update_tracker_campaign_itembutton_position" .. block.index, updateQuestItemPositions, {block.actionButton, savedHeightCampagin, nil, block})
                else
                    counterCampaign = counterCampaign + 1
                    if _G["GwCampaignBlock" .. counterCampaign] ~= nil then
                        _G["GwCampaignBlock" .. counterCampaign]:Hide()
                        _G["GwCampaignBlock" .. counterCampaign].questLogIndex = 0
                        GW.CombatQueue_Queue("update_tracker_campaign_itembutton_remove" .. counterCampaign, UpdateQuestItem, {_G["GwCampaignBlock" .. counterCampaign]})
                    end
                end
            elseif q then
                if shouldShowQuests then
                    GwQuesttrackerContainerQuests.header:Show()
                    counterQuest = counterQuest + 1

                    if counterQuest == 1 then
                        savedHeightQuest = 20
                    end
                    --if quest is reapeataple make it blue
                    local isFrequency = q.frequency and q.frequency > 0
                    if q.frequency == nil then
                        local questLogIndex = q:GetQuestLogIndex()
                        if questLogIndex and questLogIndex > 0 then
                            questInfo = C_QuestLog.GetInfo(questLogIndex)
                            if questInfo then
                                isFrequency = questInfo.frequency > 0
                                wipe(questInfo)
                            end
                        end
                    end
                    local block = getBlockQuest(counterQuest, isFrequency)
                    if block == nil then
                        return
                    end
                    updateQuest(self, block, q)
                    block.isFrequency = isFrequency
                    block:Show()
                    savedHeightQuest = savedHeightQuest + block.height
                    GW.CombatQueue_Queue("update_tracker_quest_itembutton_position" .. block.index, updateQuestItemPositions, {block.actionButton, savedHeightQuest, "QUEST", block})
                else
                    counterQuest = counterQuest + 1
                    if _G["GwQuestBlock" .. counterQuest] ~= nil then
                        _G["GwQuestBlock" .. counterQuest]:Hide()
                        _G["GwQuestBlock" .. counterQuest].questLogIndex = 0
                        GW.CombatQueue_Queue("update_tracker_quest_itembutton_remove" .. counterQuest, UpdateQuestItem, {_G["GwQuestBlock" .. counterQuest]})
                    end
                end
            end
        end
    end

    GwQuesttrackerContainerCampaign:SetHeight(savedHeightCampagin)
    GwQuesttrackerContainerQuests:SetHeight(savedHeightQuest)

    -- hide other quests
    for i = counterCampaign + 1, 25 do
        if _G["GwCampaignBlock" .. i] ~= nil then
            _G["GwCampaignBlock" .. i].questID = nil
            _G["GwCampaignBlock" .. i].questLogIndex = 0
            if _G["GwCampaignBlock" .. i].groupButton then _G["GwCampaignBlock" .. i].groupButton:SetParent(GW.HiddenFrame) end
            _G["GwCampaignBlock" .. i]:Hide()
            GW.CombatQueue_Queue("update_tracker_campaign_itembutton_remove" .. i, UpdateQuestItem, {_G["GwCampaignBlock" .. i]})
        end
    end
    for i = counterQuest + 1, 25 do
        if _G["GwQuestBlock" .. i] ~= nil then
            _G["GwQuestBlock" .. i].questID = nil
            _G["GwQuestBlock" .. i].questLogIndex = 0
            if _G["GwQuestBlock" .. i].groupButton then _G["GwQuestBlock" .. i].groupButton:SetParent(GW.HiddenFrame) end
            _G["GwQuestBlock" .. i]:Hide()
            GW.CombatQueue_Queue("update_tracker_quest_itembutton_remove" .. i, UpdateQuestItem, {_G["GwQuestBlock" .. i]})
        end
    end

    if counterCampaign == 0 then GwQuesttrackerContainerCampaign.header:Hide() end

    -- Set number of quest to the Header
    GwQuesttrackerContainerQuests.header.title:SetText(TRACKER_HEADER_QUESTS .. " (" .. counterQuest .. ")")
    GwQuesttrackerContainerCampaign.header.title:SetText(TRACKER_HEADER_CAMPAIGN_QUESTS .. " (" .. counterCampaign .. ")")

    self.isUpdating = false
end
GW.updateQuestLogLayout = updateQuestLogLayout
GW.AddForProfiling("objectives", "updateQuestLogLayout", updateQuestLogLayout)

local function updateQuestLogLayoutSingle(self, questID, added)
    if self.isUpdating or not self.init or not questID then
        return
    end
    self.isUpdating = true

    -- get the correct quest block for that questID
    local q = QuestCache:Get(questID)
    local questLogIndex = q:GetQuestLogIndex()
    local isFrequency = q.frequency and q.frequency > 0
    if q.frequency == nil then
        if questLogIndex and questLogIndex > 0 then
            questInfo = C_QuestLog.GetInfo(questLogIndex)
            if questInfo then
                isFrequency = questInfo.frequency > 0
                wipe(questInfo)
            end
        end
    end
    local isCampaign = q:IsCampaign()
    local questWatchId = getQuestWatchId(questID)
    local questBlockOfIdOrNew = questWatchId and getBlockByIdOrCreateNew(questID, isCampaign, isFrequency)
    local blockName = isCampaign and "GwCampaignBlock" or "GwQuestBlock"
    local containerName = isCampaign and GwQuesttrackerContainerCampaign or GwQuesttrackerContainerQuests
    local header = containerName.header
    local savedHeight = 20
    local heightForQuestItem = 20
    local counterQuest = 0
    if questWatchId and questBlockOfIdOrNew and questLogIndex and questLogIndex > 0 then
        updateQuestByID(self, questBlockOfIdOrNew, q, questID, questLogIndex)
        questBlockOfIdOrNew.isFrequency = isFrequency
        questBlockOfIdOrNew:Show()
        if added == true then
            C_Timer.After(0.1, function()
                local questBlockOfIdOrNew = questWatchId and getBlockByIdOrCreateNew(questID, isCampaign, isFrequency)
                NewQuestAnimation(questBlockOfIdOrNew)
            end)
        end

        for i = 1, 25 do
            if _G[blockName .. i] and _G[blockName .. i]:IsShown() and _G[blockName .. i].questID ~= nil then
                savedHeight = savedHeight + _G[blockName .. i].height
                counterQuest = counterQuest + 1
            elseif _G[blockName .. i] and not _G[blockName .. i]:IsShown() then
                _G[blockName .. i]:Hide()
            end
        end

        containerName:SetHeight(savedHeight)
        header:Show()

        if questBlockOfIdOrNew.hasItem then
            for i = 1, 25 do
                if _G[blockName .. i] and _G[blockName .. i]:IsShown() and _G[blockName .. i].questID ~= questID then
                    heightForQuestItem = heightForQuestItem + _G[blockName .. i].height
                elseif _G[blockName .. i] and _G[blockName .. i]:IsShown() and _G[blockName .. i].questID == questID then
                    heightForQuestItem = heightForQuestItem + _G[blockName .. i].height
                    break
                end
            end
            GW.CombatQueue_Queue("update_tracker_quest_itembutton_position" .. questBlockOfIdOrNew.index, updateQuestItemPositions, {questBlockOfIdOrNew.actionButton, heightForQuestItem, isCampaign and nil or "QUEST", questBlockOfIdOrNew})
        end

        -- Set number of quest to the Header
        local headerCounterText = " (" .. counterQuest .. ")"
        header.title:SetText(isCampaign and TRACKER_HEADER_CAMPAIGN_QUESTS .. headerCounterText or TRACKER_HEADER_QUESTS .. headerCounterText)
    end

    self.isUpdating = false
end

local function checkForAutoQuests()
    for i = 1, GetNumAutoQuestPopUps() do
        local questID, popUpType = GetAutoQuestPopUp(i)
        if questID and (popUpType == "OFFER" or popUpType == "COMPLETE") then
            --find our block with that questId
            local questBlock = getBlockById(questID)
            if questBlock and questBlock.questID == questID then
                if popUpType == "OFFER" then
                    questBlock.popupQuestAccept:Show()
                    questBlock.popupQuestAccept:SetScript("OnClick", function(self)
                        ShowQuestOffer(self:GetParent().id)
                        RemoveAutoQuestPopUp(self:GetParent().id)
                        self:Hide()
                    end)
                elseif popUpType == "COMPLETE" then
                    questBlock.turnin:Show()
                    questBlock.turnin:SetScript("OnClick",function(self)
                        ShowQuestComplete(self:GetParent().id)
                        RemoveAutoQuestPopUp(self:GetParent().id)
                        self:Hide()
                    end)
                end
            elseif questBlock == nil then
                C_Timer.After(0.5, checkForAutoQuests)
            end
        end
    end
end

local function tracker_OnEvent(self, event, ...)
    local numWatchedQuests = C_QuestLog.GetNumQuestWatches()

    if event == "QUEST_LOG_UPDATE" then
        updateQuestLogLayout(self)
    elseif event == "QUEST_ACCEPTED" then
        local questID = ...
        if not C_QuestLog.IsQuestBounty(questID) then
            if C_QuestLog.IsQuestTask(questID) then
                if not QuestUtils_IsQuestWorldQuest(questID) then
                    updateQuestLogLayoutSingle(self, questID)
                end
            else
                if AUTO_QUEST_WATCH == "1" and C_QuestLog.GetNumQuestWatches() < Constants.QuestWatchConsts.MAX_QUEST_WATCHES then
                    C_QuestLog.AddQuestWatch(questID, Enum.QuestWatchType.Automatic)
                    updateQuestLogLayoutSingle(self, questID)
                end
            end
        end
    elseif event == "QUEST_WATCH_LIST_CHANGED" then
        local questID, added = ...
        if added then
            if not C_QuestLog.IsQuestBounty(questID) or C_QuestLog.IsComplete(questID) then
                updateQuestLogLayoutSingle(self, questID, added)
            end
        else
            updateQuestLogLayout(self)
        end
    elseif event == "QUEST_AUTOCOMPLETE" then
        local questID = ...
        updateQuestLogLayoutSingle(self, questID)
    elseif event == "PLAYER_MONEY" and self.watchMoneyReasons > numWatchedQuests then
        updateQuestLogLayout(self)
    elseif event == "LOAD" then
        updateQuestLogLayout(self)
        C_Timer.After(0.5, function() GW.updateBonusObjective(GwQuesttrackerContainerBonusObjectives) end)
        self.init = true
    elseif event == "PLAYER_ENTERING_WORLD" then
        self:RegisterEvent("QUEST_DATA_LOAD_RESULT")
    elseif event == "QUEST_DATA_LOAD_RESULT" then
        local questID, success = ...
        local idx = C_QuestLog.GetLogIndexForQuestID(questID)
        if success and questID and idx and idx > 0 then
            C_Timer.After(1, function() updateQuestLogLayoutSingle(self, questID) end)
        end
    end

    if self.watchMoneyReasons > numWatchedQuests then self.watchMoneyReasons = self.watchMoneyReasons - numWatchedQuests end
    C_Timer.After(0.5, checkForAutoQuests)
    QuestTrackerLayoutChanged()
end
GW.AddForProfiling("objectives", "tracker_OnEvent", tracker_OnEvent)

local function tracker_OnUpdate()
    local prevState = GwObjectivesNotification.shouldDisplay

    if GW.locationData.mapID or GW.locationData.instanceMapID then
        GW.SetObjectiveNotification()
    end

    if prevState ~= GwObjectivesNotification.shouldDisplay then
        GW.NotificationStateChanged(GwObjectivesNotification.shouldDisplay)
    end
end
GW.forceCompassHeaderUpdate = tracker_OnUpdate
GW.AddForProfiling("objectives", "tracker_OnUpdate", tracker_OnUpdate)

local function bonus_OnEnter(self)
    GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT", 0, 0)
    GameTooltip:ClearLines()
    GameTooltip:SetText(RoundDec(self.progress * 100, 0) .. "%")
    GameTooltip:Show()
end
GW.AddForProfiling("objectives", "bonus_OnEnter", bonus_OnEnter)

local function AdjustQuestTracker(our_bars, our_minimap)
    if (not our_minimap) then
        return
    end

    local o = ObjectiveTrackerFrame
    if (o:IsUserPlaced()) then
        return
    end

    local m = MinimapCluster
    local x

    if (our_bars) then
        x = 310
    else
        x = 220
    end

    o:ClearAllPoints()
    o:SetMovable(true)
    o:SetUserPlaced(true)
    o:SetPoint("TOPRIGHT", m, "BOTTOMRIGHT", x, 0)
    o:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", x, 130)
    o:SetMovable(false)
end
GW.AdjustQuestTracker = AdjustQuestTracker

local function LoadQuestTracker()
    -- disable the default tracker
    ObjectiveTrackerFrame:SetMovable(1)
    ObjectiveTrackerFrame:SetUserPlaced(true)
    ObjectiveTrackerFrame:Hide()
    ObjectiveTrackerFrame:SetScript(
        "OnShow",
        function()
            ObjectiveTrackerFrame:Hide()
        end
    )

    --ObjectiveTrackerFrame:UnregisterAllEvents()
    ObjectiveTrackerFrame:SetScript("OnUpdate", nil)
    ObjectiveTrackerFrame:SetScript("OnSizeChanged", nil)
    --ObjectiveTrackerFrame:SetScript("OnEvent", nil)

    -- create our tracker
    local fTracker = CreateFrame("Frame", "GwQuestTracker", UIParent, "GwQuestTracker")

    local fTraScr = CreateFrame("ScrollFrame", "GwQuestTrackerScroll", fTracker, "GwQuestTrackerScroll")
    fTraScr:SetHeight(GetSetting("QuestTracker_pos_height"))
    fTraScr:SetScript(
        "OnMouseWheel",
        function(self, delta)
            delta = -delta * 15
            local s = math.max(0, self:GetVerticalScroll() + delta)
            if self.maxScroll ~= nil then
                s = math.min(self.maxScroll, s)
            end
            self:SetVerticalScroll(s)
        end
    )
    fTraScr.maxScroll = 0

    local fScroll = CreateFrame("Frame", "GwQuestTrackerScrollChild", fTraScr, "GwQuestTracker")

    local fNotify = CreateFrame("Frame", "GwObjectivesNotification", fTracker, "GwObjectivesNotification")
    fNotify.animatingState = false
    fNotify.animating = false
    fNotify.title:SetFont(UNIT_NAME_FONT, 14)
    fNotify.title:SetShadowOffset(1, -1)
    fNotify.desc:SetFont(UNIT_NAME_FONT, 12)
    fNotify.desc:SetShadowOffset(1, -1)
    fNotify.bonusbar.bar:SetOrientation("VERTICAL")
    fNotify.bonusbar.bar:SetMinMaxValues(0, 1)
    fNotify.bonusbar.bar:SetValue(0.5)
    fNotify.bonusbar:SetScript("OnEnter", bonus_OnEnter)
    fNotify.bonusbar:SetScript("OnLeave", GameTooltip_Hide)
    fNotify.compass:SetScript("OnShow", NewQuestAnimation)
    fNotify.compass:SetScript("OnMouseDown", function() C_SuperTrack.SetSuperTrackedQuestID(0) end) -- to rest the SuperTracked quest

    local fBoss = CreateFrame("Frame", "GwQuesttrackerContainerBossFrames", fTracker, "GwQuesttrackerContainer")
    local fArenaBG = CreateFrame("Frame", "GwQuesttrackerContainerArenaBGFrames", fTracker, "GwQuesttrackerContainer")
    local fScen = CreateFrame("Frame", "GwQuesttrackerContainerScenario", fTracker, "GwQuesttrackerContainer")
    local fAchv = CreateFrame("Frame", "GwQuesttrackerContainerAchievement", fTracker, "GwQuesttrackerContainer")
    local fCampaign = CreateFrame("Frame", "GwQuesttrackerContainerCampaign", fScroll, "GwQuesttrackerContainer")
    local fQuest = CreateFrame("Frame", "GwQuesttrackerContainerQuests", fScroll, "GwQuesttrackerContainer")
    local fBonus = CreateFrame("Frame", "GwQuesttrackerContainerBonusObjectives", fScroll, "GwQuesttrackerContainer")
    fNotify:SetParent(fTracker)
    fBoss:SetParent(fTracker)
    fArenaBG:SetParent(fTracker)
    fScen:SetParent(fTracker)
    fAchv:SetParent(fScroll)
    fCampaign:SetParent(fScroll)
    fQuest:SetParent(fScroll)
    fBonus:SetParent(fScroll)

    fNotify:SetPoint("TOPRIGHT", fTracker, "TOPRIGHT")
    fBoss:SetPoint("TOPRIGHT", fNotify, "BOTTOMRIGHT")
    fArenaBG:SetPoint("TOPRIGHT", fBoss, "BOTTOMRIGHT")
    fScen:SetPoint("TOPRIGHT", fArenaBG, "BOTTOMRIGHT")

    fTraScr:SetPoint("TOPRIGHT", fScen, "BOTTOMRIGHT")
    fTraScr:SetPoint("BOTTOMRIGHT", fTracker, "BOTTOMRIGHT")

    fScroll:SetPoint("TOPRIGHT", fTraScr, "TOPRIGHT")
    fAchv:SetPoint("TOPRIGHT", fScroll, "TOPRIGHT")
    fCampaign:SetPoint("TOPRIGHT", fAchv, "BOTTOMRIGHT")
    fQuest:SetPoint("TOPRIGHT", fCampaign, "BOTTOMRIGHT")
    fBonus:SetPoint("TOPRIGHT", fQuest, "BOTTOMRIGHT")

    fScroll:SetSize(fTracker:GetWidth(), 2)
    fTraScr:SetScrollChild(fScroll)

    fQuest:SetScript("OnEvent", tracker_OnEvent)
    fQuest:RegisterEvent("QUEST_LOG_UPDATE")
    fQuest:RegisterEvent("QUEST_WATCH_LIST_CHANGED")
    fQuest:RegisterEvent("QUEST_AUTOCOMPLETE")
    fQuest:RegisterEvent("QUEST_ACCEPTED")
    fQuest:RegisterEvent("PLAYER_MONEY")
    fQuest:RegisterEvent("PLAYER_ENTERING_WORLD")
    fQuest.watchMoneyReasons = 0

    fCampaign.header = CreateFrame("Button", nil, fCampaign, "GwQuestTrackerHeader")
    fCampaign.header.icon:SetTexCoord(0.5, 1, 0, 0.25)
    fCampaign.header.title:SetFont(UNIT_NAME_FONT, 14)
    fCampaign.header.title:SetShadowOffset(1, -1)
    fCampaign.header.title:SetText(TRACKER_HEADER_CAMPAIGN_QUESTS)

    fCampaign.header:SetScript(
        "OnMouseDown",
        function(self)
            local p = self:GetParent()
            if not p.collapsed then
                p.collapsed = true
                PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
            else
                p.collapsed = false
                PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
            end
            updateQuestLogLayout(fQuest)
            QuestTrackerLayoutChanged()
        end
    )
    fCampaign.header.title:SetTextColor(TRACKER_TYPE_COLOR.CAMPAIGN.r, TRACKER_TYPE_COLOR.CAMPAIGN.g, TRACKER_TYPE_COLOR.CAMPAIGN.b)

    fQuest.header = CreateFrame("Button", nil, fQuest, "GwQuestTrackerHeader")
    fQuest.header.icon:SetTexCoord(0, 0.5, 0.25, 0.5)
    fQuest.header.title:SetFont(UNIT_NAME_FONT, 14)
    fQuest.header.title:SetShadowOffset(1, -1)
    fQuest.header.title:SetText(TRACKER_HEADER_QUESTS)

    fQuest.header:SetScript(
        "OnMouseDown",
        function(self)
            local p = self:GetParent()
            if not p.collapsed then
                p.collapsed = true
                PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
            else
                p.collapsed = false
                PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
            end
            updateQuestLogLayout(p)
            QuestTrackerLayoutChanged()
        end
    )
    fQuest.header.title:SetTextColor(TRACKER_TYPE_COLOR.QUEST.r, TRACKER_TYPE_COLOR.QUEST.g, TRACKER_TYPE_COLOR.QUEST.b)

    fQuest.init = false
    tracker_OnEvent(fQuest, "LOAD")

    GW.LoadBossFrame()
    if not IsAddOnLoaded("sArena") then
        GW.LoadArenaFrame()
    end
    GW.LoadScenarioFrame()
    GW.LoadAchievementFrame()
    GW.LoadBonusFrame()
    GW.LoadWQTAddonSkin()

    hooksecurefunc("QuestObjectiveSetupBlockButton_FindGroup", function(self, questID)
        local button = self.hasGroupFinderButton and self.groupFinderButton

        if button then
            local block = getBlockById(questID)
            local blockBonus = GW.getBonusBlockById(questID)
            if block or blockBonus then
                button:SetParent(block or blockBonus)
                button:ClearAllPoints()
                button:SetPoint("TOPRIGHT", block or blockBonus, "TOPLEFT", 0, -25)
                button:SetNormalTexture("Interface/AddOns/GW2_UI/textures/icons/LFDMicroButton-Down")
                button:SetPushedTexture("Interface/AddOns/GW2_UI/textures/icons/LFDMicroButton-Down")
                button:SetDisabledTexture("Interface/AddOns/GW2_UI/textures/icons/LFDMicroButton-Down")
                button:SetHighlightTexture("Interface/AddOns/GW2_UI/textures/icons/LFDMicroButton-Down")
                button.Icon:Hide()
                button.Icon:SetAtlas(nil)
                button:SetSize(25, 25)
                if block then block.groupButton = button end
                if blockBonus then blockBonus.groupButton = button end
            end
        end
    end)

    fNotify.shouldDisplay = false
    -- only update the tracker on Events or if player moves
    local compassUpdateFrame = CreateFrame("Frame")
    compassUpdateFrame:RegisterEvent("PLAYER_STARTED_MOVING")
    compassUpdateFrame:RegisterEvent("PLAYER_STOPPED_MOVING")
    compassUpdateFrame:RegisterEvent("PLAYER_CONTROL_LOST")
    compassUpdateFrame:RegisterEvent("PLAYER_CONTROL_GAINED")
    compassUpdateFrame:RegisterEvent("QUEST_LOG_UPDATE")
    compassUpdateFrame:RegisterEvent("QUEST_WATCH_LIST_CHANGED")
    compassUpdateFrame:RegisterEvent("PLAYER_MONEY")
    compassUpdateFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
    compassUpdateFrame:RegisterEvent("PLAYER_ENTERING_BATTLEGROUND")
    compassUpdateFrame:RegisterEvent("QUEST_DATA_LOAD_RESULT")
    compassUpdateFrame:RegisterEvent("SUPER_TRACKING_CHANGED")
    compassUpdateFrame:RegisterEvent("SCENARIO_UPDATE")
    compassUpdateFrame:RegisterEvent("SCENARIO_CRITERIA_UPDATE")
    compassUpdateFrame:SetScript("OnEvent", function(self, event, ...)
        -- Events for start updating
        if IsIn(event, "PLAYER_STARTED_MOVING", "PLAYER_CONTROL_LOST") then
            self.Ticker = C_Timer.NewTicker(1, function() tracker_OnUpdate() end)
        elseif IsIn(event, "PLAYER_STOPPED_MOVING", "PLAYER_CONTROL_GAINED") then -- Events for stop updating
            if self.Ticker then
                self.Ticker:Cancel()
                self.Ticker = nil
            end
        elseif event == "QUEST_DATA_LOAD_RESULT" then
            local questID, success = ...
            if success and GwObjectivesNotification.compass.dataIndex and questID == GwObjectivesNotification.compass.dataIndex then
                tracker_OnUpdate()
            end
        else
            C_Timer.After(0.25, function() tracker_OnUpdate() end)
        end
    end)

    -- some hooks to set the itembuttons correct
    hooksecurefunc(fBoss, "SetHeight", function() C_Timer.After(0.25, function() tracker_OnEvent(fQuest, "QUEST_WATCH_LIST_CHANGED") end) end)
    hooksecurefunc(fArenaBG, "SetHeight", function() C_Timer.After(0.25, function() tracker_OnEvent(fQuest, "QUEST_WATCH_LIST_CHANGED") end) end)
    fNotify:HookScript("OnShow", function() C_Timer.After(0.25, function() tracker_OnEvent(fQuest, "QUEST_WATCH_LIST_CHANGED") end) end)
    fNotify:HookScript("OnHide", function() C_Timer.After(0.25, function() tracker_OnEvent(fQuest, "QUEST_WATCH_LIST_CHANGED") end) end)
    hooksecurefunc(fAchv, "SetHeight", function() C_Timer.After(0.25, function() tracker_OnEvent(fQuest, "QUEST_WATCH_LIST_CHANGED") end) end)
    hooksecurefunc(fScen, "SetHeight", function() C_Timer.After(0.25, function() tracker_OnEvent(fQuest, "QUEST_WATCH_LIST_CHANGED") end) end)
    fCampaign:HookScript("OnSizeChanged", function() C_Timer.After(0.25, function() tracker_OnEvent(fQuest, "QUEST_WATCH_LIST_CHANGED") end) end)
    GwQuesttrackerContainerCampaign.header:HookScript("OnShow", function() C_Timer.After(0.25, function() tracker_OnEvent(fQuest, "QUEST_WATCH_LIST_CHANGED") end) end)
    GwQuesttrackerContainerCampaign.header:HookScript("OnHide", function() C_Timer.After(0.25, function() tracker_OnEvent(fQuest, "QUEST_WATCH_LIST_CHANGED") end) end)

    GW.RegisterMovableFrame(fTracker, OBJECTIVES_TRACKER_LABEL, "QuestTracker_pos", "VerticalActionBarDummy", {400, 10}, true, {"scaleable", "height"})
    fTracker:ClearAllPoints()
    fTracker:SetPoint("TOPLEFT", fTracker.gwMover)
    fTracker:SetHeight(GetSetting("QuestTracker_pos_height"))
end
GW.LoadQuestTracker = LoadQuestTracker
