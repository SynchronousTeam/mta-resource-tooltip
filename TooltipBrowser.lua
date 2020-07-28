--- Client Variables
event = {add = addEventHandler, load = addEvent, execute = triggerServerEvent} -- Make simple calls for addEvent and triggerServerEvent by the variable event
loadstring(exports.dgs:dgsImportFunction())() -- Load all the functions from the DGS Resource
--- GUI Init
URL_PAGE_TOOLTIP = "http://mta/[tooltip]/src/tooltip.html" -- Location of the HTML File (global)
DGS_WINDOW_TOOLTIP = dgsCreateWindow(0.21, 0, 0.25, 0.12, "Tooltip", true, nil,
                                     0, nil, nil, nil, tocolor(0, 0, 0, 0)) -- Create a Window Canvas using DGS (global)
BROWSER_TOOLTIP = dgsCreateBrowser(0, 0, 1, 1, true, DGS_WINDOW_TOOLTIP, true,
                                   true) -- Create the Browser (global)
--- GUI Parameters
dgsSetPosition(DGS_WINDOW_TOOLTIP, 0.5, 0.988, true, true) -- Center the DGS Window on the Screen (global)
dgsWindowSetSizable(DGS_WINDOW_TOOLTIP, false) -- Does the Window not Sizable (global)
dgsWindowSetMovable(DGS_WINDOW_TOOLTIP, false) -- Does the Window not Movable (global)
dgsWindowSetCloseButtonEnabled(DGS_WINDOW_TOOLTIP, false) -- Hidde the Close Window Button (global)
dgsSetVisible(DGS_WINDOW_TOOLTIP, false) -- Hidde the DGS Window (global)
dgsSetFont(DGS_WINDOW_TOOLTIP, "default-bold") -- Bold Font (global)
---Functions
function createBrowserTooltipGUI()
    addEventHandler("onClientBrowserCreated", BROWSER_TOOLTIP, function()
        dgsSetVisible(DGS_WINDOW_TOOLTIP, true)
        loadBrowserURL(BROWSER_TOOLTIP, URL_PAGE_TOOLTIP)
    end)
end

function deleteBrowserTooltipGUI()
    addEventHandler("onClientBrowserCreated", BROWSER_TOOLTIP,
                    function() dgsSetVisible(DGS_WINDOW_TOOLTIP, false) end)
end -- This function removes the Browser GUI

function showTooltipError(message)
    if not dgsGetVisible(DGS_WINDOW_TOOLTIP) then
        createBrowserTooltipGUI()
        setTimer(function() deleteBrowserTooltipGUI() end, 9500, 1)
    end
    setTimer(function()
        executeBrowserJavascript(BROWSER_TOOLTIP,
                                 "document.querySelector('.error:nth-child(5)').innerHTML = '" ..
                                     message ..
                                     "'; document.querySelector('.error:nth-child(5)').style = 'display: initial'");
    end, 500, 1)
end

function showTooltipWarning(message)
    if not dgsGetVisible(DGS_WINDOW_TOOLTIP) then
        createBrowserTooltipGUI()
        setTimer(function() deleteBrowserTooltipGUI() end, 9500, 1)
    end
    setTimer(function()
        executeBrowserJavascript(BROWSER_TOOLTIP,
                                 "document.querySelector('.error:nth-child(3)').innerHTML = '" ..
                                     message ..
                                     "'; document.querySelector('.error:nth-child(3)').style = 'display: initial'");
    end, 500, 1)
end

function showTooltipInfo(message)
    if not dgsGetVisible(DGS_WINDOW_TOOLTIP) then
        createBrowserTooltipGUI()
        setTimer(function() deleteBrowserTooltipGUI() end, 9500, 1)
    end
    setTimer(function()
        executeBrowserJavascript(BROWSER_TOOLTIP,
                                 "document.querySelector('.error:nth-child(4)').innerHTML = '" ..
                                     message ..
                                     "'; document.querySelector('.error:nth-child(4)').style = 'display: initial'");
    end, 500, 1)
end

function showTooltipSucces(message)
    if not dgsGetVisible(DGS_WINDOW_TOOLTIP) then
        createBrowserTooltipGUI()
        setTimer(function() deleteBrowserTooltipGUI() end, 9500, 1)
    end
    setTimer(function()
        executeBrowserJavascript(BROWSER_TOOLTIP,
                                 "document.querySelector('.error:nth-child(2)').innerHTML = '" ..
                                     message ..
                                     "'; document.querySelector('.error:nth-child(2)').style = 'display: initial'");
    end, 500, 1)
end
