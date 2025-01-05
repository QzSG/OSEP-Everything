# AMSI bypass
## Beau's lil two step

To bypass AMSI I would run runall.ps1 which runs 1.txt and 2.txt and then a .ps1 of your choice in this case 
https://github.com/chvancooten/OSEP-Code-Snippets/blob/main/Simple%20Shellcode%20Runner/Simple%20Shellcode%20Runner.ps1 which I renamed to shellcoderunner.ps1.
It has it's own AMSI bypass but my "lil two step" as I call it, works on current versions of windows at least as of time of writing. 

### Host with gup
https://github.com/beauknowstech/gup
Or `python3 -m http.server` but I like gup better. Obviously. I made it to be better.