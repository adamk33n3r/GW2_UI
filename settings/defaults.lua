local _, GW = ...

local GW_DEFAULT = GW.DEFAULTS or {}
GW.DEFAULTS = GW_DEFAULT

GW_DEFAULT["GW2_UI_VERSION"] = "WELCOME"

GW_DEFAULT["TARGET_ENABLED"] = true
GW_DEFAULT["FOCUS_ENABLED"] = true
GW_DEFAULT["POWERBAR_ENABLED"] = true
GW_DEFAULT["CHATBUBBLES_ENABLED"] = true
GW_DEFAULT["NAMEPLATES_ENABLED"] = true
GW_DEFAULT["MINIMAP_ENABLED"] = true
GW_DEFAULT["QUESTTRACKER_ENABLED"] = true
GW_DEFAULT["TOOLTIPS_ENABLED"] = true
GW_DEFAULT["CHATFRAME_ENABLED"] = true
GW_DEFAULT["QUESTVIEW_ENABLED"] = true
GW_DEFAULT["HEALTHGLOBE_ENABLED"] = true
GW_DEFAULT["PLAYER_BUFFS_ENABLED"] = true
GW_DEFAULT["ACTIONBARS_ENABLED"] = true
GW_DEFAULT["BAGS_ENABLED"] = true
GW_DEFAULT["NPC_CAM_ENABLED"] = false
GW_DEFAULT["FONTS_ENABLED"] = true
GW_DEFAULT["CASTINGBAR_ENABLED"] = true
GW_DEFAULT["HIDEACTIONBAR_BACKGROUND_ENABLED"] = false
GW_DEFAULT["SHOW_QUESTTRACKER_COMPASS"] = true
GW_DEFAULT["MINIMAP_HOVER"] = "NONE"
GW_DEFAULT["CLASS_POWER"] = true
GW_DEFAULT["RAID_FRAMES"] = true
GW_DEFAULT["PARTY_FRAMES"] = true
GW_DEFAULT["PETBAR_ENABLED"] = true
GW_DEFAULT["BORDER_ENABLED"] = true
GW_DEFAULT["TOOLTIP_MOUSE"] = false
GW_DEFAULT["ADVANCED_TOOLTIP"] = true
GW_DEFAULT["ADVANCED_TOOLTIP_OPTION_ITEMCOUNT"] = "BOTH"
GW_DEFAULT["ADVANCED_TOOLTIP_SHOW_MOUNT"] = true
GW_DEFAULT["ADVANCED_TOOLTIP_SHOW_TARGET_INFO"] = true
GW_DEFAULT["ADVANCED_TOOLTIP_SHOW_PLAYER_TITLES"] = true
GW_DEFAULT["ADVANCED_TOOLTIP_SHOW_REALM_ALWAYS"] = true
GW_DEFAULT["ADVANCED_TOOLTIP_SHOW_GUILD_RANKS"] = true
GW_DEFAULT["ADVANCED_TOOLTIP_SHOW_ROLE"] = true
GW_DEFAULT["ADVANCED_TOOLTIP_SHOW_CLASS_COLOR"] = true
GW_DEFAULT["ADVANCED_TOOLTIP_SHOW_GENDER"] = false
GW_DEFAULT["ADVANCED_TOOLTIP_SHOW_DUNGEONSCORE"] = true
GW_DEFAULT["ADVANCED_TOOLTIP_SHOW_KEYSTONEINFO"] = true
GW_DEFAULT["ADVANCED_TOOLTIP_ID_MODIFIER"] = "NONE"
GW_DEFAULT["DYNAMIC_CAM"] = false
GW_DEFAULT["PIXEL_PERFECTION"] = false
GW_DEFAULT["XPBAR_ENABLED"] = true
GW_DEFAULT["ALERTFRAME_ENABLED"] = true

GW_DEFAULT["GW_COMBAT_TEXT_MODE"] = "GW2"
GW_DEFAULT["GW_COMBAT_TEXT_BLIZZARD_COLOR"] = false
GW_DEFAULT["GW_COMBAT_TEXT_COMMA_FORMAT"] = false

GW_DEFAULT["PET_FLOATING_COMBAT_TEXT"] = false
GW_DEFAULT["PET_AURAS_UNDER"] = false

GW_DEFAULT["BUTTON_ASSIGNMENTS"] = true

GW_DEFAULT["HUD_BACKGROUND"] = true
GW_DEFAULT["HUD_SPELL_SWAP"] = true

GW_DEFAULT["BAG_ITEM_SIZE"] = 40

GW_DEFAULT["PLAYER_UNIT_HEALTH"] = "VALUE"
GW_DEFAULT["PLAYER_UNIT_ABSORB"] = "VALUE"

GW_DEFAULT["BAG_WIDTH"] = 480
GW_DEFAULT["BAG_REVERSE_NEW_LOOT"] = false
GW_DEFAULT["BAG_REVERSE_SORT"] = false
GW_DEFAULT["BAG_ITEMS_REVERSE_SORT"] = false
GW_DEFAULT["BAG_ITEM_QUALITY_BORDER_SHOW"] = true
GW_DEFAULT["BAG_ITEM_JUNK_ICON_SHOW"] = false
GW_DEFAULT["BAG_ITEM_SCRAP_ICON_SHOW"] = false
GW_DEFAULT["BAG_ITEM_UPGRADE_ICON_SHOW"] = false
GW_DEFAULT["BAG_PROFESSION_BAG_COLOR"] = true
GW_DEFAULT["BAG_VENDOR_GRAYS"] = false
GW_DEFAULT["BAG_SHOW_ILVL"] = false
GW_DEFAULT["BAG_SEPARATE_BAGS"] = false
GW_DEFAULT["BAG_HEADER_NAME0"] = ""
GW_DEFAULT["BAG_HEADER_NAME1"] = ""
GW_DEFAULT["BAG_HEADER_NAME2"] = ""
GW_DEFAULT["BAG_HEADER_NAME3"] = ""
GW_DEFAULT["BAG_HEADER_NAME4"] = ""

