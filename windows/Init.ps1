# Author: Mondo <mondogao@gmail.com>
# Version: 0.1.3
#
# Initiate an environment for developer on Windows
#
#
# Run this script in Powershell by Administrator
# Run `Set-ExecutionPolicy Bypass -Scope Process -Force;` before running this script

#### Settings ####

# Chocolatey packages needed to be installed
# It's recommended to put larger-size package to the end of the array.
$skipChoco = $false
$chocoPackages = @("googlechrome", "git.install", "node", "yarn", "python2", "vscode", "cmder")

$skipYarn = $false
$yarnGlobalPackages = @("whistle", "tnpm")
$npmRegistry = "http://registry.npm.alibaba-inc.com/"

$skipNvm = $false
$nodeVersion = "8.9.2"

#### Functions ####

function Check-Command-Exist([string]$cmd)
{
    return (Get-Command $cmd -ErrorAction SilentlyContinue) -ne $null
}

function Check-And-Install([string]$name)
{
    $result = choco search $name -lo
    if ($result.Count -lt 3) {
        choco install $name -y
    } else {
        Write-Output "$name has already installed"
    }
}

function Refresh-Path {
    refreshenv
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
}

function Check-Yarn-Pkg-Install([string]$name)
{
    $result = (ls ((yarn global dir) + "\node_modules") | Select-String -Pattern $name -List -SimpleMatch)
    return ($result.Count -gt 0);
}

#### Main ####

Write-Output "Starting initiating process..."

# Install chocolatey if not installed
if (-Not (Check-Command-Exist "choco")) 
{ 
    Write-Output "Installing chocolatey..."

    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));

    Refresh-Path
}


if (! $skipChoco)
{
    Write-Output "Install choco packages..."

    $i = 0
    foreach ($pkgName in $chocoPackages)
    {
        Write-Host ($i + 1) "/" $chocoPackages.Count: $pkgName
        Check-And-Install $pkgName
        $i++
    }

    Refresh-Path
}

Write-Output "Init node enviroment..."

if (! $skipYarn) {
    yarn config set registry $npmRegistry

    $i = 0
    foreach ($pkgName in $yarnGlobalPackages)
    {
        Write-Host ($i + 1) "/" $yarnGlobalPackages.Count: $pkgName
        if (-Not (Check-Yarn-Pkg-Install($pkgName)))
        {
            yarn global add $pkgName
        }
        else
        {
            Write-Output "$pkgName has already installed"
        }
        $i++
    }
}

# Manual install nvm
if (! $skipNvm)
{
    $decision = 0
    if (! (Check-Command-Exist nvm)) {
        $message  = 'Please download and install nvm by your own because unpredicable network'
        $question = 'Are you sure nvm has been installed?'

        $choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
        $choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Exit'))

        [System.Diagnostics.Process]::Start("https://github.com/coreybutler/nvm-windows/releases")
        $decision = $Host.UI.PromptForChoice($message, $question, $choices, 0)
    }

    if (($decision -eq 0) -and (Check-Command-Exist nvm))
    {
        Write-Host 'Install node lts...'
        Refresh-Path
        
        nvm install $nodeVersion
        nvm use $nodeVersion

    }
    else {
        Write-Host 'Failed to install nvm, please restart powershell to retry'
    }
}

# Install windows-build-tools
if (Check-Command-Exist npm)
{
    npm --vs2015 install --global windows-build-tools
}

Write-Output "Kudos to you!"