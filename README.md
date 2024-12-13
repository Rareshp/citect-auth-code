# citectAuthCode 

To use this script, open Powershell and run this command:

```ps1
irm https://raw.githubusercontent.com/Rareshp/citect-auth-code/refs/heads/main/citectAuthCode.ps1 | iex; citectAuthCode -Key "48######"
```

You must change the Key parameter to your key.

The function will print, but also copy to clipboard, the PlantSCADA / Citect authorization code which you can paste in CiUSAFE.
