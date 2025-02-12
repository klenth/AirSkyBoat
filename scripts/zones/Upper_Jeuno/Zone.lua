-----------------------------------
-- Zone: Upper_Jeuno (244)
-----------------------------------
local ID = require('scripts/zones/Upper_Jeuno/IDs')
require('scripts/globals/conquest')
require('scripts/globals/chocobo')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    xi.chocobo.initZone(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1
    local month = tonumber(os.date("%m"))
    local day = tonumber(os.date("%d"))

    -- Retail start/end dates vary, I am going with Dec 5th through Jan 5th.
    if(month == 12 and day >= 5) or (month == 1 and day <= 5) then
        player:ChangeMusic(0, 239)
        player:ChangeMusic(1, 239)
    -- No need for an 'else' to change it back outside these dates as a re-zone will handle that.
    end

    -- MOG HOUSE EXIT
    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(46.2, -5, -78, 172)
    end

    xi.moghouse.exitJobChange(player, prevZone)

    return cs
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
    xi.moghouse.exitJobChangeFinish(player, csid, option)
end

return zoneObject
