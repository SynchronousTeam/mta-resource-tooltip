--- Client Variables
event = {add = addEventHandler, load = addEvent, execute = triggerServerEvent} -- Make simple calls for addEvent and triggerServerEvent by the variable event
loadstring(exports.dgs:dgsImportFunction())() -- Load all the functions from the DGS Resource
const = {
    position = {X_WINDOW = 0.5, Y_WINDOW = 0.988, NONE = 0},
    size = {
        W_WINDOW = 0.25,
        H_WINDOW = 0.12,
        W_BROWSER = 1,
        H_BROWSER = 1,
        TITLE_SIZE = 0
    },
    time = {LOAD_DELAY = 300, TOOLTIP_DURATION = 3500},
    type = {
        SUCCES = "2",
        WARNING = "3",
        INFO = "4",
        ERROR = "5",
        "1",
        "2",
        "3",
        "4"
    }
}
--- GUI Init
URL_PAGE_TOOLTIP = "http://mta/[tooltip]/src/tooltip.html" -- Location of the HTML File (global)
DGS_WINDOW_TOOLTIP = dgsCreateWindow(const.position.NONE, const.position.NONE,
                                     const.size.W_WINDOW, const.size.H_WINDOW,
                                     "Tooltip", true, nil,
                                     const.size.TITLE_SIZE, nil, nil, nil,
                                     tocolor(0, 0, 0, 0)) -- Create a Window Canvas using DGS (global)
BROWSER_TOOLTIP = dgsCreateBrowser(const.position.NONE, const.position.NONE,
                                   const.size.W_BROWSER, const.size.H_BROWSER,
                                   true, DGS_WINDOW_TOOLTIP, true, true) -- Create the Browser (global)
--- GUI Parameters
dgsSetPosition(DGS_WINDOW_TOOLTIP, const.position.X_WINDOW,
               const.position.Y_WINDOW, true, true) -- Center the DGS Window on the Screen (global)
dgsWindowSetSizable(DGS_WINDOW_TOOLTIP, false) -- Does the Window not Sizable (global)
dgsWindowSetMovable(DGS_WINDOW_TOOLTIP, false) -- Does the Window not Movable (global)
dgsWindowSetCloseButtonEnabled(DGS_WINDOW_TOOLTIP, false) -- Hidde the Close Window Button (global)
dgsSetVisible(DGS_WINDOW_TOOLTIP, false) -- Hidde the DGS Window (global)
dgsSetFont(DGS_WINDOW_TOOLTIP, "default-bold") -- Bold Font (global)
---Functions
function createBrowserTooltipGUI()
    dgsSetVisible(DGS_WINDOW_TOOLTIP, true)
    loadBrowserURL(BROWSER_TOOLTIP, URL_PAGE_TOOLTIP)
end

function deleteBrowserTooltipGUI()
    if dgsGetVisible(DGS_WINDOW_TOOLTIP) then
        dgsSetVisible(DGS_WINDOW_TOOLTIP, false)
    end
end -- This function removes the Browser GUI

function sendScriptBrowserTooltip(message, type_tooltip)
    for i = 1, table.getn(const.type) do
        if not i == tonumber(const.type[type_tooltip]) then
            outputConsole("Removing: " .. i)
            executeBrowserJavascript(BROWSER_TOOLTIP,
                                     "document.querySelector('.error:nth-child(" ..
                                         i .. ")').style = 'display: none'")
        end
    end
    setTimer(function()
        executeBrowserJavascript(BROWSER_TOOLTIP,
                                 "document.querySelector('.error:nth-child(" ..
                                     const.type[type_tooltip] ..
                                     ")').innerHTML = '" .. message ..
                                     "'; document.querySelector('.error:nth-child(" ..
                                     const.type[type_tooltip] ..
                                     ")').style = 'display: initial'")
    end, const.time.LOAD_DELAY, 1)
end

function showTooltip(message, type_tooltip)
    if dgsGetVisible(DGS_WINDOW_TOOLTIP) then end
    sendScriptBrowserTooltip(message, type_tooltip)
    setTimer(function()
        if dgsGetVisible(DGS_WINDOW_TOOLTIP) then
            setTimer(function() deleteBrowserTooltipGUI() end,
                     const.time.TOOLTIP_DURATION, 1)
        end
    end, 6000, 1)
    if not dgsGetVisible(DGS_WINDOW_TOOLTIP) then
        createBrowserTooltipGUI()
        setTimer(function()
            sendScriptBrowserTooltip(message, type_tooltip)
            setTimer(function()
                if dgsGetVisible(DGS_WINDOW_TOOLTIP) then
                    setTimer(function()
                        deleteBrowserTooltipGUI()
                    end, const.time.TOOLTIP_DURATION, 1)
                end
            end, 6000, 1)
        end, const.time.LOAD_DELAY, 1)
    end
end
