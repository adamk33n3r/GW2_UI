local _, GW = ...
local L = GW.L
local GetSetting = GW.GetSetting
local RegisterMovableFrame = GW.RegisterMovableFrame
local GetUnitBattlefieldFaction = GW.GetUnitBattlefieldFaction
local RGBToHex = GW.RGBToHex
local GWGetClassColor = GW.GWGetClassColor
local Wait = GW.Wait
local GetUnitItemLevel = GW.GetUnitItemLevel
local PopulateUnitIlvlsCache = GW.PopulateUnitIlvlsCache
local COLOR_FRIENDLY = GW.COLOR_FRIENDLY
local nameRoleIcon = GW.nameRoleIcon

local MountIDs = {}
local targetList = {}
local classification = {
    worldboss = format("|cffAF5050 %s|r", BOSS),
    rareelite = format("|cffAF5050+ %s|r", ITEM_QUALITY3_DESC),
    elite = "|cffAF5050+|r",
    rare = format("|cffAF5050 %s|r", ITEM_QUALITY3_DESC)
}
local genderTable = {
    " " .. UNKNOWN .. " ",
    " " .. MALE .. " ",
    " " .. FEMALE .. " "
}

local TT = CreateFrame("Frame")

local UNSTYLED = {
    GameTooltip,
    ShoppingTooltip1,
    ShoppingTooltip2,
    ShoppingTooltip3,
    ItemRefShoppingTooltip1,
    ItemRefShoppingTooltip2,
    ItemRefShoppingTooltip3,
    WorldMapTooltip,
    WorldMapCompareTooltip1,
    WorldMapCompareTooltip2,
    WorldMapCompareTooltip3,
    AtlasLootTooltip,
    QuestHelperTooltip,
    QuestGuru_QuestWatchTooltip,
    TRP2_MainTooltip,
    TRP2_ObjetTooltip,
    TRP2_StaticPopupPersoTooltip,
    TRP2_PersoTooltip,
    TRP2_MountTooltip,
    AltoTooltip,
    AltoScanningTooltip,
    ArkScanTooltipTemplate,
    NxTooltipItem,
    NxTooltipD,
    DBMInfoFrame,
    DBMRangeCheck,
    DatatextTooltip,
    VengeanceTooltip,
    FishingBuddyTooltip,
    FishLibTooltip,
    HealBot_ScanTooltip,
    hbGameTooltip,
    PlateBuffsTooltip,
    LibGroupInSpecTScanTip,
    RecountTempTooltip,
    VuhDoScanTooltip,
    XPerl_BottomTip,
    EventTraceTooltip,
    FrameStackTooltip,
    PetBattlePrimaryUnitTooltip,
    PetBattlePrimaryAbilityTooltip,
    LibDBIconTooltip,
    FriendsTooltip,
    EmbeddedItemTooltip,
    RepurationParagonTooltip,
    WarCampaignTooltip,
    QuestScrollFrame.StoryTooltip,
    QuestScrollFrame.CampaignTooltip,
    QuickKeybindTooltip
}

local LEVEL1 = strlower(TOOLTIP_UNIT_LEVEL:gsub("%s?%%s%s?%-?", ""))
local LEVEL2 = strlower(TOOLTIP_UNIT_LEVEL_CLASS:gsub("^%%2$s%s?(.-)%s?%%1$s", "%1"):gsub("^%-?г?о?%s?", ""):gsub("%s?%%s%s?%-?", ""))

local function IsModKeyDown()
    local k = GetSetting("ADVANCED_TOOLTIP_ID_MODIFIER")
    return k == "ALWAYS" or ((k == "SHIFT" and IsShiftKeyDown()) or (k == "CTRL" and IsControlKeyDown()) or (k == "ALT" and IsAltKeyDown()))
end

local function GetKeystoneModifiers(linkType, ...)
    if type(linkType) ~= "string" then return end
    local modifierOffset = 4
    if linkType:find("item") then
        if ... == "138019" then
            modifierOffset = 16
        else
            return
        end
    elseif not linkType:find("keystone") then
        return
    end

    local modifiers = {}
    for i = modifierOffset, select("#", ...) do
        local num = strmatch(select(i, ...) or "", "^(%d+)")
        if num then
            local modifierID = tonumber(num)
            if modifierID then
                tinsert(modifiers, modifierID)
            end
        end
    end

    local numModifiers = #modifiers
    if modifiers[numModifiers] and modifiers[numModifiers] < 2 then
        tremove(modifiers, numModifiers)
    end

    return modifiers
end

local function movePlacement(self)
    local settings = GetSetting("GameTooltipPos")
    self:ClearAllPoints()
    self:SetPoint(settings.point, UIParent, settings.relativePoint, settings.xOfs, settings.yOfs)
end
GW.AddForProfiling("tooltips", "movePlacement", movePlacement)