GW_DEFAULT["BAG_DEFAULT_CONTAINER_POSITION"] = {}
GW_DEFAULT["BAG_DEFAULT_CONTAINER_POSITION"]["point"] = "BOTTOMRIGHT"
GW_DEFAULT["BAG_DEFAULT_CONTAINER_POSITION"]["relativePoint"] = "BOTTOMRIGHT"
GW_DEFAULT["BAG_DEFAULT_CONTAINER_POSITION"]["xOfs"] = -400
GW_DEFAULT["BAG_DEFAULT_CONTAINER_POSITION"]["yOfs"] = 20

GW_DEFAULT["BAG_POSITION"] = {}
GW_DEFAULT["BAG_POSITION"]["point"] = "TOPRIGHT"
GW_DEFAULT["BAG_POSITION"]["relativePoint"] = "TOPRIGHT"
GW_DEFAULT["BAG_POSITION"]["xOfs"] = -20
GW_DEFAULT["BAG_POSITION"]["yOfs"] = -60

GW_DEFAULT["BANK_WIDTH"] = 720
GW_DEFAULT["BANK_REVERSE_SORT"] = false

GW_DEFAULT["BANK_POSITION"] = {}
GW_DEFAULT["BANK_POSITION"]["point"] = "TOPLEFT"
GW_DEFAULT["BANK_POSITION"]["relativePoint"] = "TOPLEFT"
GW_DEFAULT["BANK_POSITION"]["xOfs"] = 60
GW_DEFAULT["BANK_POSITION"]["yOfs"] = -60

GW_DEFAULT["HERO_POSITION"] = {}
GW_DEFAULT["HERO_POSITION"]["point"] = "LEFT"
GW_DEFAULT["HERO_POSITION"]["relativePoint"] = "LEFT"
GW_DEFAULT["HERO_POSITION"]["xOfs"] = 100
GW_DEFAULT["HERO_POSITION"]["yOfs"] = 0
GW_DEFAULT["HERO_POSITION_SCALE"] = 1

GW_DEFAULT["SOCIAL_POSITION"] = {}
GW_DEFAULT["SOCIAL_POSITION"]["point"] = "LEFT"
GW_DEFAULT["SOCIAL_POSITION"]["relativePoint"] = "LEFT"
GW_DEFAULT["SOCIAL_POSITION"]["xOfs"] = 100
GW_DEFAULT["SOCIAL_POSITION"]["yOfs"] = 0
GW_DEFAULT["SOCIAL_POSITION_SCALE"] = 1

GW_DEFAULT["LOOTFRAME_POS"] = {}
GW_DEFAULT["LOOTFRAME_POS"]["point"] = "LEFT"
GW_DEFAULT["LOOTFRAME_POS"]["relativePoint"] = "LEFT"
GW_DEFAULT["LOOTFRAME_POS"]["xOfs"] = 20
GW_DEFAULT["LOOTFRAME_POS"]["yOfs"] = -45
GW_DEFAULT["LOOTFRAME_POS_scale"] = 1

GW_DEFAULT["VEHICLE_SEAT_POS"] = {}
GW_DEFAULT["VEHICLE_SEAT_POS"]["point"] = "LEFT"
GW_DEFAULT["VEHICLE_SEAT_POS"]["relativePoint"] = "LEFT"
GW_DEFAULT["VEHICLE_SEAT_POS"]["xOfs"] = 20
GW_DEFAULT["VEHICLE_SEAT_POS"]["yOfs"] = -45
GW_DEFAULT["VEHICLE_SEAT_POS_scale"] = 1

GW_DEFAULT["MAILBOX_POSITION"] = {}
GW_DEFAULT["MAILBOX_POSITION"]["point"] = "TOPLEFT"
GW_DEFAULT["MAILBOX_POSITION"]["relativePoint"] = "TOPLEFT"
GW_DEFAULT["MAILBOX_POSITION"]["xOfs"] = 16
GW_DEFAULT["MAILBOX_POSITION"]["yOfs"] = -116

GW_DEFAULT["GW_SHOW_MULTI_ACTIONBAR_1"] = false
GW_DEFAULT["GW_SHOW_MULTI_ACTIONBAR_2"] = false
GW_DEFAULT["GW_SHOW_MULTI_ACTIONBAR_3"] = false
GW_DEFAULT["GW_SHOW_MULTI_ACTIONBAR_4"] = false
GW_DEFAULT["FADE_MULTIACTIONBAR_1"] = "ALWAYS"
GW_DEFAULT["FADE_MULTIACTIONBAR_2"] = "ALWAYS"
GW_DEFAULT["FADE_MULTIACTIONBAR_3"] = "ALWAYS"
GW_DEFAULT["FADE_MULTIACTIONBAR_4"] = "ALWAYS"
GW_DEFAULT["HIDE_CHATSHADOW"] = false
GW_DEFAULT["HIDE_QUESTVIEW"] = false
GW_DEFAULT["USE_CHAT_BUBBLES"] = false
GW_DEFAULT["DISABLE_NAMEPLATES"] = false
GW_DEFAULT["DISABLE_TOOLTIPS"] = false
GW_DEFAULT["DISABLE_CHATFRAME"] = false
GW_DEFAULT["CHATFRAME_FADE"] = true
GW_DEFAULT["CHATFRAME_EDITBOX_HIDE"] = true
GW_DEFAULT["FADE_MICROMENU"] = false
GW_DEFAULT["AFK_MODE"] = true
GW_DEFAULT["CHAT_MAX_COPY_CHAT_LINES"] = 100

