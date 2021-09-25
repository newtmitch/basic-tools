# Windows / WSL2 Installation Notes

To install this stack on a Windows/WSL2-based Ubuntu VM, there are a few extra manual steps, roughly outlined here:

* Copy the fonts in an explorer window from `\\wsl$\Ubuntu\home\mitch\.fonts` (change home directory as needed) to a local directory on the desktop, right click all those fonts, and select `Install`. I suggest filtering for the "Windows compatible" versions and installing all those to get the full set. Then you can change the font for the given VM in Windows Terminal.
* You might want to also update the starting location for the Ubuntu shell in the Windows Terminal preferences.
* If you need to quickly get to the WSL Ubuntu home, you can go to `\\wsl$\Ubuntu\home\mitch` in an explorer window. Or from the Ubuntu terminal, type `explorer.exe .` to open a new explorer window at that location.


# Windows on Parallels

I've seen some oddness with installing this stack on Windows parallels while testing and adjusting this for Windows.

* If you revert a snapshot and try again, the clock on the Ubuntu WSL VM appears to not sync properly. In order to force that, restart the VM kernel, running as a Windows service. Open a Powershell and run: `get-service -Name LxssManager |restart-service`

