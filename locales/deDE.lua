-- deDE localization
local L = LibStub("AceLocale-3.0"):NewLocale("GW2_UI", "deDE")
if not L then return end

--Fonts
L["FONT_NORMAL"] = "Interface/AddOns/GW2_UI/fonts/menomonia.ttf"
L["FONT_BOLD"] = "Interface/AddOns/GW2_UI/fonts/headlines.ttf"
L["FONT_NARROW"] = "Interface/AddOns/GW2_UI/fonts/menomonia.ttf"
L["FONT_NARROW_BOLD"] = "Interface/AddOns/GW2_UI/fonts/menomonia.ttf"
L["FONT_LIGHT"] = "Interface/AddOns/GW2_UI/fonts/menomonia-italic.ttf"
L["FONT_DAMAGE"] = "Interface/AddOns/GW2_UI/fonts/headlines.ttf"

--Strings
L["Use the GW2 UI improved action bars."] = "Benutze die verbesserten GW2 UI Aktionsleisten."
L["Fade Action Bars"] = "Aktionsleisten ausblenden"
L["Advanced Tooltips"] = "Erweiterte Tooltips"
L["Displays additional information in the tooltip (further information is displayed when the SHIFT key is pressed)"] = "Zeigt zusätzliche Informationen im Tooltip an (weitere werden bei gedrückter SHIFT-Taste angezeigt)"
L["Item Count"] = "Gegenstandsanzahl"
L["Display how many of a certain item you have in your possession."] = "Zeige wie viele sich von dem ausgewählten Gegenstand in deinem Besitz befinden."
L["Gender"] = "Geschlecht"
L["Displays the player character's gender."] = "Zeigt das Geschlecht eines Spielers an."
L["Display guild ranks if a unit is a member of a guild."] = "Zeige Gildenränge von Spielern die in einer Gilde sind."
L["Current Mount"] = "Aktuelles Mount"
L["Display current mount the unit is riding."] = "Zeigt das aktuelle Mount der Einheit an."
L["Display player titles."] ="Zeige Spielertitel."
L["Always Show Realm"] = "Server immer anzeigen"
L["Display the unit role in the tooltip."] = "Zeigt die Rolle des Spielers im Tooltip an."
L["Target Info"] = "Ziel Infos"
L["When in a raid group, show if anyone in your raid is targeting the current tooltip unit."] = "Zeige ob jemand aus deiner Gruppe/Schlachtzug die Tooltip-Einheit ins Ziel genommen hat."
L["Advanced Casting Bar"] = "Erweiterte Zauberbar"
L["Enable or disable the advanced casting bar."] = "Aktiviere oder deaktiviere die erweiterte Zauberbar."
L["AFK Mode"] = "AFK Modus"
L["When you go AFK, display the AFK screen."] = "AFK Bildschirm anzeigen wenn du AFK bist."
L["Alert Frames"] = "Alarmfenster"
L["Cursor Anchor Left"] = "Mausanker links"
L["Only takes effect if the option 'Cursor Tooltips' is activated and the cursor anchor is NOT 'Cursor Anchor'"] = "Wird nur angewendet, wenn die Option 'Tooltip an der Maus' aktiviert und der Mausanker Typ NICHT 'Mausanker' ist"
L["Cursor Anchor Offset X"] = "Zeigeranker X-Versatz"
L["Cursor Anchor Offset Y"] = "Zeigeranker Y-Versatz"
L["Cursor Anchor Right"] = "Mausanker rechts"
L["Apply to all"] = "Auf alle anwenden"
L["Applies the UI scale to all frames which can be scaled in 'Move HUD' mode."] = "Überträgt die UI Skalierung auf alle Fenster, welche im 'Move HUD' skaliert werden können"
L["Ascending"] = "Aufsteigend"
L["Auras per row"] = "Auren pro Reihe"
L["Aura Style"] = "Aura Style"
L["Auto Repair"] = "Auto-Reparatur"
L["Automatically repair using the following method when visiting a merchant."] = "Repariert automatisch deine Ausrüstungsgegenstände, wenn du eine der folgenden Methoden auswählst."
L["Reverse Bag Order"] = "Umgekehrte Sortierung"
L["Sort to Last Bag"] = "In die letzte Tasche sortieren"
L["Compact Icons"] = "Kompakte Icons"
L["Action Button Labels"] = "Aktionsbuttonzuweisungen"
L["Enable or disable the action button assignment text"] = "Aktiviere oder deaktiviere die Aktionsbuttonzuweisungen"
L["Enable the GW2 style casting bar."] = "Aktiviere die Zauberleiste im GW2 Style."
L["Changelog"] = "Changelog"
L["Paragon"] = "Huldigend"
L["Replace the default UI chat bubbles. (Only in not protected areas)"] = "Ersetze die standard Sprechblasen. (Nur in nicht sicheren Bereichen)"
L["Fade Chat"] = "Chat verblassen"
L["Allow the chat to fade when not in use."] = "Erlaube den Chat zu verblassen, wenn dieser nicht genutzt wird."
L["Enable the improved chat window."] = "Aktiviere das erweiterte Chatfenster."
L["Replace the default character window."] = "Ersetzt das standard Charakterfenster."
L["Display the class color as the health bar."] = "Aktiviert die Klassenfarbe als Gesundheitsanzeige"
L["Use the class color instead of class icons."] = "Benutze die Klassenfarben, anstelle von Klassensymbolen."
L["Class Power"] = "Klassenpower"
L["Enable the alternate class powers."] = "Aktiviere die alternativen Klassenpowerbars."
L["Class Totems"] = "Klassen Totems"
L["Toggle Compass"] = "Kompass einschalten"
L["Enable or disable the quest tracker compass."] = "Aktiviere oder deaktiviere den Quest Tracker Kompass."
L["Copy of"] = "Kopie von"
L["Cursor Anchor"] = "Mausanker"
L["Cursor Anchor Type"] = "Mausanker Typ"
L["Only takes effect if the option 'Cursor Tooltips' is activated"] = "Wird nur angewendet, wenn die Option 'Tooltip an der Maus' aktiviert ist"
L["Only displays the debuffs that you are able to dispell."] = "Zeige nur Schächungszauber an, die du entfernen kannst."
L["Decode"] = "Decodieren"
L["Descending"] = "Absteigend"
L["MoveAnything bag handling disabled."] = "MoveAnything's Taschen Handling ausgeschaltet."
L["Join Discord"] = "Discord beitreten"
L["Display Portrait Damage"] = "Zeige Schaden im Portrait"
L["Display Portrait Damage on this frame"] = "Zeige in diesem Fenster den Schaden im Portrait"
L["Down"] = "Runter"
L["Down and right"] = "Runter und rechts"
L["Dynamic HUD"] = "Dynamisches HUD"
L["Enable or disable the dynamically changing HUD background."] = "Aktiviere oder deaktivieren das dynamische Ändern des HUD Hintergrundes."
L["Export"] = "Exportieren"
L["Export Profile"] = "Profilexport"
L["Profile string to share your settings:"] = "Zeichenfolge um deine Einstellungen zu teilen:"
L["Rested "] = "Ausgeruht "
L[" (Resting)"] = " (Erholen)"
L["Boss Button"] = "Boss Button"
L["Fade Group Manage Button"] = "Gruppenmanage-Button ausblenden"
L["The Group Manage Button will fade when you move the cursor away."] = "Blendet den Gruppenmanage-Button aus, wenn die Maus nicht in der Nähe ist."
L["Fade Menu Bar"] = "Micro Menü ausblenden"
L["The main menu icons will fade when you move your cursor away."] = "Blendet das Micro Menü aus, wenn die Maus nicht in der Nähe ist."
L["Modify the focus frame settings."] = "Modifiziere die Einstellungen der Fokuseinheit."
L["Enable the focus target frame replacement."] = "Aktiviert das Fokus Ziel."
L["Display the focus target frame."] = "Zeige das Ziel des Fokusziels an."
L["Fonts"] = "Schriftart"
L["Replace the default fonts withGw2 UI fonts."] = "Ersetze die standard Schriftart durch die GW 2 Schriftart."
L["Hide grid"] = "Raster ausblenden"
L["Show grid"] = "Raster anzeigen"
L["Grid Size:"] = "Rastergröße:"
L["Edit the party and raid options to suit your needs."] = "Bearbeite die Einstellungen der Gruppen und des Schlachtzugs zu deinen Bedürfnissen."
L["Group Frames"] = "Gruppenrahmen"
L["Replace the default UI group frames."] = "Ersetze die Standard Gruppenfenster"
L["Edit the group settings."] = "Bearbeite die Gruppeneinstellungen."
L[": Use Blizzard colors"] = ": Blizzard Farben verwenden"
L[": Show numbers with commas"] = ": Zahlen mir Komma anzeigen"
L["Health Globe"] = "Gesundheitskugel"
L["Enable the health bar replacement."] = "Aktiviere die Gesundheitskugel."
L["Display health as a percentage. Can be used as well as, or instead of Health Value."] = "Zeigt die Gesundheit in Prozent an. Kann auch in Verbindung oder anstelle der Gesundheit als Wert angezeigt werden."
L["Show health as a numerical value."] = "Zeigt die Gesundheit als Wert an."
L["Hide Empty Slots"] = "Leere Plätze ausblenden"
L["Hide the empty action bar slots."] = "Verstecke die leeren Aktionsleitenplätze."
L["Settings are not available in combat!"] = "Einstellungen sind im Kampf nicht verfügbar!"
L["Horizontal"] = "Horizontal"
L["Show HUD background"] = "HUD Hintergrund anzeigen"
L["The HUD background changes color in the following situations: In Combat, Not In Combat, In Water, Low HP, Ghost"] = "Der HUD Hintergrund ändert seine Farbe in folgenden Situationen: Im Kampf, Nicht im Kampf, Im Wasser, Wenig HP, Geist"
L["Edit the modules in the Heads-Up Display for more customization."] = "Bearbeite die Module im HUD für mehr Individualisierung."
L["You can not move elements during combat!"] = "Du kannst keine Elemente während des Kampfes verschieben!"
L["HUD Scale"] = "HUD Skalierung"
L["Change the HUD size."] = "Ändere die Größe des HUDs."
L["Edit the HUD modules."] = "Bearbeite die HUD Module."
L["Import"] = "Importieren"
L["Import string successfully decoded!"] = "Zeichenfolge erfolgreich decodiert!"
L["Error decoding profile: Invalid or corrupt string!"] = "Fehler beim decodieren: Ungültige oder beschädigte Zeichenfolge!"
L["Error importing profile: Invalid or corrupt string!"] = "Fehler beim importieren: Ungültige oder beschädigte Zeichenfolge!"
L["Import Profile"] = "Profil importieren"
L["Paste your profile string here to import the profile."] = "Füge einen Profiltext ein um dieses Profil zu importieren:"
L["Import string successfully imported!"] = "Profil erfolgreich importiert!"
L["Raid Indicators"] = "Raid Indikatoren"
L["Edit raid aura indicators."] = "Bearbeite Aura Indikatoren in Raids."
L["Show Spell Icons"] = "Zeige Zauber Symbole"
L["Show spell icons instead of monochrome squares."] = "Zeige Zauber Symbole anstatt einfarbige Quadrate."
L["Show Remaining Time"] = "Zeige verbleibende Zeit"
L["Show the remaining aura time as an animated overlay."] = "Zeige die verbleibende Zeit von Auren als Overlay."
L["Edit %s raid aura indicator."] = "Bearbeite den Raid Aura Indikator %s."
L["%s Indicator"] = "Indikator %s"
L["Setup Chat"] = "Chateinstellungen"
L["This part sets up your chat window names, positions, and colors."] = "Dieser Abschnitt der Installation richtet die Chat Fenster Namen, Positionen und Farben ein."
L["Setup CVars"] = "Installiere CVars"
L["This part sets up your World of Warcraft default options."] = "Dieser Abschnitt der Installation richtet alle wichtigen CVar's deines World of Warcrafts ein."
L["This short installation process will help you to set up all of the necessary settings used by GW2 UI."] = "Dieser kurze Installationsprozess wird dir helfen, alle wichtigen Einstellung, welche GW2-UI benötigt, einzustellen."
L["GW2 UI installation"] = "GW2-UI Installationsprozess"
L["Complete"] = "Abgeschlossen"
L["You have now finished installing GW2 UI!"] = "Du hast den Installationsprozess abgeschlossen."
L["Installation Complete"] = "Installation abgeschlossen"
L["Start installation"] = "Starte Installationsprozess"
L["Installation"] = "Installationsprozess"
L["Enable the unified inventory interface."] = "Aktiviere das einheitliche Iventar."
L["Left"] = "Links"
L["Upcoming Level Rewards"] = "Belohnung für die nächsten Level"
L["Main Bar Range Indicator"] = "Hauptaktionsleisten Reichweitenanzeige"
L["Map Coordinates"] = "Kartenkoordinaten"
L["Left Click to toggle higher precision coordinates."] = "Klicken Sie mit der linken Maustaste, um die Koordinaten mit höherer Genauigkeit anzuzeigen."
L["Micro Bar"] = "Mikroleiste"
L["Coordinates"] = "Koordinaten"
L["Show Coordinates on Minimap"] = "Zeige Koordinaten auf der Minimap"
L["Use the GW2 UI Minimap frame."] = "Benutze den GW2 UI Minimaprahmen."
L["Show FPS on minimap"] = "FPS an der Minimap anzeigen"
L["Minimap details"] = "Minimap Details"
L["Always show Minimap details."] = "Zeige Minimap Informationen dauerhaft."
L["Minimap Scale"] = "Minimap Skalierung"
L["Change the Minimap size."] = "Ändere die Größe der Minimap."
L["Modules"] = "Module"
L["Enable and disable components"]= "Aktiviere oder deaktiviere Komponenten"
L["Enable or disable the modules you need and don't need."] = "Aktiviere oder deaktiviere die Module die du brauchst oder nicht brauchst."
L["Only on Mouse Over"] = "Nur Maus über"
L["Cursor Tooltips"] = "Tooltip an der Maus"
L["Anchor the tooltips to the cursor."] = "Tooltips am Mauszeiger anzeigen"
L["Move HUD"] = "HUD bewegen"
L["No Guild"] = "Keine Gilde"
L["Use the GW2 UI improved Pet bar."] = "Benutze das verbesserten GW2 UI Begleiterfenster."
L["Pixel Perfect Mode"] = "Pixel Perfection-Modus"
L["Scales the UI into a Pixel Perfect Mode. This is dependent on screen resolution."] = "Skaliert das UI in einen Pixel Perfection-Modus. Dieser ist abhängig von der Bildschirmauflösung."
L["Turn Pixel Perfect Mode On"] = "Pixel Perfection-Modus einschalten"
L["Show Shield Value"] = "Schildwert anzeigen"
L["Move and resize the player auras."] = "Bewege und verändere die Größe der Spieler Auren."
L["Player Buff Growth Direction"] = "Bestimmt die Wachstumsrichtung der Spieler Buffs"
L["Buff size"] = "Stärkungszaubergröße"
L["Player Debuffs Growth Direction"] = "Bestimmt die Wachstumsrichtung der Spieler Debuffs"
L["Debuff size"] = "Schwächungszaubergröße"
L["Modify the player frame settings."] = "Modifiziere die Einstellungen der Spielereinheit."
L["Dodge Bar Ability"] = "Ausweichenleiste-Zauber"
L["Enter the spell ID which should be tracked by the dodge bar.\nIf no ID is entered, the default abilities based on your specialization and talents are tracked."] = "Trage die Zauber ID des Zaubers ein, der über der Gesundheitskugel angezeit wird.\nIst keiner eingetragen, werden die Standardzauber angezeigt, abhängig von Talenten & Spezialisierung."
L["Player frame in group"] = "Spieler in Gruppe anzeigen"
L["Show your player frame as part of the group"] = "Spieler als Gruppenrahmen anzeigen"
L["Display the power bars on the raid units."] = "Zeige die Ressourcenbalken in den Schlachtzugseinheiten."
L["Show Profession Bag Coloring"] = "Berufstaschen färben"
L["PROFILES"] = "PROFILE"
L["Profiles"] = "Profile"
L["Created: "] = "Erstellt: "
L["\nCreated by: "] = "\nErstellt von: "
L["Default Settings"] = "Standardeinstellungen"
L["Load the default addon settings to the current profile."] = "Lade die standard Addon Einstellungen in das aktuelle Profil."
L["Are you sure you want to load the default settings?\n\nAll previous settings will be lost."] = "Bist du sicher, dass du die Standardeinstellungen wiederhertellen möchtest?\n\nAlle vorherigen Einstellungen gehen dabei verloren."
L["Are you sure you want to delete this profile?"] = "Bist du sicher, dass du dieses Profil löschen möchtest?"
L["Profiles are an easy way to share your settings across characters and realms."] = "Profile sind ein einfacher Weg Einstellungen zwischen Charakteren und Servern zu teilen."
L["\nLast updated: "] = "\nzuletzt aktualisiert: "
L["Load"] = "Laden"
L["Text has not loaded."] = "Wenn du diese Text siehst, haben wir vergessen einen Text zu laden."
L["Add and remove profiles."] = "Erstelle und lösche Profile."
L["Immersive Questing"] = "Immersiv Questing"
L["Enable the immersive questing view."] = "Aktiviere die Immersiv Questing Ansicht."
L["Required Items:"] = "Erforderliches Item:"
L["Enable the revamped and improved quest tracker."] = "Aktiviere den erneuerten und verbesserten Quest Tracker."
L["Skip"] = "Überspringen"
L["Set Raid Anchor"] = "Setze die Schlachtzug-Verankerung"
L["By growth direction"] = "Nach Wachstumsrichtung"
L["By position on screen"] = "Nach Position auf dem Bildschirm"
L["Set where the raid frame container should be anchored.\n\nBy position: Always the same as the container's position on screen.\nBy growth: Always opposite to the growth direction."] = "Bestimme wo der Schlachtzugcontainer verankert sein soll.\n\nNach Position: Immer so wie seine Position auf dem Bildschirm.\nNach Wachstum: Immer entgegen seiner der Wachstumsrichtung."
L["Raid Auras"] = "Schlachtzug Auren"
L["Edit which buffs and debuffs are shown."] = "Bearbeite welche Buffs und Debuffs angezeigt werden."
L["Ignored Auras"] = "Ignorierte Auren"
L["A list of auras that should never be shown."] = "Eine Liste von Aura-Namen, die nicht angezeigt werden sollen."
L["Missing Buffs"] = "Fehlende Buffs"
L["A list of buffs that should only be shown when they are missing."] = "Eine Liste von Aura-namen, die nur angezeit werden sollen wenn sie fehlen."
L["Show or hide auras and edit raid aura indicators."] = "Zeige oder verstecke Auren und bearbeite Raid Indikatoren."
L["Show Aura Tooltips"] = "Zeige Aura-Tooltips"
L["Show tooltips of buffs and debuffs."] = "Zeige Tooltips von Buffs und Debuffs."
L["Set Raid Unit Height"] = "Höhe der Schlachtzugseinheiten"
L["Set the height of the raid units."] = "Setze die Höhe der Schlachtzugseinheiten."
L["Set Raid Unit Width"] = "Breite der Schlachtzugseinheiten"
L["Set the width of the raid units."] = "Setze die Breite der Schlachtzugseinheiten."
L["Set Raid Frame Container Height"] = "Höhe des Schlachtzugcontainers"
L["Set the maximum height that the raid frames can be displayed.\n\nThis will cause unit frames to shrink or move to the next column."] = "Setze die maximale Höhe des Schlachtzugcontainers.\n\nSchlachtzugeinheiten werden verkleinert oder in die nächste Spalte verschoben."
L["Set Raid Frame Container Width"] = "Breite des Schlachtzugcontainers"
L["Set the maximum width that the raid frames can be displayed.\n\nThis will cause unit frames to shrink or move to the next row."] = "Setze die maximale Breite des Schlachtzugcontainers.\n\nSchlachtzugeinheiten werden verkleinert oder in die nächste Zeile verschoben."
L["Set Raid Growth Direction"] = "Bestimme die Wachstumsrichtung"
L["Set the grow direction for raid frames."] = "Bestimme die Wachstumsrichtung der Schlachtzugsfenster."
L["%s and then %s"] = "%s und dann %s"
L["Displays the Target Markers on the Raid Unit Frames"] = "Die Zielmarkierungen werden auf den Schlachtzugeinheiten angezeigt"
L["Preview Raid Frames"] = "Schlachtzugsvorschau"
L["Click to toggle raid frame preview and cycle through different group sizes."] = "Zeige/Verberge die Vorschau des Schlachtzugsfenders und durchlaufe verschiedene Gruppengrößen."
L["Dungeon & Raid Debuffs"] = "Instanz & Schlachtzug Debuffs"
L["Show important Dungeon & Raid debuffs"] = "Zeige wichtig Instanz & Schlachtzug Debuffs an"
L["Sort Raid Frames by Role"] = "Sortiere Schlachtzug nach Rolle"
L["Sort raid unit frames by role (tank, heal, damage) instead of group."] = "Sortiere Einheitenfenster in Schlachtzügen nach Rolle (Tank, Heiler, Schaden) anstatt nach Gruppe."
L["Set Raid Units per Column"] = "Schlachtzugseinheiten pro Spalte"
L["Set the number of raid unit frames per column or row, depending on grow directions."] = "Setzen die Anzahl der Wachstumsrichtung der Schlachtzugsfenster pro Spalte oder Zeile, abhängig von der Wachstumsrichtung."
L["Show Country Flag"] = "Zeige Länderflaggen"
L["Different Than Own"] = "Nur andere Länder als das Eigene"
L["Display a country flag based on the unit's language"] = "Zeige die Länderflaggen der Spieler neben dem Namen"
L["Red Overlay"] = "Rotes Overlay"
L["Your items have been repaired for: %s"] = "Deine Gegenstände wurden repariert für: %s"
L["Your items have been repaired using guild bank funds for: %s"] = "Deine Gegenstände wurden aus der Gildenbank repariert für: %s"
L["Replace the default mana/power bar."] = "Ersetze die Standard Mana/Powerbar."
L["Loot to leftmost Bag"] = "Beute in die am weitesten linke Tasche legen"
L["Right"] = "Rechts"
L["Secure"] = "Sicher"
L["Selling junk"] = "Verkaufe Müll"
L["Separate bags"] = "Taschen separat anzeigen"
L["New Bag Name"] = "Neuer Taschenname:"
L["Right click to customize the bag title."] = "Rechtsklick um einen individuellen Namen festzulegen"
L["Save and Reload"] = "Speichern und \nneu laden"
L["Lock HUD"] = "HUD sperren"
L["Display all of the target's debuffs."] = "Zeige alle Schächungszauber des Ziels an."
L["Display the target's buffs."] = "Zeige die Stärkungszauber des Ziels."
L["Display the target's debuffs that you have inflicted."] = "Zeige die Schwächungszauber des Ziel, welche du zugefügt hast."
L["Display Average Item Level"] = "Zeige durschnittliches Item-Level"
L["Display the average item level instead of prestige level for friendly units."] = "Zeige das durschnittliche Item-Level statt des Prestige-Levels für freundliche Einheiten."
L["Show Junk Icon"] = "Zeige Müll Symbol"
L["Show Quality Color"] = "Zeige Qualitätsfarbe"
L["Show Scrap Icon"] = "Zeige Schrott Symbol"
L["Show Threat"] = "Bedrohung anzeigen"
L["Show Upgrade Icon"] = "Zeige Aufwertungs-Symbol"
L["Scale with Right Click"] = "Skalieren mit Rechtsklick"
L["Right click on a moverframe to show extra frame options"] = "Rechtsklick auf ein Fenster um zusätzliche Optionen anzuzeigen"
L["Extra Frame Options"] = "Extra Festeroptionen "
L["No extra frame options for '%s'"] = "Keine Extraoptionen für das Fenster '%s' verfügbar"
L["Scale"] = "Skalierung"
L["Right Bar Width"] = "Rechte Aktionleistenbreite"
L["Number of columns in the two extra right-hand action bars."] = "Anzahl an Spalten für die zwei extra Aktionsleisten an der rechten Seite."
L["Enable the talents, specialization, and spellbook replacement."] = "Aktiviert das GW2_UI Talent-, Berufs- und Zauberbuchfenster."
L["Targeted by:"] = "Ziel von:"
L["Show Combo Points on Target"] = "Zeige Combopunkt am Ziel"
L["Show combo points on target, below the health bar."] = "Zeige Combopunkt am Ziel unterhalb des Gesundheitsbalkens"
L["Modify the target frame settings."] = "Modifiziere die Einstellungen der Zieleinheit."
L["Enable the target frame replacement."] = "Aktiviere den Zieleinheiten."
L["Enable the target of target frame."] = "Aktiert das Ziel des Ziels."
L["Edit the target frame settings."] = "Bearbeite die Einstellungen der Zieleinheit"
L["Tooltips"] = "Tooltips"
L["Replace the default UI tooltips."] = "Ersetze die Standard UI Tooltips."
L["Modifier for IDs"] = "Tastenkombi für IDs"
L["Top"] = "Oben"
L["Class Totems Growth Direction"] = "Klassen Totmes Wachstumsrichtung"
L["Class Totems Sorting"] = "Klassen Totmes Sortierrichtung"
L["Retrieve your corpse"] = "Erreiche deinen Leichnam"
L["Up"] = "Hoch"
L["New update available for download."] = "Ein neues Update steht zum Download bereit."
L["New update available containing new features."] = "Ein neues Update mit neuen Funktionen ist verfügbar."
L["A |cFFFF0000major|r update is available.\nIt's strongly recommended that you update."] = "Ein |cFFFF0000wichtiges|r Update ist verfügbar.\nEs wird drigend empfohlen ein Update durchzuführen."
L["Up and right"] = "Hoch und rechts"
L["Sell junk automatically"] = "Müll automatisch verkaufen"
L["Vertical"] = "Vertikal"
L["Welcome"] = "Willkommen"
L["Welcome to GW2 UI"] = "Willkommen beim GW2-UI"
L["GW2 UI is a full user interface replacement. We have built the user interface with a modular approach, this means that if you dislike a certain part of the addon - or have another you prefer for that function - you can just disable that part, while keeping the rest of the interface intact.\nSome of the modules available to you are an immersive questing window, a full inventory replacement, as well as a full character window replacement. There are many more that you can enjoy, just take a look in the settings menu to see what's available to you!"] = "Das GW2-UI ist ein vollständiger UI-Ersatz. Wir haben die Benutzeroberfläche modular aufgebaut, dies bedeutet, wenn du einen bestimmten Teil des Addons nicht magst - oder du hast ein anders Addon, dass du für die Funktion bevorzugst - kannst du diesen Teil einfach deaktivieren, während der Rest des UI's intakt bleibt.\nEinige der Module, die dir zur Verfügung stehen, sind ein umfassendes Questfenster, ein vollständiger Inventarersatz sowie ein vollständiger Charakterfesterersatz. Es gibt viel mehr welche du erleben kannst. Wirf einfach ein Blick in die Einstellungen und schaue was zur Verfügung steht."
L["What is 'Pixel Perfect'?\n\nGW2 UI has a built-in setting called 'Pixel Perfect Mode'. What this means for you is that your user interface will look as was intended, with crisper textures and better scaling. Of course, you can toggle this off in the settings menu should you prefer."] = "Was ist 'Pixel Perfection'?\n\nGW2 UI verfügt über eine integrierte Einstellung namens 'Pixel Perfection Mode'. Das bedeutet für dich, dass das UI wie vorgesehen aussieht, mit gestochen scharfen Texturen und einer besseren Skalierung. Natürlich kannst du dies in den Einstellungen ausschalten, falls du dies vorziehst."
L["Show Coordinates on World Map"] = "Zeige Koordinaten auf der Weltkarte"
L["Zone Ability"] = "Zonen Fähigkeit"
L["GW2 UI Update"] = true
L["Bar"] = "Fortschrittsbalken"
L["Top Left"] = "Oben links"
L["Top Right"] = "Oben rechts"
L["Center"] = "Mitte"
L["Player frame in target frame style"] = "Spielereinheit im Zieleinheiten Style"
L["PvP Indicator"] = "PvP Indikator"
L["Invert target frame"] = "Zieleinheit spiegeln"
L["Invert focus frame"] = "Fokuseinheit spiegeln"
L["Talking Head"] = "Sprechender Kopf"
L["Skins"] = "Skins"
L["Adjust Skin settings."] = "Passe die Einstellungen für externe Blizzard Fenster & Addon-Skins an."
L["Blizzard Class Colors"] = "Blizzard Klassenfarben"
L["Popup notifications"] = "Popup Benachrichtigungen"
L["Looking for Group notifications"] = "Suche nach Gruppe Benachrichtigungen"
L["Misc Frames"] = "Verschiedene Fenster"
L["Developed by"] = "Entwickelt von"
L["With Contributions by"] = "Mitgewirkt von"
L["Localised by"] = "Lokalisiert von"
L["QA Testing by"] = "QS-Tests von"
L["Credits"] = "Danksagung"
L["Socket Frame"] = "Sockel Fenster"
L["Grays"] = "Müll"
L["Reset Character Data: Hold Shift + Right Click"] = "Character Daten zurücksetzen: Shift + Rechtsklick"
L["Reset Session Data: Hold Ctrl + Right Click"] = "Sitzungsdaten zurücksetzen: Strg + Rechtsklick"
L["Session:"] = "Sitzung:"
L["Earned:"] = "Verdient:"
L["Spent:"] = "Ausgegeben:"
L["Deficit:"] = "Defizit:"
L["Profit:"] = "Gewinn:"
L["Gossip Frame"] = "Begrüßungsfenster"
L["Saved Raid(s)"] = "Gespeicherte Schlachtzüge"
L["Saved Dungeon(s)"] = "Gespeicherte Instanz(en)"
L["Daily Reset"] = "Täglicher Reset"
L["Right Click to change Talent Specialization"] = "Rechtsklick um die Talentspezialisierung zu ändern"
L["Legacy: Sorted by duration but auras can't cancel via right click in combat\nSecure: Not sorted but auras can cancel via right click in combat"] = "Klassich: Sortiert nach Dauer, aber Auren können nicht durch Rechtsklick im Kampf abgebrochen werden\nSicher: Nicht sortiert, aber Auren können durch Rechtsklick im Kampf abgebrochen werden"
L["Weekly Reset"] = "Wöchentlicher Reset"
L["Conduits"] = "Medien"
L["Maximum lines of 'Copy Chat Frame'"] = "Maximale Zeilen im 'Chat-Kopieren-Fenster'"
L["Set the maximum number of lines displayed in the Copy Chat Frame"] = "Setze die maximalen Anzahl an Zeilen, die im 'Chat-Kopieren-Fenster' angzeigt werden'"
L["The following addon(s) are loaded, which can cause conflicts. By default, this setting is disabled."] = "Die folgenden Addons wurden geladen, was zu Konflikten führen kann. Standardmäßig ist diese Einstellung deaktiviert."
L["Stance Bar Growth Direction"] = "Stance Bar Wachstumsrichtung"
L["Set the growth direction of the stance bar"] = "Setze die Wachstumsrichtung der Stance Bar"
L["Ctrl + Click to toggle override"] = "Strg. + Klick um die Einstellung zu überschreiben"
L["Incompatible Addons behavior Overridden. Needs a reload to take effect."] = "Inkompatibles Addons-Verhalten überschrieben. Benötigt ein Nachladen, um wirksam zu werden."
L["You have overridden this behavior."] = "Du hast dieses Verhalten überschrieben."
L["Out of combat"] = "Nicht im Kampf"
L["Show an additional resource bar"] = "Zeige eine zusätzliche Ressourcenbar"
L["Show auras below"] = "Auren unterhalb anzeigen"
L["G"] = "G"
L["P"] = "P"
L["R"] = "R"
L["O"] = "O"
L["PL"] = "PL"
L["RL"] = "RL"
L["I"] = "I"
L["IL"] = "IL"
L["RW"] = "RW"
L["Combat Repeat"] = "Kampf-Wiederholungen"
L["Number of repeat characters while in combat before the chat editbox is automatically closed, set to zero to disable."] = "Anzahl der wiederholten Zeichen im Kampf, bevor das Chateingabefeld automatisch schließt, auf Null setzen um diese Option zu deaktivieren."
L["Hyperlink Hover"] = "Hyperlink Hover"
L["Display the hyperlink tooltip while hovering over a hyperlink."] = "Zeige den Hyperlink-Tooltip an, während du über einen Hyperlink schweben."
L["Short Channels"] = "Kurze Kanalnamen"
L["Shorten the channel names in chat."] = "Verkürzt die Kanalnamen im Chat."
L["URL Links"] = "URL Links"
L["Attempt to create URL links inside the chat."] = "Versucht einen URL-Links im Chat zu erstellen."
L["Role Icon"] = "Rollen-Icon"
L["Display LFG Icons in group chat."] = "Anzeigen von LFG-Symbolen im Chat."
L["Spam Interval"] = "Spam-Intervall"
L["Prevent the same messages from displaying in chat more than once within this set amount of seconds, set to zero to disable."] = "Verhindert, dass die gleiche Nachricht im Chat mehr als einmal, innerhalb dieser festgelegten Anzahl von Sekunden, angezeigt wird. Auf Null setzen um diese Option zu deaktivieren."
L["Class Color Mentions"] = "Klassenfarbe Markierung"
L["Use class color for the names of players when they are mentioned."] = "Verwende Klassenfarbe für die Namen der Spieler, wenn sie erwähnt werden."
L["Keywords"] = "Schlüsselwörter"
L["List of words to color in chat if found in a message. If you wish to add multiple words you must seperate the word with a comma. To search for your current name you can use %MYNAME%.\n\nExample:\n%MYNAME%, Heal, Tank"] = "Liste der Wörter die farblich im Chat erscheinen, wenn sie in einer Nachricht gefunden werden. Wenn du möchtest, kannst du mehrere Wörter hinzufügen. Diese müssen durch ein Komma getrennt werden. Um deinen momentanen Namen zu suchen, benutze %MYNAME%.\n\nBeispiel:\n%MYNAME%, Heal, Tank"
L["Keyword Alert"] = "Schlüsselwörter-Alarm"
L["Keyword highlight color"] = "Schlüsselwörter Hervorhebungsfarbe"
L["In raid"] = "Im Schlachtzug"
L["In group or in raid"] = "In Gruppe oder im Schlachtzug"
L["Show Role Bar"] = "Zeige Rollenbar"
L["Role Bar"] = "Rollenbar"
L["Whether to display a floating bar showing your group or raid's role composition. This can be moved via the 'Move HUD' interface."] = "Zeigt eine schwebende Leiste an, welche dir deine Gruppen oder Schlachtzug Rollenzusammensetzung anzeigt. Dieses kann über die 'Move HUD'-Oberfläche verschoben werden."
L["Show Missing Raid Buffs Bar"] = "Zeige fehlende 'Schlachtzug-Buff' Bar"
L["Missing Raid Buffs Bar"] = "Fehlende 'Schlachtzug-Buff' Bar"
L["Missing Raid Buffs"] = "Fehlende 'Schlachtzug-Buffs'"
L["If enabled, an animated border will surround the missing raid buffs"] = "Wenn aktiviert, wird ein animierter Rahmen um die fehlenden Schlachtzug-Buffs angezeigt"
L["Whether to display a floating bar showing your missing buffs. This can be moved via the 'Move HUD' interface."] = "Zeigt eine schwebende Leiste an, welche dir deine fehlenden Schlachtzug-Buffs anzeigt. Dieses kann über die 'Move HUD'-Oberfläche verschoben werden."
L["Dimmed"] = "Gedimmt"
L["Greyed out"] = "Ausgegraut"
L["Animated"] = "Animiert"
L["Invert raid buff bar"] = "'Schlachtzug-Buff' Bar invertieren"
L["If enabled, the above settings will apply to buffs you have, instead of buffs you are missing"] = "Wenn aktiviert, gelten die obigen Einstellungen für Buffsdie du hast, anstatt von Buffs die dir fehlen"
L["Edit raid buff bar."] = "Bearbeite die 'Schlachtzug-Buff' Bar-Einstellungen."
L["Edit chat settings."] = "Bearbeite die Chat-Einstellungen."
L["Emotion Icons"] = "Emotion Icons"
L["Display emotion icons in chat"] = "Anzeigen von Emotion-Symbolen im Chat"
L["Custom buff"] = "Eigener Buff"
L["Enter the spell ID of the buff you wish to track. Only one spell ID is supported. To find the spell ID of the buff you want to track, enable IDs in the tooltip settings and mouse over the icon in your aura bar."] = "Gebe die Zauber-ID des Buffs ein, welchen du verfolgen möchtest. Es wird nur eine Zauber-ID unterstützt. Um die Zauber-ID des Buffs zu finden, den du verfolgen möchtest, aktiviere die ID's  in den Tooltip-Einstellungen und führe die Maus über den Buff in der Aura-Leiste."
L["Hide Editbox"] = "Chateingabefeld verstecken"
L["Hide the chat editbox when not in focus."] = "Verstecke das Chateingabefeld, wenn es keinen Fokus hat"
L["Set important Dungeon & Raid debuff scale"] = "Setze die Skalierung für wichtige Instanz & Schlachtzug Debuffs"
L["Set dispellable debuff scale"] = "Setze die Skalierung für bannbare Debuffs"
L["Show both party frames and party grid"] = "Gruppen-Rahmen und Gruppen-Gitter anzeigen"
L["If enabled, this will show both the stylised party frames as well as the grid frame. This setting has no effect if '%s' is enabled."] = "Wenn aktiviert, zeigt dies sowohl die stilisierten Gruppen-Rahmen als auch die Gruppen-Gitter an. Diese Einstellung hat keinen Effekt, wenn '%s' aktiviert ist."
L["Adds descriptions for mythic keystone properties to their tooltips."] = "Fügt eine Beschreibung für mythische Schlüsselsteineigenschaften dem Tooltip hinzu."
L["Click to open Emoticon Frame"] = "Öffnet ein Fenster mit Emotesymbolen"
L["Quick Join Messages"] = "Schnellbeitritt Nachricht"
L["Show clickable Quick Join messages inside of the chat."] = "Zeige eine klickbare Schnellbeitritts Nachricht im Chat."
L["is looking for members"] = "sucht nach Mitgliedern"
L["joined a group"] = "ist einer Gruppe beigetreten"
L["Add timestamp to all messages"] = "Zeitstempel bei allen Nachricht anzeigen"