local constBackdropArgs = {
    bgFile = "Interface/AddOns/GW2_UI/textures/uistuff/UI-Tooltip-Background",
    edgeFile = "Interface/AddOns/GW2_UI/textures/uistuff/UI-Tooltip-Border",
    tile = false,
    tileSize = 64,
    edgeSize = 32,
    insets = {left = 2, right = 2, top = 2, bottom = 2}
}

local function anchorTooltip(self, p)
    self:SetOwner(p, GetSetting("CURSOR_ANCHOR_TYPE"), GetSetting("ANCHOR_CURSOR_OFFSET_X"), GetSetting("ANCHOR_CURSOR_OFFSET_Y"))
end
GW.AddForProfiling("tooltips", "anchorTooltip", anchorTooltip)

local function SkinItemRefTooltip()
    local SkinItemRefTooltip_Update = function()
        if ItemRefTooltip:IsShown() then
            ItemRefTooltip.CloseButton:SetNormalTexture("Interface/AddOns/GW2_UI/textures/uistuff/window-close-button-normal")
            ItemRefTooltip.CloseButton:SetHighlightTexture("Interface/AddOns/GW2_UI/textures/uistuff/window-close-button-hover")
            ItemRefTooltip.CloseButton:SetPushedTexture("Interface/AddOns/GW2_UI/textures/uistuff/window-close-button-hover")
            ItemRefTooltip.CloseButton:SetSize(20, 20)
            ItemRefTooltip.CloseButton:ClearAllPoints()
            ItemRefTooltip.CloseButton:SetPoint("TOPRIGHT", -3, -3)
            ItemRefTooltip:StripTextures()
            ItemRefTooltip:CreateBackdrop(constBackdropArgs)

            if IsAddOnLoaded("Pawn") then
                if ItemRefTooltip.PawnIconFrame then ItemRefTooltip.PawnIconFrame.PawnIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9) end
            end
        end
    end

    hooksecurefunc("SetItemRef", SkinItemRefTooltip_Update)
end

local function SkinBattlePetTooltip()
    local skin_battle_pet_tt = function(self)
        self.BorderTopLeft:Hide()
        self.BorderTopRight:Hide()
        self.BorderBottomRight:Hide()
        self.BorderBottomLeft:Hide()
        self.BorderTop:Hide()
        self.BorderRight:Hide()
        self.BorderBottom:Hide()
        self.BorderLeft:Hide()
        self.Background:Hide()
        self:CreateBackdrop(constBackdropArgs)
    end

    hooksecurefunc("SharedPetBattleAbilityTooltip_SetAbility", function(self) skin_battle_pet_tt(self) end)

    local fbptt = function()
        if FloatingBattlePetTooltip:IsShown() then
            FloatingBattlePetTooltip.CloseButton:SetNormalTexture("Interface/AddOns/GW2_UI/textures/uistuff/window-close-button-normal")
            FloatingBattlePetTooltip.CloseButton:SetHighlightTexture("Interface/AddOns/GW2_UI/textures/uistuff/window-close-button-hover")
            FloatingBattlePetTooltip.CloseButton:SetPushedTexture("Interface/AddOns/GW2_UI/textures/uistuff/window-close-button-hover")
            FloatingBattlePetTooltip.CloseButton:SetSize(20, 20)
            FloatingBattlePetTooltip.CloseButton:ClearAllPoints()
            FloatingBattlePetTooltip.CloseButton:SetPoint("TOPRIGHT", -3, -3)

            skin_battle_pet_tt(FloatingBattlePetTooltip)
        end
    end
    hooksecurefunc("FloatingBattlePet_Show", fbptt)

    local bptt = function()
        skin_battle_pet_tt(BattlePetTooltip)
    end
    hooksecurefunc("BattlePetToolTip_Show", bptt)
end

local function SkinQueueStatusFrame()
    local QueueStatusFrame = _G.QueueStatusFrame

    QueueStatusFrame:StripTextures()
    QueueStatusFrame:CreateBackdrop(constBackdropArgs)
end

local function GetLevelLine(self, offset)
    if self:IsForbidden() then return end
    for i = offset, self:NumLines() do
        local tipLine = _G["GameTooltipTextLeft" .. i]
        local tipText = tipLine and tipLine.GetText and tipLine:GetText() and strlower(tipLine:GetText())
        if tipText and (strfind(tipText, LEVEL1) or strfind(tipText, LEVEL2)) then
            return tipLine
        end
    end
end

local function RemoveTrashLines(self)
    if self:IsForbidden() then return end
    for i = 3, self:NumLines() do
        local tiptext = _G["GameTooltipTextLeft" .. i]
        local linetext = tiptext:GetText()

        if linetext == PVP or linetext == FACTION_ALLIANCE or linetext == FACTION_HORDE then
            tiptext:SetText("")
            tiptext:Hide()
        end
    end
end

