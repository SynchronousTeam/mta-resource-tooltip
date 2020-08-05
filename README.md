# Resource Tooltip

<div style="text-align:justify;display:inline-block">
<img src="https://github.com/SynchronousTeam/mta-resource-tooltip/blob/master/demo/image/Image_Resource_Tooltip.png">
<br>
<a href="https://github.com/SynchronousTeam/mta-resource-tooltip"style="text-decoration: none">
<img src="https://img.shields.io/github/license/SynchronousTeam/mta-resource-tooltip">
</a>
<a href="https://github.com/SynchronousTeam/mta-resource-tooltip"style="text-decoration: none">
<img src="https://img.shields.io/github/languages/count/SynchronousTeam/mta-resource-tooltip">
</a>
<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=5LY2Y46Q7DSWL&source=url"style="text-decoration: none">
<img src="https://img.shields.io/badge/Donate-PayPal-green.svg">
</a>
<a href="https://github.com/SynchronousTeam/mta-resource-tooltip"style="text-decoration: none">
<img src="https://img.shields.io/github/repo-size/SynchronousTeam/mta-resource-tooltip">
</a>
<a href="https://www.facebook.com/SynchronousTeam"style="text-decoration: none">
<img src="https://img.shields.io/badge/Synchronous-facebook-blue">
</a>
<a href="https://discord.gg/vSvgHvk"style="text-decoration: none">
<img src="https://img.shields.io/discord/623715606184722442?color=blueviolet&label=Server&logo=discord">
</a>
</div>

---

**MTA Resource Tooltip** is an Open-Source GUI/Lua Connection for a Multi Theft Auto server developed on **_HTML, CSS, JavaScript_ and _Lua_**. The principal function for this resource is **Receive Messages** from another Resources and shows them like `SUCCES - INFO - WARNING - ERROR` Tooltips into the Client Screen, all this stuff running on **Montgomery Country RP** a MTA Server developed by **Kyonax, Pixxa and Thrizz, members of Synchronous**.

_This resource is still on develop so many code lines are going to change._

## Download

If you want to download, learn and use this Resource follow the nex steps. **_(You can read, learn and share the code however you can't appropiatte it. If you are going to share the code or modify please give me Credits, more information in [License MIT](LICENSE))_**

> Create a Folder in the /Resources path of your Server, this name is going to be the Resource name. Now
> copy the Github path of this resource, and then clone the repository in your Resource Folder.

###### Via Console

```Console
C:\Users\Your_User\Your_Documents> mkdir resourceName
C:\Users\Your_User\Your_Documents\resourceName> git clone https://github.com/SynchronousTeam/mta-resource-tooltip.git
```

> Now put this current lines of code at the bottom of the mtaserver.conf File, changing the _"[tooltip]"_
> for your Current resource name.

###### \deathmatch\mtaserver.conf

```xml
<resource src="[tooltip]" startup="1" protected="0"/>
```

## How to Use

On the **meta.xml** file, the Resource exports a function that we can call from another Resource.

```lua
-- Where [tooltip] is the name of the Resource and showTooltip() the name of the Function
exports["[tooltip]"]:showTooltip(message,type_tooltip)
```

To use this correctly on another Resource you need to create a _`Client Event`_, and use this event into the new Resource **_(Make sure that the lua file on the meta.xml is call like a type="Client")_**.

```lua
-- Where resource Is the name of the new Resource, message is Any text that you want to
-- show and the type_tooltip is the Type of the Tooltip Message
addEvent("resource-tooltip-browser:show", true)
addEventHandler("resource-tooltip-browser:show", root, function(message, type_tooltip)
    resource_tooltip_type_send = exports["[tooltip]"]:showTooltip(message,type_tooltip)
end, true)
```

### Example

```lua
-- clientFile.lua
addEvent("serverFile-tooltip-browser:show", true)
addEventHandler("serverFile-tooltip-browser:show", root, function()
    mta_tooltip_type_send = exports["mta-resource-tooltip"]:showTooltip(message, type_tooltip)
end,true)

-- serverFile.lua
triggerClientEvent(client,"serverFile-tooltip-browser:show",client, "All the resource works Fine!", "SUCCES")
triggerClientEvent(client,"serveerFile-tooltip-browser:show",client,"Follow me on Twitter @Synk_Kyonax", "INFO")
```

<div>
<img src="https://github.com/SynchronousTeam/mta-resource-tooltip/blob/master/demo/image/Image_Tooltip_Lua.png">
<br>
</div>

Or **_If You are using JavaScript_**

```js
// Form.js
mta.triggerEvent(
  "serverFile-tooltip-browser:show",
  "Im Using JavaScript!!!",
  "WARNING"
);
```

<div>
<img src="https://github.com/SynchronousTeam/mta-resource-tooltip/blob/master/demo/image/Image_Tooltip_Js.png">
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

## Developers

**Synchronous Developers** are working on this repository, if you want know a little more about the team, you can follow them on their each social media.

###### Kyonax

- [**FaceBook**](https://www.facebook.com/MrKyonax)
- [**Twitter**](https://twitter.com/Synk_Kyo)
- [**Twitch**](https://www.twitch.tv/synk_kyonax)
- [**YouTube**](https://www.youtube.com/channel/UCOCGuDADwciaJfnCxWoYGHA)
- [**GitHub**](https://github.com/Kyonax)

## Support

We do our best on every single app, if you want to learn with us and **Support us** you can check out the links below.

###### Synchronous

- [**FaceBook**](https://www.facebook.com/SynchronousTeam)
- [**Donations**](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=5LY2Y46Q7DSWL&source=url)

## License & Copyright

© Kyonax • Synchronous Developers

Licensed under the [MIT License](LICENSE).
