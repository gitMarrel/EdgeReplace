# EdgeReplace
EdgeReplace is a simple Batch-Script that will redirect calls to MS Edge to a different browser.
## Usage Instructions
1) Edit the start-command found near the end of edge_replace.bat to point to your default browser.
2) Place the edited edge_replace.bat somewhere on your drive, where it's not gonna get lost (e.g. C:\edge_replace.bat)
3) Open the Registry Editor (regedit) and go to the following path:
```
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\
```
4) If a key `msedge.exe` is present, open it. If not, create one and open it.
5) In the right panel, create a new String called `Debugger` and assign it the path to your edge_replace.bat-file (in this case: `"C:\edge_replace.bat"`. Please note the quotes around the path!)
6) That's it. everything should now open in the browser you entered in step 1. To revert everything back to how it was before, simply delete the `Debugger`-entry created in step 5.