local function TT_OnEvent(_, event, unitGUID)
    if UnitExists("mouseover") and UnitGUID("mouseover") == unitGUID then
        local itemLevel, retryUnit, retryTable, iLevelDB = GetUnitItemLevel("mouseover")
        if itemLevel == "tooSoon" then
            Wait(0.05, function()
                local canUpdate = true
                for _, x in ipairs(retryTable) do
                    local slotInfo = GW.GetGearSlotInfo(retryUnit, x)
                    if slotInfo == "tooSoon" then
                        canUpdate = false
                    else
                        iLevelDB[x] = slotInfo.iLvl
                    end
                end

                if canUpdate then
                    local calculateItemLevel = GW.CalculateAverageItemLevel(iLevelDB, retryUnit)
                    PopulateUnitIlvlsCache(unitGUID, calculateItemLevel, "mouseover", true)
                end
            end)
        else
            PopulateUnitIlvlsCache(unitGUID, itemLevel, "mouseover", true)
        end
    end

    if event then
        TT:UnregisterEvent(event)
    end
end

local lastGUID
local function AddInspectInfo(tooltip, unit, numTries, r, g, b)
    if (not unit) or (numTries > 3) or not CanInspect(unit) then return end

    local unitGUID = UnitGUID(unit)
    if not unitGUID then return end

    if unitGUID == UnitGUID("player") then
        tooltip:AddDoubleLine(SPECIALIZATION .. ":", GW._GetSpecializationInfo(unit, true), nil, nil, nil, r, g, b)
        tooltip:AddDoubleLine(STAT_AVERAGE_ITEM_LEVEL .. ":", GetUnitItemLevel(unit), nil, nil, nil, 1, 1, 1)
    elseif GW.unitIlvlsCache[unitGUID] and GW.unitIlvlsCache[unitGUID].time then
        local specName = GW.unitIlvlsCache[unitGUID].specName
        local itemLevel = GW.unitIlvlsCache[unitGUID].itemLevel
        if not (specName and itemLevel) or (GetTime() - GW.unitIlvlsCache[unitGUID].time > 120) then
            GW.unitIlvlsCache[unitGUID].time = nil
            GW.unitIlvlsCache[unitGUID].specName = nil
            GW.unitIlvlsCache[unitGUID].itemLevel = nil
            return Wait(0.33, AddInspectInfo(tooltip, unit, numTries + 1, r, g, b))
        end

        tooltip:AddDoubleLine(SPECIALIZATION .. ":", specName, nil, nil, nil, r, g, b)
        tooltip:AddDoubleLine(STAT_AVERAGE_ITEM_LEVEL .. ":", itemLevel, nil, nil, nil, 1, 1, 1)
    elseif unitGUID then
        if not GW.unitIlvlsCache[unitGUID] then
            GW.unitIlvlsCache[unitGUID] = {unitColor = {r, g, b}}
        end

        if lastGUID ~= unitGUID then
            lastGUID = unitGUID
            NotifyInspect(unit)
            TT:RegisterEvent("INSPECT_READY")
            TT:SetScript("OnEvent", TT_OnEvent)
        else
            TT_OnEvent(TT, nil, unitGUID)
        end
    end
end

