# SingleLabelDomainRegKeyFix

**Fix for "Unable to Join Single-Label Domain" via Registry Key Script**

This PowerShell script helps resolve issues when joining a domain with a **single-label DNS name** by configuring the necessary registry key.

---

## ✅ How to Use

1. **Run PowerShell as Administrator**.
2. Copy and paste the following one-liner into the PowerShell window:

# run in powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iwr 'https://raw.githubusercontent.com/brsvppv/SingleLabelDomainRegKeyFix/main/Add-SingleLabelDomainName.ps1' -UseBasicParsing | iex

📋 Script Options (When Prompted)
You’ll be prompted to choose an action:

1 – Create the AllowSingleLabelDnsDomain registry key

2 – Set the value of AllowSingleLabelDnsDomain to 1 (enable single-label domain joining)

🧱 Registry Key Details
The script modifies the following registry key:
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters]
"AllowSingleLabelDnsDomain"=dword:00000001

![image](https://user-images.githubusercontent.com/65204241/186684290-aad80904-86be-4235-9a6d-1650cd52544c.png)


