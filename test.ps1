﻿# Script Execution must be enabled
# set-executionpolicy remotesigned
# use "Update-Help cmdlet" command to update help files in Powershell

$PSScriptRootPath = (Get-Item -Path $PSScriptRoot).FullName

# import util functions
Import-Module -DisableNameChecking $PSScriptRoot\modules\utils.psm1

# Ask for elevated permissions if required
RequireAdmin -Path $PSCommandPath -Args $args -WorkingDirectory $PSScriptRoot


# Load all tweak functions
Import-Module -DisableNameChecking $PSScriptRoot\modules\install_apps_tweaks.psm1
Import-Module -DisableNameChecking $PSScriptRootPath\modules\system_apps_tweaks.psm1
Import-Module -DisableNameChecking $PSScriptRootPath\modules\system_tweaks.psm1
Import-Module -DisableNameChecking $PSScriptRootPath\modules\network_tweaks.psm1
Import-Module -DisableNameChecking $PSScriptRootPath\modules\ui_tweaks.psm1 # Personal Part
# Invoke-Expression $_"UninstallUeslessBloat"
# Pin-App "照片" -unpin

DisableKeyboardRemoteAdd

# Is-AppInstalled -MatchAttr "DisplayName" -Regex "^Realtek Card Reader$"
# Install-App -FilePath "K:\Program\commonUse\drivers\nvdia_372.54_Win10_64_International\setup.exe" -MatchAttr "DisplayName" -Regex "^NVIDIxA 图形驱动程序" -Permission

WaitForKey