local function SetUnitText(self, unit, isShiftKeyDown)
    local name, realm = UnitName(unit)
    local showClassColor = GetSetting("ADVANCED_TOOLTIP_SHOW_CLASS_COLOR")

    if UnitIsPlayer(unit) then
        local localeClass, class = UnitClass(unit)
        if not localeClass or not class then return end

        local guildName, guildRankName, _, guildRealm = GetGuildInfo(unit)
        local relationship = UnitRealmRelationship(unit)
        local pvpName = UnitPVPName(unit)
        local gender = UnitSex(unit)
        local level, realLevel = UnitEffectiveLevel(unit), UnitLevel(unit)
        local playerTitles = GetSetting("ADVANCED_TOOLTIP_SHOW_PLAYER_TITLES")
        local alwaysShowRealm = GetSetting("ADVANCED_TOOLTIP_SHOW_REALM_ALWAYS")
        local guildRanks = GetSetting("ADVANCED_TOOLTIP_SHOW_GUILD_RANKS")
        local showRole = GetSetting("ADVANCED_TOOLTIP_SHOW_ROLE")
        local showGender = GetSetting("ADVANCED_TOOLTIP_SHOW_GENDER")
        local showDungeonScore = GetSetting("ADVANCED_TOOLTIP_SHOW_DUNGEONSCORE")

        local nameColor = GWGetClassColor(class, showClassColor, true)

        if pvpName and playerTitles then
            name = pvpName
        end

        if realm and realm ~= "" then
            if isShiftKeyDown or alwaysShowRealm then
                name = name .. "-" .. realm
            elseif relationship == LE_REALM_RELATION_COALESCED then
                name = name .. FOREIGN_SERVER_LABEL
            elseif relationship == LE_REALM_RELATION_VIRTUAL then
                name = name .. INTERACTIVE_SERVER_LABEL
            end
        end

        name = name .. ((UnitIsAFK(unit) and " |cffFFFFFF[|r|cffFF0000" .. AFK .. "|r|cffFFFFFF]|r") or (UnitIsDND(unit) and " |cffFFFFFF[|r|cffFFFF00" .. DND .. "|r|cffFFFFFF]|r") or "")

        GameTooltipTextLeft1:SetFormattedText("|c%s%s|r", nameColor.colorStr, name or UNKNOWN)

        local lineOffset = 2
        if guildName then
            if guildRealm and isShiftKeyDown then
                guildName = guildName .. "-" .. guildRealm
            end

            if guildRanks then
                GameTooltipTextLeft2:SetFormattedText("<|cff00ff10%s|r> [|cff00ff10%s|r]", guildName, guildRankName)
            else
                GameTooltipTextLeft2:SetFormattedText("<|cff00ff10%s|r>", guildName)
            end

            lineOffset = 3
        end

        local levelLine = GetLevelLine(self, lineOffset)
        if levelLine then
            local diffColor = GetCreatureDifficultyColor(level)
            local race, englishRace = UnitRace(unit)
            local _, localizedFaction = GetUnitBattlefieldFaction(unit)
            if localizedFaction and englishRace == "Pandaren" then race = localizedFaction .. " " .. race end
            local hexColor = RGBToHex(diffColor.r, diffColor.g, diffColor.b)
            local unitGender = showGender and genderTable[gender]
            if level < realLevel then
                levelLine:SetFormattedText("%s%s|r |cffFFFFFF(%s)|r %s%s |c%s%s|r", hexColor, level > 0 and level or '??', realLevel, unitGender or "", race or '', nameColor.colorStr, localeClass)
            else
                levelLine:SetFormattedText("%s%s|r %s%s |c%s%s|r", hexColor, level > 0 and level or "??", unitGender or "", race or "", nameColor.colorStr, localeClass)
            end
        end

        if showRole then
            local r, g, b, role = 1, 1, 1, UnitGroupRolesAssigned(unit)
            if IsInGroup() and (UnitInParty(unit) or UnitInRaid(unit)) and (role ~= "NONE") then
                if role == "HEALER" then
                    role, r, g, b = nameRoleIcon[role] .. HEALER, 0, 1, 0.59
                elseif role == "TANK" then
                    role, r, g, b = nameRoleIcon[role] .. TANK, 0.51, 0.67, 0.9
                elseif role == "DAMAGER" then
                    role, r, g, b = nameRoleIcon[role] .. DAMAGER, 0.77, 0.12, 0.24
                end
                -- if in raid add also the assist function here eg: Role:      [] Tank ([] Maintank)
                local isGroupLeader = UnitIsGroupLeader(unit)
                local isGroupAssist = UnitIsGroupAssistant(unit)
                local raidId = UnitInRaid(unit)
                local raidRole = ""
                if raidId then
                    local raidR = select(10, GetRaidRosterInfo(raidId))
                    if raidR == "MAINTANK" then raidRole = " (|TInterface/AddOns/GW2_UI/textures/party/icon-maintank:0:0:0:-3:64:64:4:60:4:60|t " .. MAINTANK .. ")" end
                    if raidR == "MAINASSIST" then raidRole = " (|TInterface/AddOns/GW2_UI/textures/party/icon-mainassist:0:0:0:-1:64:64:4:60:4:60|t " .. MAIN_ASSIST .. ")" end
                end

                GameTooltip:AddDoubleLine(format("%s:", ROLE), role .. raidRole, nil, nil, nil, r, g, b)
                if isGroupLeader or isGroupAssist then
                    local roleString
                    if isGroupLeader then
                        roleString = "|TInterface/AddOns/GW2_UI/textures/party/icon-groupleader:0:0:0:-2:64:64:4:60:4:60|t " .. (IsInRaid() and RAID_LEADER or PARTY_LEADER)
                    else
                        roleString = "|TInterface/AddOns/GW2_UI/textures/party/icon-assist:0:0:0:-2:64:64:4:60:4:60|t " .. RAID_ASSISTANT
                    end
                    GameTooltip:AddDoubleLine(" ", roleString, nil, nil, nil, r, g, b)
                end
            end
        end

        if showDungeonScore then
            local data = C_PlayerInfo.GetPlayerMythicPlusRatingSummary(unit)
            if data and data.currentSeasonScore and data.currentSeasonScore > 0 then
                local color = C_ChallengeMode.GetDungeonScoreRarityColor(data.currentSeasonScore)

                GameTooltip:AddDoubleLine(DUNGEON_SCORE_LEADER:format("@"):gsub(": @", ""), GW.CommaValue(data.currentSeasonScore), nil, nil, nil, color.r or 1, color.g or 1, color.b or 1)
            end
        end

        return nameColor
    else
        local levelLine = GetLevelLine(self, 2)
        if levelLine then
            local isPetWild, isPetCompanion = UnitIsWildBattlePet(unit), UnitIsBattlePetCompanion(unit)
            local creatureClassification = UnitClassification(unit)
            local creatureType = UnitCreatureType(unit)
            local pvpFlag, diffColor

            local level = UnitEffectiveLevel(unit)
            if isPetWild or isPetCompanion then
                level = UnitBattlePetLevel(unit)

                local petType = _G["BATTLE_PET_NAME_" .. UnitBattlePetType(unit)]
                if creatureType then
                    creatureType = format("%s %s", creatureType, petType)
                else
                    creatureType = petType
                end

                local teamLevel = C_PetJournal.GetPetTeamAverageLevel()
                if teamLevel then
                    diffColor = GetRelativeDifficultyColor(teamLevel, level)
                else
                    diffColor = GetCreatureDifficultyColor(level)
                end
            else
                diffColor = GetCreatureDifficultyColor(level)
            end

            if UnitIsPVP(unit) then
                pvpFlag = format(" (%s)", PVP)
            end

            levelLine:SetFormattedText("|cff%02x%02x%02x%s|r%s %s%s", diffColor.r * 255, diffColor.g * 255, diffColor.b * 255, level > 0 and level or "??", classification[creatureClassification] or "", creatureType or "", pvpFlag or "")
        end

        local unitReaction = UnitReaction(unit, "player")
        local nameColor = unitReaction and showClassColor and GW.FACTION_BAR_COLORS[unitReaction] or RAID_CLASS_COLORS.PRIEST
        if unitReaction and unitReaction >= 5 then nameColor = COLOR_FRIENDLY[1] end --Friend
        local nameColorStr = nameColor.colorStr or RGBToHex(nameColor.r, nameColor.g, nameColor.b, "ff")

        GameTooltipTextLeft1:SetFormattedText("|c%s%s|r", nameColorStr, name or UNKNOWN)

        return UnitIsTapDenied(unit) and {r = 159 / 255, g = 159 / 255, b = 159 / 255} or nameColor
    end
