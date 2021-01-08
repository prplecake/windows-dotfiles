# windows-dotfiles

"dotfiles" for Windows. Plus some other useful things.

## Custom Functions

### Get Public IP Address

```powershell
Get-IP
```

Returns your public IP address and nothing else.

### List empty directories

```powershell
List-EmptyDirs
```

Lists all directories under the current working directory that is
completely empty; i.e.: no folders or files. At this time this function
accepts no parameters.

### Monitor an HTTP Host

```powershell
Monitor-HttpHost -Uri <string> [-SleepSeconds <Int32>]
```

#### Parameters

`-Uri`

Specifies a URI to monitor.

* **Type:** String
* **Position:** Named
* **Default value:** *None*
* **Accept pipeline input:** False
* **Accept wildcard characters:** False

`-SleepSeconds`

Specifies the number of seconds to wait before trying again. **Default:
15 seconds**.

* **Type:** Int32
* **Position:** Named
* **Default value:** 15
* **Accept pipeline input:** False
* **Accept wildcard characters:** False

### See why your computer last shutdown/restart

```powershell
Get-ShutdownReason
```

Example output:
```
Message: The process C:\WINDOWS\system32\svchost.exe (DELL-P7520-1) has initiated the restart of computer DELL-P7520-1 on behalf of user NT AUTHORITY\SYSTEM for the following reason: Operating System: Service pack (Planned)
 Reason Code: 0x80020010
 Shutdown Type: restart
 Comment:
 Date: 2020-10-30 19:43:02
```

### Add Sublime {Text 3,Merge} Context Menu Items

![Sublime Context Menu Items](https://drop.jrgnsn.net/oqlX.png)

```powershell
Add-SublimeMergeContextMenu
Add-SublimeTextContextMenu
```

To run both at once:

```powershell
Add-SublimeContextMenus
```
