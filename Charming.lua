--[[--------------------------------------------------------------------

    Charming 1.2 (June 17, 2025)

----------------------------------------------------------------------]]

---@type string
local Name = ...

local CreateFrame = CreateFrame
local SecureHandlerWrapScript = SecureHandlerWrapScript

BINDING_HEADER_CHARMING = C_AddOns.GetAddOnMetadata(Name, "Title")
_G["BINDING_NAME_CLICK " .. Name .. "Set:LeftButton"] = "Place World Marker"
_G["BINDING_NAME_CLICK " .. Name .. "Clear:LeftButton"] = "Clear World Markers"

local Header = CreateFrame("Frame", nil, UIParent, "SecureHandlerBaseTemplate")

local PlaceMarker = CreateFrame("Button", Name .. "Set", UIParent, "SecureActionButtonTemplate")
PlaceMarker:SetAttribute("type", "macro")
PlaceMarker:RegisterForClicks("AnyDown")

SecureHandlerWrapScript(PlaceMarker, "PreClick", Header, [[
owner:SetAttribute("markerIndex", (owner:GetAttribute("markerIndex") or 0) % 8 + 1)
self:SetAttribute("macrotext", "/wm [@cursor] " .. owner:GetAttribute("markerIndex"))
]])

local ClearMarkers = CreateFrame("Button", Name .. "Clear", UIParent, "SecureActionButtonTemplate")
ClearMarkers:SetAttribute("type", "macro")
ClearMarkers:SetAttribute("macrotext", "/cwm all")
ClearMarkers:RegisterForClicks("AnyDown")

SecureHandlerWrapScript(ClearMarkers, "PreClick", Header, [[
owner:SetAttribute("markerindex", 0)
]])