end

local function GameTooltip_OnTooltipSetUnit(self)
    if self:IsForbidden() then return end

    local unit = select(2, self:GetUnit())
    local isShiftKeyDown = IsShiftKeyDown()
    local isControlKeyDown = IsControlKeyDown()
    local isPlayerUnit = UnitIsPlayer(unit)

    if not unit then
        local GMF = GetMouseFocus()
        if GMF and GMF.GetAttribute and GMF:GetAttribute("unit") then
            unit = GMF:GetAttribute("unit")
        end
        if not unit or not UnitExists(unit) then
            return
        end
    end

    RemoveTrashLines(self) -- keep an eye on this may be buggy

    local showMount = GetSetting("ADVANCED_TOOLTIP_SHOW_MOUNT")
    local showClassColor = GetSetting("ADVANCED_TOOLTIP_SHOW_CLASS_COLOR")

    if showMount and not isShiftKeyDown and unit ~= "player" and isPlayerUnit then
        for i = 1, 40 do
            local name, _, _, _, _, _, _, _, _, id = UnitBuff(unit, i)
            if not name then break end

            if MountIDs[id] then
                local _, _, sourceText = C_MountJournal.GetMountInfoExtraByID(MountIDs[id])
                self:AddDoubleLine(format("%s:", MOUNT), name, nil, nil, nil, 1, 1, 1)

                local mountText = isControlKeyDown and sourceText and gsub(sourceText, "|n%s+|n", "|n")
                if mountText then
                    local sourceModified = gsub(mountText, "|n", "\10")
                    for x in gmatch(sourceModified, "[^\10]+\10?") do
                        local left, right = strmatch(x, "(.-|r)%s?([^\10]+)\10?")
                        if left and right then
                            self:AddDoubleLine(left, right, nil, nil, nil, 1, 1, 1)
                        else
                            self:AddDoubleLine(FROM, gsub(mountText, "|c%x%x%x%x%x%x%x%x",""), nil, nil, nil, 1, 1, 1)
                        end
                    end
                end

                break
            end
        end
    end

    if not isShiftKeyDown and not isControlKeyDown then
        local unitTarget = unit .. "target"
        local targetInfo = GetSetting("ADVANCED_TOOLTIP_SHOW_TARGET_INFO")
        if targetInfo and unit ~= "player" and UnitExists(unitTarget) then
            local targetColor
            if UnitIsPlayer(unitTarget) and not UnitHasVehicleUI(unitTarget) then
                local _, class = UnitClass(unitTarget)
                targetColor = GWGetClassColor(class, showClassColor, true)
            else
                targetColor = GW.FACTION_BAR_COLORS[UnitReaction(unitTarget, "player")]
            end

            if not targetColor.colorStr then
                targetColor.colorStr = RGBToHex(targetColor.r, targetColor.g, targetColor.b, "ff")
            elseif strlen(targetColor.colorStr) == 6 then
                targetColor.colorStr = "ff" .. targetColor.colorStr
            end
            self:AddDoubleLine(format("%s:", TARGET), format("|c%s%s|r", targetColor.colorStr, UnitName(unitTarget)))
        end

        if targetInfo and IsInGroup() then
            for i = 1, GetNumGroupMembers() do
                local groupUnit = (IsInRaid() and "raid" .. i or "party" .. i)
                if (UnitIsUnit(groupUnit .. "target", unit)) and (not UnitIsUnit(groupUnit, "player")) then
                    local _, class = UnitClass(groupUnit)
                    local classColor = GWGetClassColor(class, showClassColor, true)
                    tinsert(targetList, format("|c%s%s|r", classColor.colorStr, UnitName(groupUnit)))
                end
            end
            local numList = #targetList
            if (numList > 0) then
                self:AddLine(format("%s (|cffffffff%d|r): %s", L["Targeted by:"], numList, table.concat(targetList, ", ")), nil, nil, nil, true)
                wipe(targetList)
            end
        end
    end

    local color = SetUnitText(self, unit, isShiftKeyDown)
    if isShiftKeyDown and isPlayerUnit then
        AddInspectInfo(self, unit, 0, color.r, color.g, color.b)
    end

    -- NPC ID's
    if unit and IsModKeyDown() and not isPlayerUnit then
        if C_PetBattles.IsInBattle() then return end
        local guid = UnitGUID(unit) or ""
        local id = tonumber(strmatch(guid, "%-(%d-)%-%x-$"), 10)
        if id then
            self:AddLine(format(("*%s|r %d"):gsub("*", GW.Gw2Color), ID, id))
        end
    end