GW_DEFAULT["target_TARGET_ENABLED"] = true
GW_DEFAULT["target_DEBUFFS"] = true
GW_DEFAULT["target_DEBUFFS_FILTER"] = true
GW_DEFAULT["target_BUFFS"] = true
GW_DEFAULT["target_BUFFS_FILTER"] = true
GW_DEFAULT["target_BUFFS_FILTER_ALL"] = false
GW_DEFAULT["target_BUFFS_FILTER_IMPORTANT"] = false
GW_DEFAULT["target_ILVL"] = false
GW_DEFAULT["target_THREAT_VALUE_ENABLED"] = false
GW_DEFAULT["target_HOOK_COMBOPOINTS"] = false
GW_DEFAULT["target_HEALTH_VALUE_ENABLED"] = false
GW_DEFAULT["target_HEALTH_VALUE_TYPE"] = false
GW_DEFAULT["target_CLASS_COLOR"] = true
GW_DEFAULT["target_CASTINGBAR_DATA"] = false
GW_DEFAULT["target_AURAS_ON_TOP"] = false
GW_DEFAULT["target_FLOATING_COMBAT_TEXT"] = true
GW_DEFAULT["target_FRAME_INVERT"] = false

GW_DEFAULT["focus_TARGET_ENABLED"] = true
GW_DEFAULT["focus_DEBUFFS"] = true
GW_DEFAULT["focus_DEBUFFS_FILTER"] = true
GW_DEFAULT["focus_BUFFS"] = true
GW_DEFAULT["focus_BUFFS_FILTER"] = true
GW_DEFAULT["focus_BUFFS_FILTER_ALL"] = false
GW_DEFAULT["focus_BUFFS_FILTER_IMPORTANT"] = false

GW_DEFAULT["focus_HEALTH_VALUE_ENABLED"] = false
GW_DEFAULT["focus_HEALTH_VALUE_TYPE"] = false
GW_DEFAULT["focus_CLASS_COLOR"] = true
GW_DEFAULT["focus_FRAME_INVERT"] = false

GW_DEFAULT["multibarleft_pos"] = {}
GW_DEFAULT["multibarleft_pos"]["point"] = "RIGHT"
GW_DEFAULT["multibarleft_pos"]["relativePoint"] = "RIGHT"
GW_DEFAULT["multibarleft_pos"]["xOfs"] = -300
GW_DEFAULT["multibarleft_pos"]["yOfs"] = 0

GW_DEFAULT["multibarright_pos"] = {}
GW_DEFAULT["multibarright_pos"]["point"] = "RIGHT"
GW_DEFAULT["multibarright_pos"]["relativePoint"] = "RIGHT"
GW_DEFAULT["multibarright_pos"]["xOfs"] = -260
GW_DEFAULT["multibarright_pos"]["yOfs"] = 0

GW_DEFAULT["target_pos"] = {}
GW_DEFAULT["target_pos"]["point"] = "TOP"
GW_DEFAULT["target_pos"]["relativePoint"] = "TOP"
GW_DEFAULT["target_pos"]["xOfs"] = -56
GW_DEFAULT["target_pos"]["yOfs"] = -100
GW_DEFAULT["target_pos_scale"] = 1

GW_DEFAULT["pet_pos"] = {}
GW_DEFAULT["pet_pos"]["point"] = "BOTTOMRIGHT"
GW_DEFAULT["pet_pos"]["relativePoint"] = "BOTTOM"
GW_DEFAULT["pet_pos"]["xOfs"] = -53
GW_DEFAULT["pet_pos"]["yOfs"] = 120
GW_DEFAULT["pet_pos_scale"] = 1

GW_DEFAULT["castingbar_pos"] = {}
GW_DEFAULT["castingbar_pos"]["point"] = "BOTTOM"
GW_DEFAULT["castingbar_pos"]["relativePoint"] = "BOTTOM"
GW_DEFAULT["castingbar_pos"]["xOfs"] = 0
GW_DEFAULT["castingbar_pos"]["yOfs"] = 300
GW_DEFAULT["castingbar_pos_scale"] = 1

GW_DEFAULT["targettarget_pos"] = {}
GW_DEFAULT["targettarget_pos"]["point"] = "TOP"
GW_DEFAULT["targettarget_pos"]["relativePoint"] = "TOP"
GW_DEFAULT["targettarget_pos"]["xOfs"] = 250
GW_DEFAULT["targettarget_pos"]["yOfs"] = -110
GW_DEFAULT["targettarget_pos_scale"] = 1

GW_DEFAULT["focus_pos"] = {}
GW_DEFAULT["focus_pos"]["point"] = "CENTER"
GW_DEFAULT["focus_pos"]["relativePoint"] = "CENTER"
GW_DEFAULT["focus_pos"]["xOfs"] = -350
GW_DEFAULT["focus_pos"]["yOfs"] = 0
GW_DEFAULT["focus_pos_scale"] = 1

