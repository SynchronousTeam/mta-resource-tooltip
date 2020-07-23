--- Server Variables
event = {add = addEventHandler, load = addEvent, execute = triggerClientEvent} -- Make simple calls for addEvent and triggerClientEvent by the variable event

---Functions
function tooltipSendData(player, message, type)
    event.execute(player, "tooltip-browser:show", player)

    if (type == "error") then
        event.execute(player, "tooltip-label-error:show", player, message)
    end

end
--- MTA Events
event.load('tooltip-backend:execute', true)
event.add('tooltip-backend:execute', root,
          function(message, type) tooltipSendData(client, message) end)