end

local function GameTooltip_OnTooltipCleared(self)
    if self:IsForbidden() then return end
    self.itemCleared = nil
end

local function ScanKeystone(self, link)
    if GetSetting("ADVANCED_TOOLTIP_SHOW_KEYSTONEINFO") then
        if not link then
            _, link = self:GetItem()
        end
        if type(link) == "string" then
            local modifiers = GetKeystoneModifiers(strsplit(":", link))
            if modifiers then
                for _, modifierID in ipairs(modifiers) do
                    local modifierName, modifierDescription = C_ChallengeMode.GetAffixInfo(modifierID)
                    if modifierName and modifierDescription then
                        self:AddLine(format("|cff00ff00%s|r - %s", modifierName, modifierDescription), 0, 1, 0, true)
                    end
                end
                self:Show()
            end
        end
    end
end

local function SetHyperlink(self, link)
    if self:IsForbidden() then return end

    if select(3, string.find(link, "(%a-):")) == "achievement" then
        local _, _, achievementID = string.find(link, ":(%d+):")
        local _, _, GUID = string.find(link, ":%d+:(.-):")

        if GUID == UnitGUID("player") then
            self:Show()
            return
        end

        self:AddLine(" ")
        local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, earnedBy = GetAchievementInfo(achievementID)

        if completed then
            if earnedBy then
                if earnedBy ~= "" then
                    self:AddLine(format(ACHIEVEMENT_EARNED_BY, earnedBy))
                end
                if not wasEarnedByMe then
                    self:AddLine(format(ACHIEVEMENT_NOT_COMPLETED_BY, GW.myname))
                elseif GW.myname ~= earnedBy then
                    self:AddLine(format(ACHIEVEMENT_COMPLETED_BY, GW.myname))
                end
            end
        end
        self:Show()
        return
    end
    ScanKeystone(self, link)
end

local function GameTooltip_OnTooltipSetItem(self, link)
    if self:IsForbidden() then return end

    if not self.itemCleared then
        local _, link = self:GetItem()
        local num = GetItemCount(link)
        local numall = GetItemCount(link, true)
        local left, right, bankCount = " ", " ", " "
        local itemCountOption = GetSetting("ADVANCED_TOOLTIP_OPTION_ITEMCOUNT")

        if link ~= nil and IsModKeyDown() then
            right = format(("*%s|r %s"):gsub("*", GW.Gw2Color), ID, strmatch(link, ":(%w+)"))
        end

        if itemCountOption == "BAG" then
            left = format(("*%s|r %d"):gsub("*", GW.Gw2Color), INVENTORY_TOOLTIP, num)
        elseif itemCountOption == "BANK" then
            bankCount = format(("*%s|r %d"):gsub("*", GW.Gw2Color), BANK, (numall - num))
        elseif itemCountOption == "BOTH" then
            left = format(("*%s|r %d"):gsub("*", GW.Gw2Color), INVENTORY_TOOLTIP, num)
            bankCount = format(("*%s|r %d"):gsub("*", GW.Gw2Color), BANK, (numall - num))
        end

        if left ~= " " or right ~= " " then
            self:AddLine(" ")
            self:AddDoubleLine(left, right)
        end
        if bankCount ~= " " then
            self:AddDoubleLine(bankCount, " ")
        end

        ScanKeystone(self, link)

        self.itemCleared = true
    end