GW_DEFAULT["focustarget_pos"] = {}
GW_DEFAULT["focustarget_pos"]["point"] = "CENTER"
GW_DEFAULT["focustarget_pos"]["relativePoint"] = "CENTER"
GW_DEFAULT["focustarget_pos"]["xOfs"] = -80
GW_DEFAULT["focustarget_pos"]["yOfs"] = -10
GW_DEFAULT["focustarget_pos_scale"] = 1

GW_DEFAULT["MultiBarBottomLeft"] = {}
GW_DEFAULT["MultiBarBottomLeft"]["point"] = "BOTTOMLEFT"
GW_DEFAULT["MultiBarBottomLeft"]["relativePoint"] = "BOTTOM"
GW_DEFAULT["MultiBarBottomLeft"]["xOfs"] = -372
GW_DEFAULT["MultiBarBottomLeft"]["yOfs"] = 120
GW_DEFAULT["MultiBarBottomLeft_scale"] = 1

GW_DEFAULT["MultiBarBottomLeft"]["size"] = 38
GW_DEFAULT["MultiBarBottomLeft"]["margin"] = 2
GW_DEFAULT["MultiBarBottomLeft"]["ButtonsPerRow"] = 6
GW_DEFAULT["MultiBarBottomLeft"]["hideDefaultBackground"] = true

GW_DEFAULT["MultiBarBottomRight"] = {}
GW_DEFAULT["MultiBarBottomRight"]["point"] = "BOTTOMRIGHT"
GW_DEFAULT["MultiBarBottomRight"]["relativePoint"] = "BOTTOM"
GW_DEFAULT["MultiBarBottomRight"]["xOfs"] = 372
GW_DEFAULT["MultiBarBottomRight"]["yOfs"] = 120
GW_DEFAULT["MultiBarBottomRight_scale"] = 1

GW_DEFAULT["MultiBarBottomRight"]["size"] = 38
GW_DEFAULT["MultiBarBottomRight"]["margin"] = 2
GW_DEFAULT["MultiBarBottomRight"]["ButtonsPerRow"] = 6
GW_DEFAULT["MultiBarBottomRight"]["hideDefaultBackground"] = true

GW_DEFAULT["MULTIBAR_RIGHT_COLS"] = 1

GW_DEFAULT["PlayerBuffFrame"] = {}
GW_DEFAULT["PlayerBuffFrame"]["point"] = "BOTTOMLEFT"
GW_DEFAULT["PlayerBuffFrame"]["relativePoint"] = "BOTTOM"
GW_DEFAULT["PlayerBuffFrame"]["xOfs"] = 53
GW_DEFAULT["PlayerBuffFrame"]["yOfs"] = 120
GW_DEFAULT["PlayerBuffFrame_GrowDirection"] = "UP"
GW_DEFAULT["PlayerBuffFrame_scale"] = 1

GW_DEFAULT["PlayerDebuffFrame"] = {}
GW_DEFAULT["PlayerDebuffFrame"]["point"] = "BOTTOMLEFT"
GW_DEFAULT["PlayerDebuffFrame"]["relativePoint"] = "BOTTOM"
GW_DEFAULT["PlayerDebuffFrame"]["xOfs"] = 53
GW_DEFAULT["PlayerDebuffFrame"]["yOfs"] = 220
GW_DEFAULT["PlayerDebuffFrame_GrowDirection"] = "UP"
GW_DEFAULT["PlayerDebuffFrame_scale"] = 1

GW_DEFAULT["MultiBarRight"] = {}
GW_DEFAULT["MultiBarRight"]["point"] = "RIGHT"
GW_DEFAULT["MultiBarRight"]["relativePoint"] = "RIGHT"
GW_DEFAULT["MultiBarRight"]["xOfs"] = -320
GW_DEFAULT["MultiBarRight"]["yOfs"] = 0
GW_DEFAULT["MultiBarRight_scale"] = 1

GW_DEFAULT["MultiBarRight"]["size"] = 38
GW_DEFAULT["MultiBarRight"]["margin"] = 2
GW_DEFAULT["MultiBarRight"]["ButtonsPerRow"] = 1
GW_DEFAULT["MultiBarRight"]["hideDefaultBackground"] = true

GW_DEFAULT["MultiBarLeft"] = {}
GW_DEFAULT["MultiBarLeft"]["point"] = "RIGHT"
GW_DEFAULT["MultiBarLeft"]["relativePoint"] = "RIGHT"
GW_DEFAULT["MultiBarLeft"]["xOfs"] = -368
GW_DEFAULT["MultiBarLeft"]["yOfs"] = 0
GW_DEFAULT["MultiBarLeft_scale"] = 1

GW_DEFAULT["MultiBarLeft"]["size"] = 38
GW_DEFAULT["MultiBarLeft"]["margin"] = 2
GW_DEFAULT["MultiBarLeft"]["ButtonsPerRow"] = 1
GW_DEFAULT["MultiBarLeft"]["hideDefaultBackground"] = true

GW_DEFAULT["GameTooltipPos"] = {}
GW_DEFAULT["GameTooltipPos"]["point"] = "BOTTOMRIGHT"
GW_DEFAULT["GameTooltipPos"]["relativePoint"] = "BOTTOMRIGHT"
GW_DEFAULT["GameTooltipPos"]["xOfs"] = 0
GW_DEFAULT["GameTooltipPos"]["yOfs"] = 300

GW_DEFAULT["BNToastPos"] = {}
GW_DEFAULT["BNToastPos"]["point"] = "BOTTOM"
GW_DEFAULT["BNToastPos"]["relativePoint"] = "BOTTOMLEFT"
GW_DEFAULT["BNToastPos"]["xOfs"] = 78
GW_DEFAULT["BNToastPos"]["yOfs"] = 246
GW_DEFAULT["BNToastPos_scale"] = 1

