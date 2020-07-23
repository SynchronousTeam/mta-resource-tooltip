--- Client Variables
event = {add = addEventHandler, load = addEvent, execute = triggerServerEvent} -- Make simple calls for addEvent and triggerServerEvent by the variable event
loadstring(exports.dgs:dgsImportFunction())() -- Load all the functions from the DGS Resource
--- GUI Init
local URL_PAGE = "http://mta/[tooltip]/src/tooltip.html" -- Location of the HTML File (global)
local DGS_WINDOW = dgsCreateWindow(0.21, 0.20, 0.45, 0.45, "Tooltip", true,
                                   nil, nil, nil, nil, nil, tocolor(0, 0, 0, 0)) -- Create a Window Canvas using DGS (global)
local BROWSER = dgsCreateBrowser(0, 0, 1, 1, true, DGS_WINDOW, true, true) -- Create the Browser (global)
--- GUI Parameters
dgsCenterElement(DGS_WINDOW) -- Center the DGS Window on the Screen (global)
---Functions
function createTooltipBrowserGUI()
    if not isElement(DGS_WINDOW) then
        DGS_WINDOW = dgsCreateWindow(0.21, 0.20, 0.45, 0.45, "Tooltip", true,
                                     nil, nil, nil, nil, nil,
                                     tocolor(0, 0, 0, 0))
        BROWSER = dgsCreateBrowser(0, 0, 1, 1, true, DGS_WINDOW, true, true)
    end

    loadBrowserURL(BROWSER, URL_PAGE)
end

function tooltipLabelError(message)
    executeBrowserJavascript(BROWSER,
                             "document.querySelector('.error:nth-child(5)').innerHTML = '" ..
                                 message ..
                                 "'; document.querySelector('.error:nth-child(5)').style = 'display: initial; top: 5%; left:10.5%'");
end
--- Mta Events
event.load('tooltip-browser:show', true)
event.add('tooltip-browser:show', root,
          function() createTooltipBrowserGUI() end, true)

event.load('tooltip-label-error:show', true)
event.add('tooltip-label-error:show', root,
          function(message) tooltipLabelError(message) end, true)