end

local function GameTooltip_OnTooltipSetSpell(self)
    if self:IsForbidden() then return end
    local id = select(2, self:GetSpell())
    if id and IsModKeyDown() then

        local displayString = format(("*%s|r %d"):gsub("*", GW.Gw2Color), ID, id)

        for i = 1, self:NumLines() do
            local line = _G[format("GameTooltipTextLeft%d", i)]
            local text = line and line.GetText and line:GetText()
            if text and strfind(text, displayString) then
                return
            end
        end

        self:AddLine(displayString)
        self:Show()
    end
end

local function SetUnitAuraData(self, id, caster)
    if id then
        local mountText
        if MountIDs[id] then
            local _, _, sourceText = C_MountJournal.GetMountInfoExtraByID(MountIDs[id])
            mountText = sourceText and gsub(sourceText, "|n%s+|n", "|n")

            if mountText then
                self:AddLine(" ")
                self:AddLine(mountText, 1, 1, 1)
            end
        end

        local showClassColor = GetSetting("ADVANCED_TOOLTIP_SHOW_CLASS_COLOR")

        if IsModKeyDown() then
            if mountText then
                self:AddLine(" ")
            end

            if caster then
                local name = UnitName(caster)
                local _, class = UnitClass(caster)
                local color = GWGetClassColor(class, showClassColor, true)
                self:AddDoubleLine(format(("*%s|r %d"):gsub("*", GW.Gw2Color), ID, id), format("|c%s%s|r", color.colorStr, name))
            else
                self:AddLine(format(("*%s|r %d"):gsub("*", GW.Gw2Color), ID, id))
            end
        end

        self:Show()
    end
end

local function SetUnitBuff(self, unit, index, filter)
    if not self or self:IsForbidden() then return end
    local _, _, _, _, _, _, caster, _, _, id = UnitBuff(unit, index, filter)

    SetUnitAuraData(self, id, caster)
end

local function SetUnitDebuff(self, unit, index, filter)
    if not self or self:IsForbidden() then return end
    local _, _, _, _, _, _, caster, _, _, id = UnitDebuff(unit, index, filter)

    SetUnitAuraData(self, id, caster)
end

local function SetToyByItemID(self, id)
    if self:IsForbidden() then return end

    if id and IsModKeyDown() then
        self:AddLine(format(("*%s|r %d"):gsub("*", GW.Gw2Color), ID, id))
        self:Show()
    end
end

local function SetCurrencyToken(self, idx)
    if self:IsForbidden() then return end

    if idx and IsModKeyDown() then
        local id = tonumber(strmatch(C_CurrencyInfo.GetCurrencyListLink(idx),"currency:(%d+)"))
        self:AddLine(format(("*%s|r %d"):gsub("*", GW.Gw2Color), ID, id))
        self:Show()
    end
end

local function SetCurrencyTokenByID(self, id)
    if self:IsForbidden() then return end

    if id and IsModKeyDown() then
        self:AddLine(format(("*%s|r %d"):gsub("*", GW.Gw2Color), ID, id))
        self:Show()
    end
end

local function QuestID(self)
    if not self or self:IsForbidden() then return end

    local id = self.questLogIndex and C_QuestLog.GetQuestIDForLogIndex(self.questLogIndex) or self.questID
    if id and IsModKeyDown() then
        GameTooltip:AddLine(format(("*%s|r %d"):gsub("*", GW.Gw2Color), _G.ID, id))
        GameTooltip:Show()
    end
end

local function SetBackpackToken(self, id)
    if self:IsForbidden() then return end

    if id and IsModKeyDown() then
        local info = C_CurrencyInfo.GetBackpackCurrencyInfo(id)
        if info and info.currencyTypesID then
            self:AddLine(format(("*%s|r %d"):gsub("*", GW.Gw2Color), ID, id))
            self:Show()
        end
    end
end

local function SkinProgressbar(self)
    if not self or self:IsForbidden() or not self.progressBarPool then return end

    local sb = self.progressBarPool:GetNextActive()
    if (not sb or not sb.Bar) or sb.Bar.backdrop then return end

    sb.Bar:StripTextures()
    sb.Bar:CreateBackdrop()
    sb.Bar:SetStatusBarTexture("Interface/Addons/GW2_UI/textures/uistuff/gwstatusbar")
    sb.Bar.BorderLeft:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar-bg")
    sb.Bar.BorderRight:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar-bg")
    sb.Bar.BorderMid:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar-bg")
    sb.Bar.LeftDivider:Hide()
    sb.Bar.RightDivider:Hide()

    self.pbBar = sb.Bar