GW_DEFAULT["ExtraActionBarFramePos"] = {}
GW_DEFAULT["ExtraActionBarFramePos"]["point"] = "BOTTOM"
GW_DEFAULT["ExtraActionBarFramePos"]["relativePoint"] = "BOTTOM"
GW_DEFAULT["ExtraActionBarFramePos"]["xOfs"] = -150
GW_DEFAULT["ExtraActionBarFramePos"]["yOfs"] = 300
GW_DEFAULT["ExtraActionBarFramePos_scale"] = 1

GW_DEFAULT["ZoneAbilityFramePos"] = {}
GW_DEFAULT["ZoneAbilityFramePos"]["point"] = "BOTTOM"
GW_DEFAULT["ZoneAbilityFramePos"]["relativePoint"] = "BOTTOM"
GW_DEFAULT["ZoneAbilityFramePos"]["xOfs"] = 150
GW_DEFAULT["ZoneAbilityFramePos"]["yOfs"] = 300
GW_DEFAULT["ZoneAbilityFramePos_scale"] = 1

GW_DEFAULT["TalkingHeadFrame_pos"] = {}
GW_DEFAULT["TalkingHeadFrame_pos"]["point"] = "BOTTOM"
GW_DEFAULT["TalkingHeadFrame_pos"]["relativePoint"] = "BOTTOM"
GW_DEFAULT["TalkingHeadFrame_pos"]["xOfs"] = 0
GW_DEFAULT["TalkingHeadFrame_pos"]["yOfs"] = 372
GW_DEFAULT["TalkingHeadFrame_pos_scale"] = 0.9

GW_DEFAULT["HealthGlobe_pos"] = {}
GW_DEFAULT["HealthGlobe_pos"]["point"] = "BOTTOM"
GW_DEFAULT["HealthGlobe_pos"]["relativePoint"] = "BOTTOM"
GW_DEFAULT["HealthGlobe_pos"]["xOfs"] = 0
GW_DEFAULT["HealthGlobe_pos"]["yOfs"] = 17

GW_DEFAULT["TotemBar_pos"] = {}
GW_DEFAULT["TotemBar_pos"]["point"] = "TOPRIGHT"
GW_DEFAULT["TotemBar_pos"]["relativePoint"] = "TOPRIGHT"
GW_DEFAULT["TotemBar_pos"]["xOfs"] = -500
GW_DEFAULT["TotemBar_pos"]["yOfs"] = -50
GW_DEFAULT["TotemBar_pos_scale"] = 1
GW_DEFAULT["TotemBar_GrowDirection"] = "HORIZONTAL"
GW_DEFAULT["TotemBar_SortDirection"] = "ASC"

GW_DEFAULT["StanceBar_pos"] = {}
GW_DEFAULT["StanceBar_pos"]["point"] = "BOTTOMLEFT"
GW_DEFAULT["StanceBar_pos"]["relativePoint"] = "BOTTOM"
GW_DEFAULT["StanceBar_pos"]["xOfs"] = -405
GW_DEFAULT["StanceBar_pos"]["yOfs"] = 31
GW_DEFAULT["StanceBar_pos_scale"] = 1
GW_DEFAULT["StanceBar_GrowDirection"] = "UP"
GW_DEFAULT["StanceBarContainerState"] = "close"

GW_DEFAULT["PowerBar_pos"] = {}
GW_DEFAULT["PowerBar_pos"]["point"] = "BOTTOMLEFT"
GW_DEFAULT["PowerBar_pos"]["relativePoint"] = "BOTTOM"
GW_DEFAULT["PowerBar_pos"]["xOfs"] = 53
GW_DEFAULT["PowerBar_pos"]["yOfs"] = 86
GW_DEFAULT["PowerBar_pos_scale"] = 1

GW_DEFAULT["ROLE_BAR_pos"] = {}
GW_DEFAULT["ROLE_BAR_pos"]["point"] = "TOPLEFT"
GW_DEFAULT["ROLE_BAR_pos"]["relativePoint"] = "TOPLEFT"
GW_DEFAULT["ROLE_BAR_pos"]["xOfs"] = 500
GW_DEFAULT["ROLE_BAR_pos"]["yOfs"] = 0
GW_DEFAULT["ROLE_BAR_pos_scale"] = 1
GW_DEFAULT["ROLE_BAR"] = "IN_RAID"

GW_DEFAULT["MISSING_RAID_BUFF_pos"] = {}
GW_DEFAULT["MISSING_RAID_BUFF_pos"]["point"] = "TOPLEFT"
GW_DEFAULT["MISSING_RAID_BUFF_pos"]["relativePoint"] = "TOPLEFT"
GW_DEFAULT["MISSING_RAID_BUFF_pos"]["xOfs"] = 2
GW_DEFAULT["MISSING_RAID_BUFF_pos"]["yOfs"] = -30
GW_DEFAULT["MISSING_RAID_BUFF_pos_scale"] = 1
GW_DEFAULT["MISSING_RAID_BUFF"] = "IN_RAID"
GW_DEFAULT["MISSING_RAID_BUFF_INVERT"] = false
GW_DEFAULT["MISSING_RAID_BUFF_animated"] = true
GW_DEFAULT["MISSING_RAID_BUFF_dimmed"] = true
GW_DEFAULT["MISSING_RAID_BUFF_grayed_out"] = true
GW_DEFAULT["MISSING_RAID_BUFF_custom_id"] = ""

