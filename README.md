# Resource Init

<p align="center">
<img src="https://github.com/SynchronousTeam/mta-resource-tooltip/blob/master/demo/image/Image_Resource_Tooltip.png">
<br>
<a href="https://github.com/SynchronousTeam/mta-resource-init"style="text-decoration: none">
<img src="https://img.shields.io/github/license/SynchronousTeam/mta-resource-init">
</a>
<a href="https://github.com/SynchronousTeam/mta-resource-init"style="text-decoration: none">
<img src="https://img.shields.io/github/languages/count/SynchronousTeam/mta-resource-init">
</a>
<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=5LY2Y46Q7DSWL&source=url"style="text-decoration: none">
<img src="https://img.shields.io/badge/Donate-PayPal-green.svg">
</a>
<a href="https://github.com/SynchronousTeam/mta-resource-init"style="text-decoration: none">
<img src="https://img.shields.io/github/repo-size/SynchronousTeam/mta-resource-init">
</a>
<a href="https://www.facebook.com/SynchronousTeam"style="text-decoration: none">
<img src="https://img.shields.io/badge/Synchronous-facebook-blue">
</a>
<a href="https://discord.gg/vSvgHvk"style="text-decoration: none">
<img src="https://img.shields.io/discord/623715606184722442?color=blueviolet&label=Server&logo=discord">
</a>
</p>

---

**MTA Resource Tooltip** is an Open-Source GUI/Lua Connection for a Multi Theft Auto server developed on **_HTML, CSS, JavaScript_ and _Lua_**. The function for this resource is **Receive Messages** from another Resources and shows them like `SUCCES - INFO - WARNING - ERROR` Tooltips into the Player Screen, all this stuff running on **Montgomery Country RP** a MTA Server developed by **Kyonax, Pixxa and Thrizz, members of Synchronous**.

This resource is still on develop so many code lines are going to change.

### How to Use

On the **meta.xml** file, the Resource exports a function that we can call from another Resource.

```lua
--- Where [tooltip] is the name of the Resource and showTooltip() the name of the Function
exports["[tooltip]"]:showTooltip(message,type_tooltip)
```

To use this correctly on another Resource you need to create a _`Client Event`_, and use this event into the new Resource **_(Make sure that the lua file on the meta.xml is call like a type="Client")_**.

```lua
--- Where resource Is the name of the new Resource, message is Any text that you want to
--- show and the type_tooltip is the Type of the Tooltip Message
addEvent("resource-tooltip-browser:show", true)
addEventHandler("resource-tooltip-browser:show", root, function(message, type_tooltip)
    resource_tooltip_type_send = exports["[tooltip]"]:showTooltip(message,type_tooltip)
end, true)
```

# Example

```lua
-- clientFile.lua
addEvent("serverFile-tooltip-browser:show", true)
addEventHandler("serverFile-tooltip-browser:show", root, function()
    init_tooltip_type_send = exports["mta-resource-tooltip"]:showTooltip(message, type_tooltip)
end,true)

-- serverFile.lua
triggerClientEvent(client,"serverFile-tooltip-browser:show",client, "All the resource works Fine!", "SUCCES")
triggerClientEvent(client,"serveerFile-tooltip-browser:show",client,"Follow me on Twitter @Synk_Kyonax", "INFO")
```

<div>
<img src="https://github.com/SynchronousTeam/mta-resource-tooltip/blob/master/demo/image/Image_Tooltip_Succes.png">
<br>
<img src="https://github.com/SynchronousTeam/mta-resource-tooltip/blob/master/demo/image/Image_Tooltip_Info.png">
<br>
</div>

_If You are using JavaScript_

```js
mta.triggerEvent(
  "serverFile-tooltip-browser:show",
  "Im Using JavaScript!!!",
  "WARNING"
);
```

<div>
<img src="https://github.com/SynchronousTeam/mta-resource-tooltip/blob/master/demo/image/Image_Tooltip_Warning.png">
<br>
</div>

## Types of Tooltips

You can show different Types of Tooltips with this resource, **_4 types_** at the moment.

| Type      | Description          |
| --------- | -------------------- |
| "SUCCES"  | Green color Message  |
| "INFO"    | Blue color Message   |
| "WARNING" | Yellow color Message |
| "ERRROR"  | Red color Message    |

## Developer

**Synchronous Developers** are working on this repository, if you want know a little more about the team, you can follow them on their each social media.

###### Kyonax

- [**FaceBook**](https://www.facebook.com/MrKyonax)
- [**Twitter**](https://twitter.com/Synk_Kyo)
- [**Twitch**](https://www.twitch.tv/synk_kyonax)
- [**YouTube**](https://www.youtube.com/channel/UCOCGuDADwciaJfnCxWoYGHA)
- [**GitHub**](https://github.com/Kyonax)

## Support

We do our best on every single app, if you want to learn with us and then **Support us** you can check out the links below.

- [**FaceBook**](https://www.facebook.com/SynchronousTeam)
- [**Donations**](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=5LY2Y46Q7DSWL&source=url)

## License & Copyright

© Kyonax • Synchronous Developers

Licensed under the [MIT License](LICENSE).
