--- Client Variables
event = {add = addEventHandler, load = addEvent, execute = triggerServerEvent} -- Make simple calls for addEvent and triggerServerEvent by the variable event
loadstring(exports.dgs:dgsImportFunction())() -- Load all the functions from the DGS Resource
const = {
  position = {X_WINDOW = 0.5, Y_WINDOW = 0.988, NONE = 0}, -- All the Avaible Positions for the GUI of this Resource
  size = {
    W_WINDOW = 0.25,
    H_WINDOW = 0.12,
    W_BROWSER = 1,
    H_BROWSER = 1,
    TITLE_SIZE = 0
  }, -- All the Avaible Sizes for the GUI of this Resource
  time = {LOAD_DELAY = 300, TOOLTIP_DURATION = 9000}, -- Usefull global Timer variables | Delay for Wait, Duration to Stay & StopWatch to Excute
  type = {
    SUCCES = "2",
    WARNING = "3",
    INFO = "4",
    ERROR = "5",
    "1",
    "2",
    "3",
    "4",
    "5"
  } -- Types of Tooltips 
} -- Lua Constructor for easy acces and Variable storage
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
end -- Initializing GUI Function | Shows the DGS Window an Load the Root page

function deleteBrowserTooltipGUI()
  if dgsGetVisible(DGS_WINDOW_TOOLTIP) then
    dgsSetVisible(DGS_WINDOW_TOOLTIP, false)
  end
end -- Removing GUI Function | Hidde the DGS Window when this is Visible

function sendScriptBrowserTooltip(message, type_tooltip)
  for i = 2, table.getn(const.type) do
    if i ~= tonumber(const.type[type_tooltip]) then
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
end -- Send a JavaScript instruction to the Browser | This Instruction deletes the previous Tooltips and Show a new one

function showTooltip(message, type_tooltip)
  query_content = executeBrowserJavascript(BROWSER_TOOLTIP,"document.querySelector('.error:nth-child("..const.type[type_tooltip]..")').innerHTML")
  if dgsGetVisible(DGS_WINDOW_TOOLTIP) then
    sendScriptBrowserTooltip(message,type_tooltip)
  else
    tooltip_content = message
    createBrowserTooltipGUI()
    setTimer(function()
      sendScriptBrowserTooltip(message,type_tooltip)
      setTimer(function()
        if tooltip_content == query_content then
          outputConsole("Si son Iguales")
          deleteBrowserTooltipGUI()
        else
          outputConsole("No son Iguales "..query_content.." otro "..tooltip_content)
        end
      end,const.time.TOOLTIP_DURATION,1)
  end,const.time.LOAD_DELAY,1)
end
end -- Validate all the Posible Window Visible Status and execute the Script