GW_DEFAULT["CHAT_FIND_URL"] = true
GW_DEFAULT["CHAT_HYPERLINK_TOOLTIP"] = true
GW_DEFAULT["CHAT_SHORT_CHANNEL_NAMES"] = false
GW_DEFAULT["CHAT_SHOW_LFG_ICONS"] = true
GW_DEFAULT["CHAT_SPAM_INTERVAL_TIMER"] = 5
GW_DEFAULT["CHAT_INCOMBAT_TEXT_REPEAT"] = 5
GW_DEFAULT["CHAT_CLASS_COLOR_MENTIONS"] = true
GW_DEFAULT["CHAT_KEYWORDS"] = "%MYNAME%"
GW_DEFAULT["CHAT_KEYWORDS_ALERT_NEW"] = "GW2_UI: Ping"
GW_DEFAULT["CHAT_KEYWORDS_ALERT_COLOR"] = {r = .5, g = .5, b = .5}
GW_DEFAULT["CHAT_KEYWORDS_EMOJI"] = true
GW_DEFAULT["CHAT_SOCIAL_LINK"] = true
GW_DEFAULT["CHAT_ADD_TIMESTAMP_TO_ALL"] = true

GW_DEFAULT["ClasspowerBar_pos"] = {}
GW_DEFAULT["ClasspowerBar_pos"]["point"] = "BOTTOMLEFT"
GW_DEFAULT["ClasspowerBar_pos"]["relativePoint"] = "BOTTOM"
GW_DEFAULT["ClasspowerBar_pos"]["xOfs"] = -372
GW_DEFAULT["ClasspowerBar_pos"]["yOfs"] = 81
GW_DEFAULT["ClasspowerBar_pos_scale"] = 1

GW_DEFAULT["AltPowerBar_pos"] = {}
GW_DEFAULT["AltPowerBar_pos"]["point"] = "TOP"
GW_DEFAULT["AltPowerBar_pos"]["relativePoint"] = "TOP"
GW_DEFAULT["AltPowerBar_pos"]["xOfs"] = 0
GW_DEFAULT["AltPowerBar_pos"]["yOfs"] = -30
GW_DEFAULT["AltPowerBar_pos_scale"] = 1

GW_DEFAULT["TopCenterWidget_pos"] = {}
GW_DEFAULT["TopCenterWidget_pos"]["point"] = "TOP"
GW_DEFAULT["TopCenterWidget_pos"]["relativePoint"] = "TOP"
GW_DEFAULT["TopCenterWidget_pos"]["xOfs"] = 0
GW_DEFAULT["TopCenterWidget_pos"]["yOfs"] = -30
GW_DEFAULT["TopCenterWidget_pos_scale"] = 1

GW_DEFAULT["AlertPos"] = {}
GW_DEFAULT["AlertPos"]["point"] = "BOTTOMRIGHT"
GW_DEFAULT["AlertPos"]["relativePoint"] = "BOTTOMRIGHT"
GW_DEFAULT["AlertPos"]["xOfs"] = 0
GW_DEFAULT["AlertPos"]["yOfs"] = 300
GW_DEFAULT["AlertPos_scale"] = 1

GW_DEFAULT["MinimapPos"] = {}
GW_DEFAULT["MinimapPos"]["point"] = "BOTTOMRIGHT"
GW_DEFAULT["MinimapPos"]["relativePoint"] = "BOTTOMRIGHT"
GW_DEFAULT["MinimapPos"]["xOfs"] = -5
GW_DEFAULT["MinimapPos"]["yOfs"] = 21
GW_DEFAULT["MinimapPos_scale"] = 1

GW_DEFAULT["MicromenuPos"] = {}
GW_DEFAULT["MicromenuPos"]["point"] = "TOPLEFT"
GW_DEFAULT["MicromenuPos"]["relativePoint"] = "TOPLEFT"
GW_DEFAULT["MicromenuPos"]["xOfs"] = 0
GW_DEFAULT["MicromenuPos"]["yOfs"] = 1

GW_DEFAULT["QuestTracker_pos"] = {}
GW_DEFAULT["QuestTracker_pos"]["point"] = "TOPRIGHT"
GW_DEFAULT["QuestTracker_pos"]["relativePoint"] = "TOPRIGHT"
GW_DEFAULT["QuestTracker_pos"]["xOfs"] = 0
GW_DEFAULT["QuestTracker_pos"]["yOfs"] = 0
GW_DEFAULT["QuestTracker_pos_height"] = 700
GW_DEFAULT["QuestTracker_pos_scale"] = 1

GW_DEFAULT["raid_pos"] = {}
GW_DEFAULT["raid_pos"]["point"] = "TOPLEFT"
GW_DEFAULT["raid_pos"]["relativePoint"] = "TOPLEFT"
GW_DEFAULT["raid_pos"]["xOfs"] = 65
GW_DEFAULT["raid_pos"]["yOfs"] = -60

