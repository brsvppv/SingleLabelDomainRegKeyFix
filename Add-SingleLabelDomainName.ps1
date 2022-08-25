Function Add-SingleLabelDomain{
$IsAdmin = [Security.Principal.WindowsIdentity]::GetCurrent()
If ((New-Object Security.Principal.WindowsPrincipal $IsAdmin).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator) -eq $FALSE) {
    "`nERROR: You are NOT a local administrator.  Run this script after logging on with a local administrator account."
    # We are not running "as Administrator" 
    # ReLunch With Admin Rights

    # Create a new process object that starts PowerShell
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    # Specify the current script path and name as a parameter
    $newProcess.Arguments = $myInvocation.MyCommand.Definition;
    # Indicate that the process should be elevated
    $newProcess.Verb = "runas";

    # Start the new process
    [System.Diagnostics.Process]::Start($newProcess);

    # Exit from the current, unelevated, process
    exit
}
Write-Host "Select an Action:" -ForegroundColor Yellow
Write-Host "  Input 1 - To Create the- " -NoNewline ;Write-Host  "AllowSingleLabelDnsDomain" -ForegroundColor Cyan -NoNewline; Write-Host "-DWORD key" 
Write-Host "  Input 2 - To Change the value to 1 of the- " -NoNewLine; Write-Host "AllowSingleLabelDnsDomain" -ForegroundColor Magenta -NoNewline; Write-Host "-DWORD key" 
$ToPerform= (Read-Host Action)
try{
if($ToPerform -eq "1")
{
New-ItemProperty "hklm:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name "AllowSingleLabelDnsDomain" -Value 1 -PropertyType "DWord"
Write-Host "Registry Key has been creates with value 1 successfuly" -ForegroundColor Green
PAUSE
}
if($ToPerform -eq "2")
{
Set-ItemProperty "hklm:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -Name "AllowSingleLabelDnsDomain" -Value 1
Write-Host "Registry Key Value has been changed to 1 successfuly" -ForegroundColor Green
PAUSE
}
}
Catch
{
 Write-Host "Unable to make changes" -ForegroundColor Red
 PAUSE
}
}
Add-SingleLabelDomain