end

local function SetStyle(tooltip)
    if not tooltip or (tooltip == GW.ScanTooltip or tooltip.IsEmbedded or not tooltip.SetBackdrop) or tooltip:IsForbidden() then return end

    tooltip:SetBackdrop(constBackdropArgs)
end

local function LoadTooltips()
    -- Style Tooltips first
    for _, tooltip in pairs(UNSTYLED) do
        SetStyle(tooltip)
    end
    hooksecurefunc("SharedTooltip_SetBackdropStyle", SetStyle)
    GameTooltipStatusBar:SetStatusBarTexture("Interface/Addons/GW2_UI/textures/hud/castinbar-white")
    GameTooltip.ItemTooltip.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
    hooksecurefunc("GameTooltip_ShowProgressBar", SkinProgressbar)

    if GetSetting("TOOLTIP_MOUSE") then
        hooksecurefunc("GameTooltip_SetDefaultAnchor", anchorTooltip)
    else
        GameTooltip:HookScript("OnTooltipSetUnit", movePlacement)
        GameTooltip:HookScript("OnTooltipSetQuest", movePlacement)
        --GameTooltip:HookScript("OnTooltipSetItem", movePlacement)
        GameTooltip:HookScript("OnTooltipSetSpell", movePlacement)
        GameTooltip:HookScript("OnTooltipSetDefaultAnchor", movePlacement)
        RegisterMovableFrame(GameTooltip, "Tooltip", "GameTooltipPos", "VerticalActionBarDummy", {230, 80}, true, {"default"})
        hooksecurefunc(GameTooltip.gwMover, "StopMovingOrSizing", function (frame)
            local anchor = "BOTTOMRIGHT"
            local x = frame:GetRight() - GetScreenWidth()
            local y = frame:GetBottom()

            frame:ClearAllPoints()
            frame:SetPoint(anchor, x, y)

            if not InCombatLockdown() then
                GameTooltip:ClearAllPoints()
                GameTooltip:SetPoint(frame:GetPoint())
            end
        end)
    end
    SkinItemRefTooltip()
    SkinQueueStatusFrame()
    SkinBattlePetTooltip()

    if IsAddOnLoaded("Pawn") then
        hooksecurefunc("GameTooltip_ShowCompareItem", function(self)
            if not self then return end
            local tt1, tt2 = unpack(self.shoppingTooltips)
            if tt1.PawnIconFrame then tt1.PawnIconFrame.PawnIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9) end
            if tt2.PawnIconFrame then tt2.PawnIconFrame.PawnIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9) end
        end)
    end

    if GetSetting("ADVANCED_TOOLTIP") then
        local mountIDs = C_MountJournal.GetMountIDs()

        for _, mountID in ipairs(mountIDs) do
            MountIDs[select(2, C_MountJournal.GetMountInfoByID(mountID))] = mountID
        end

        GameTooltip:HookScript("OnTooltipSetUnit", GameTooltip_OnTooltipSetUnit)
        GameTooltip:HookScript("OnTooltipSetItem", GameTooltip_OnTooltipSetItem)
        GameTooltip:HookScript("OnTooltipCleared", GameTooltip_OnTooltipCleared)
        GameTooltip:HookScript("OnTooltipSetSpell", GameTooltip_OnTooltipSetSpell)
        hooksecurefunc(GameTooltip, "SetToyByItemID", SetToyByItemID)
        hooksecurefunc(GameTooltip, "SetUnitBuff", SetUnitBuff)
        hooksecurefunc(GameTooltip, "SetUnitDebuff", SetUnitDebuff)
        hooksecurefunc(GameTooltip, "SetCurrencyToken", SetCurrencyToken)
        hooksecurefunc(GameTooltip, "SetCurrencyTokenByID", SetCurrencyTokenByID)
        hooksecurefunc(GameTooltip, "SetBackpackToken", SetBackpackToken)
        hooksecurefunc("QuestMapLogTitleButton_OnEnter", QuestID)
        hooksecurefunc(GameTooltip, "SetHyperlink", SetHyperlink)
        hooksecurefunc(ItemRefTooltip, "SetHyperlink", SetHyperlink)

        local eventFrame = CreateFrame("Frame")
        eventFrame:RegisterEvent("MODIFIER_STATE_CHANGED")
        eventFrame:SetScript("OnEvent", function(_, _, key)
            if key == "LSHIFT" or key == "RSHIFT" or key == "LCTRL" or key == "RCTRL" or key == 'LALT' or key == 'RALT' then
                if UnitExists("mouseover") then
                    GameTooltip:SetUnit("mouseover")
                end
            end
        end)
    end
end
GW.LoadTooltips = LoadTooltips