GW_DEFAULT["RAID_CLASS_COLOR"] = false
GW_DEFAULT["RAID_UNIT_FLAGS"] = "NONE"
GW_DEFAULT["RAID_UNIT_MARKERS"] = false
GW_DEFAULT["RAID_WIDTH"] = 55
GW_DEFAULT["RAID_HEIGHT"] = 47
GW_DEFAULT["RAID_POWER_BARS"] = false
GW_DEFAULT["RAID_UNITS_PER_COLUMN"] = 5
GW_DEFAULT["RAID_GROW"] = "DOWN+RIGHT"
GW_DEFAULT["RAID_ANCHOR"] = "POSITION"
GW_DEFAULT["RAID_CONT_WIDTH"] = 0
GW_DEFAULT["RAID_CONT_HEIGHT"] = 0
GW_DEFAULT["RAID_SHOW_DEBUFFS"] = true
GW_DEFAULT["RAID_ONLY_DISPELL_DEBUFFS"] = false
GW_DEFAULT["RAID_SHOW_IMPORTEND_RAID_INSTANCE_DEBUFF"] = false
GW_DEFAULT["RAID_SORT_BY_ROLE"] = true
GW_DEFAULT["RAID_AURA_TOOLTIP_INCOMBAT"] = "IN_COMBAT"
GW_DEFAULT["RAID_UNIT_HEALTH"] = "NONE"

GW_DEFAULT["raid_party_pos"] = {}
GW_DEFAULT["raid_party_pos"]["point"] = "TOPLEFT"
GW_DEFAULT["raid_party_pos"]["relativePoint"] = "TOPLEFT"
GW_DEFAULT["raid_party_pos"]["xOfs"] = 480
GW_DEFAULT["raid_party_pos"]["yOfs"] = -760

GW_DEFAULT["RAID_CLASS_COLOR_PARTY"] = true
GW_DEFAULT["RAID_UNIT_FLAGS_PARTY"] = "NONE"
GW_DEFAULT["RAID_UNIT_MARKERS_PARTY"] = false
GW_DEFAULT["RAID_WIDTH_PARTY"] = 500
GW_DEFAULT["RAID_HEIGHT_PARTY"] = 80
GW_DEFAULT["RAID_POWER_BARS_PARTY"] = true
GW_DEFAULT["RAID_UNITS_PER_COLUMN_PARTY"] = 1
GW_DEFAULT["RAID_GROW_PARTY"] = "DOWN+RIGHT"
GW_DEFAULT["RAID_ANCHOR_PARTY"] = "TOPLEFT"
GW_DEFAULT["RAID_CONT_WIDTH_PARTY"] = 500
GW_DEFAULT["RAID_CONT_HEIGHT_PARTY"] = 80
GW_DEFAULT["RAID_SHOW_DEBUFFS_PARTY"] = true
GW_DEFAULT["RAID_ONLY_DISPELL_DEBUFFS_PARTY"] = false
GW_DEFAULT["RAID_SHOW_IMPORTEND_RAID_INSTANCE_DEBUFF_PARTY"] = true
GW_DEFAULT["RAID_SORT_BY_ROLE_PARTY"] = false
GW_DEFAULT["RAID_AURA_TOOLTIP_INCOMBAT_PARTY"] = "IN_COMBAT"
GW_DEFAULT["RAID_UNIT_HEALTH_PARTY"] = "NONE"

GW_DEFAULT["RAID_STYLE_PARTY"] = false
GW_DEFAULT["RAID_STYLE_PARTY_AND_FRAMES"] = false
GW_DEFAULT["PARTY_UNIT_HEALTH"] = "NONE"
GW_DEFAULT["PARTY_SHOW_DEBUFFS"] = true
GW_DEFAULT["PARTY_ONLY_DISPELL_DEBUFFS"] = false
GW_DEFAULT["PARTY_SHOW_IMPORTEND_RAID_INSTANCE_DEBUFF"] = false
GW_DEFAULT["PARTY_PLAYER_FRAME"] = false
GW_DEFAULT["PARTY_SHOW_PETS"] = false
GW_DEFAULT["FADE_GROUP_MANAGE_FRAME"] = false

GW_DEFAULT["RAIDDEBUFFS_Scale"] = 1
GW_DEFAULT["DISPELL_DEBUFFS_Scale"] = 1

GW_DEFAULT["AUTO_REPAIR"] = "NONE"
GW_DEFAULT["HUD_SCALE"] = 1
GW_DEFAULT["MINIMAP_SCALE"] = 170
GW_DEFAULT["MINIMAP_FPS"] = false
GW_DEFAULT["MINIMAP_COORDS_TOGGLE"] = false
GW_DEFAULT["MINIMAP_COORDS_PRECISION"] = 0
GW_DEFAULT["WORLDMAP_COORDS_TOGGLE"] = false

GW_DEFAULT["CASTINGBAR_DATA"] = false
GW_DEFAULT["USE_CHARACTER_WINDOW"] = true
GW_DEFAULT["USE_TALENT_WINDOW"] = true

GW_DEFAULT["USE_SOCIAL_WINDOW"] = true

GW_DEFAULT["AURAS_IGNORED"] = strjoin(", ", unpack(GW.MapTable(GW.AURAS_IGNORED, GetSpellInfo)))
GW_DEFAULT["AURAS_MISSING"] = strjoin(", ", unpack(GW.MapTable(GW.AURAS_MISSING, GetSpellInfo)))
GW_DEFAULT["INDICATORS_ICON"] = false
GW_DEFAULT["INDICATORS_TIME"] = true
GW_DEFAULT["INDICATOR_BAR"] = {
    [0] = 0,
    [256] = 194384  -- Discipline: Atonement
}
GW_DEFAULT["INDICATOR_TOPLEFT"] = 0
GW_DEFAULT["INDICATOR_TOP"] = 0
GW_DEFAULT["INDICATOR_TOPRIGHT"] = 0
GW_DEFAULT["INDICATOR_LEFT"] = 0
GW_DEFAULT["INDICATOR_CENTER"] = 0
GW_DEFAULT["INDICATOR_RIGHT"] = 0

