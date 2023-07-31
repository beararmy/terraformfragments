Import-Module International

#Problem 1, Locale to GB from US
Set-Culture en-GB
Set-WinSystemLocale en-GB
Set-WinHomeLocation -GeoId 0xF2
Set-WinUserLanguageList en-GB -Force
tzutil /s "GMT Standard Time"

#Problem 2, event log overflows
$contentToAdd = @"
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog]

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System]
"Retention" = "0"

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application]
"Retention" = "0"

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security]
"Retention" = "0"
"@
Add-Content "reg.reg" $contentToAdd
reg import reg.reg

#Problem 3, Default new user accounts setting to "United States" and "English(United States)"
# Cannot be completed in code >:(

#Ok, we're done
Restart-Computer