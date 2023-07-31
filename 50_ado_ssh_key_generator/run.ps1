<#
.SYNOPSIS
Generates SSH Key, emails and opens ADO

.DESCRIPTION
This script is used where GitHub is using SSH Key authentication per pipeline.
Script will create key/pub, open an outlook email with public key, also open edge
to a given ADO project so it can be added to Variable Group.
Stef Harrington-Palmer 2023

.EXAMPLE
PS> .\run.ps1 -working_dir "C:\Users\stef\pipeline_keys" -email "stef@bear.army" -ado_base "https://dev.azure.com/ExampleProject"

#>

param (
    [string]$repo_name,
    [string]$working_dir,
    [string]$outlook_exe = "C:\Program Files (x86)\Microsoft Office\Office16\outlook.exe",
    [string]$edge_exe = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe",
    [string]$email,
    [string]$ado_base,
    [bool]$skip_browser_open = $false,
    [bool]$skip_email_compose = $false
)

Set-Location $working_dir
New-Item -ItemType Directory $repo_name
Set-Location $repo_name
ssh-keygen -t ed25519 -f .\id_pipeline_token -P '""'
$public_key = Get-Content .\id_pipeline_token.pub

if ($skip_email_compose -ne $true) {
    & $outlook_exe /c ipm.note /m "$email&subject=$repo_name&body=https://github.com/settings/keys%0D%0A%0D%0A$public_key%0D%0A%0D%0ADO NOT FORGET TO AUTH ORG ON KEY"
}

if ($skip_browser_open -ne $true) {
    $ado_full = $ado_base + "$repo_name/_library?itemType=VariableGroups"
    Set-Clipboard -Value $public_key
    & $edge_exe $ado_full
}