GW_DEFAULT["MAINMENU_SKIN_ENABLED"] = true
GW_DEFAULT["STATICPOPUP_SKIN_ENABLED"] = true
GW_DEFAULT["BNTOASTFRAME_SKIN_ENABLED"] = true
GW_DEFAULT["GHOSTFRAME_SKIN_ENABLED"] = true
GW_DEFAULT["DEATHRECAPFRAME_SKIN_ENABLED"] = true
GW_DEFAULT["DROPDOWN_SKIN_ENABLED"] = true
GW_DEFAULT["LFG_FRAMES_SKIN_ENABLED"] = true
GW_DEFAULT["READYCHECK_SKIN_ENABLED"] = true
GW_DEFAULT["TALKINGHEAD_SKIN_ENABLED"] = true
GW_DEFAULT["MISC_SKIN_ENABLED"] = true
GW_DEFAULT["IMMERSIONADDON_SKIN_ENABLED"] = true
GW_DEFAULT["FLIGHTMAP_SKIN_ENABLED"] = true
GW_DEFAULT["BLIZZARDCLASSCOLOR_ENABLED"] = false
GW_DEFAULT["ADDONLIST_SKIN_ENABLED"] = true
GW_DEFAULT["BINDINGS_SKIN_ENABLED"] = true
GW_DEFAULT["BLIZZARD_OPTIONS_SKIN_ENABLED"] = true
GW_DEFAULT["MACRO_SKIN_ENABLED"] = true
GW_DEFAULT["MAIL_SKIN_ENABLED"] = true
GW_DEFAULT["BARBERSHOP_SKIN_ENABLED"] = true
GW_DEFAULT["INSPECTION_SKIN_ENABLED"] = true
GW_DEFAULT["DRESSUP_SKIN_ENABLED"] = true
GW_DEFAULT["HELPFRAME_SKIN_ENABLED"] = true
GW_DEFAULT["SKIN_WQT_ENABLED"] = true
GW_DEFAULT["SOCKET_SKIN_ENABLED"] = true
GW_DEFAULT["WORLDMAP_SKIN_ENABLED"] = true
GW_DEFAULT["GOSSIP_SKIN_ENABLED"] = true
GW_DEFAULT["ITEMUPGRADE_SKIN_ENABLED"] = true
GW_DEFAULT["TIMEMANAGER_SKIN_ENABLED"] = true
GW_DEFAULT["MERCHANT_SKIN_ENABLED"] = true
GW_DEFAULT["ENCOUNTER_JOURNAL_SKIN_ENABLED"] = true
GW_DEFAULT["CONCENANT_SANCTUM_SKIN_ENABLED"] = true
GW_DEFAULT["SOULBINDS_SKIN_ENABLED"] = true

GW_DEFAULT["USE_BATTLEGROUND_HUD"] = true

GW_DEFAULT["CURSOR_ANCHOR_TYPE"] = "ANCHOR_CURSOR"
GW_DEFAULT["ANCHOR_CURSOR_OFFSET_X"] = 0
GW_DEFAULT["ANCHOR_CURSOR_OFFSET_Y"] = 0

GW_DEFAULT["MAINBAR_RANGEINDICATOR"] = "RED_INDICATOR"

GW_DEFAULT["ACTIVE_PROFILE"] = nil

GW_DEFAULT["PLAYER_AURA_STYLE"] = "LEGACY"
GW_DEFAULT["PLAYER_AURA_WRAP_NUM"] = 7
GW_DEFAULT["PlayerBuffFrame_ICON_SIZE"] = 32
GW_DEFAULT["PlayerDebuffFrame_ICON_SIZE"] = 32
GW_DEFAULT["PLAYER_TRACKED_DODGEBAR_SPELL"] = ""
GW_DEFAULT["PLAYER_TRACKED_DODGEBAR_SPELL_ID"] = 0
GW_DEFAULT["PLAYER_AS_TARGET_FRAME"] = false
GW_DEFAULT["PLAYER_AS_TARGET_FRAME_SHOW_RESSOURCEBAR"] = false
GW_DEFAULT["player_CLASS_COLOR"] = false
GW_DEFAULT["PLAYER_SHOW_PVP_INDICATOR"] = true

GW_DEFAULT["player_pos"] = {}
GW_DEFAULT["player_pos"]["point"] = "CENTER"
GW_DEFAULT["player_pos"]["relativePoint"] = "CENTER"
GW_DEFAULT["player_pos"]["xOfs"] = -56
GW_DEFAULT["player_pos"]["yOfs"] = -100
GW_DEFAULT["player_pos_scale"] = 1

-- incompatible addons
GW_DEFAULT.IncompatibleAddons = {
    Actionbars = {
        Override = false,
        Addons = {
            "Bartender4",
            "Dominos",
        },
    },
    ImmersiveQuesting = {
        Override = false,
        Addons = {
            "Storyline",
            "Immersive",
            "Immersion",
            "Tofu",
            "Queso",
        },
    },
    DynamicCam = {
        Override = false,
        Addons = {
            "DynamicCam",
            "Queso",
        },
    },
    Inventory = {
        Override = false,
        Addons = {
            "AdiBags",
            "ArkInventory",
            "Bagnon",
            "Sorted",
        },
    },
    Minimap = {
        Override = false,
        Addons = {
            "SexyMap",
        },
    },
    FloatingCombatText = {
        Override = false,
        Addons = {
            "ClassicFCT",
            "xCT+",
            "NameplateSCT",
        },
    },
    Objectives = {
        Override = false,
        Addons = {
            "!KalielsTracker",
        },
    },
}
