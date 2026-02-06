<p align="center">
<img src="https://cdn.worldvectorlogo.com/logos/active-directory-1.svg" alt="Microsoft Active Directory Logo"/>
</p>

<h1>Active Directory Deployment and Identity Management in Azure</h1>

This project demonstrates the implementation and administration of a cloud-based Active Directory environment, as well as identity and access management.

<h2>Environments, Technologies, and Languages Used</h2>

- Microsoft Azure (Virtual Machines/Compute)
- Remote Desktop Connection
- Active Directory Domain Services
- PowerShell

<h2>Operating Systems Used</h2>

- Windows Server 2022
- Windows 11 Pro, version 25H2

<h2>Setting Up Infrastructure for Active Directory</h2>

<p>
This environment consists of two virtual machines (VMs) within a unified virtual network. A Windows Server 2022 VM serves as the domain controller (DC-1), while a secondary VM running Windows 11 Pro serves as the client (Client-1). Client-1 is joined to DC-1's domain and routes all DNS traffic through DC-1. The final configuration will look like this:
</p>
<br />

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/7f46d88d-3412-4b20-8e49-ab4cd5ddc66f" />
</p>

<p>
DC-1 is configured with a static IP address to maintain domain stability. This prevents authentication failures and ensures uninterrupted access to domain-joined resources (such as network shares and Group Policy Objects) that would occur if the domain controller's IP address changed via DHCP renewal.

</p>
<br />

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/f91cd1bd-a62c-401b-adda-f633dae1ec0e" />
</p>

<p>
To verify connectivity while maintaining a secure environment, the following configuration was implemented:

- Enabled Inbound Firewall Rules on DC-1 to allow ICMPv4 Echo Requests (ping) rather than disabling the firewall entirely.
- Updated Client-1's DNS settings in Azure to point to DC-1 as the primary resolver.
- Executed "ipconfig /flushdns" on Client-1 to clear any stale records.
- Verified connectivity by pinging DC-1 from Client-1 using the command "ping 10.0.0.4", confirming that the client can successfully reach the domain controller.
- Verified DNS connectivity by executing "ipconfig /all" on Client-1, confirming that the client is using the domain controller as the DNS server.
</p>
<br />

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/858d7ed3-afea-43bc-8506-d8f2e5c21c50" />
</p>

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/d104012c-187a-49a9-a3af-457dd83e9d43" />
</p>

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/adb96a41-c3a4-44eb-97b4-5e8fe24bafde" />
</p>

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/fb7863f1-a7ef-4ce2-a476-252da9fa77df" />
</p>

<h2>Deployment and Configuration</h2>

<p>
Install Active Directory Domain Services (AD DS) on DC-1 and promote it to a domain controller. Add a new forest, then specify the root domain name. "mydomain.com" is used as an example domain.

<b>Note on Authentication Syntax: In some cases, the domain controller will default to domain authentication when attempting to log in to it (as they lack a local SAM database). However, when logging into the domain as a client, always use the Down-Level Logon Name (MYDOMAIN\labuser) or the User Principal Name (labuser@mydomain.com). This ensures explicit authentication and prevents login failures with local accounts.</b>
</p>
<br />

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/3a157d1c-bffe-4aeb-9ad8-b96eecee7aea" />
</p>

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/1ea3e6e3-5462-47bc-980d-c2ee1d3f7460" />
</p>

<p>
Create "_EMPLOYEES" and "_ADMINS" Organizational Units (OUs) to separate standard users from administrator accounts. Create a new user "example_admin" within the "_ADMINS" OU, then assign "example_admin" to the Domain Admins security group. This enables the account to perform domain-wide administrative tasks, such as user provisioning and Group Policy management, while maintaining an audit trail separate from the built-in administrator account. 
  
Log out of the local administrator account on DC-1, then log back in as “MYDOMAIN\example_admin”. This account will be used for the remainder of this demonstration.
</p>
<br />

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/639970de-1e4e-422b-8691-4347871c0d6d" />
</p>

<p>
<img width="476" height="98" alt="image" src="https://github.com/user-attachments/assets/7f152140-840e-4a4b-a776-2e481a2322ab" />
</p>

<p>
Login to Client-1 as the original local administrator account and join it to the "mydomain.com" domain. Since Client-1 is using DC-1 as the DNS server, Client-1 is able to locate the domain controller for "mydomain.com". Provide the "MYDOMAIN\example_admin" credentials when prompted by the Windows Security dialog to authorize the join.
</p>
<br />

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/d3afafe0-4f4d-4328-b3c3-6bd6d374b430" />
</p>

<p>
Confirm that Client-1 appeared in the "Computers" container in Active Directory Users and Computers on DC-1. Create a new OU named "_CLIENTS", then migrate Client-1 from the "Computers" container to the "_CLIENTS" OU. This allows Group Policy Objects (GPOs) to apply specifically to Client-1 (for the purposes of this project), since GPOs cannot be linked to containers.
</p>
<br />

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/824b9102-bbde-4268-820d-bb845efa70e7" />
</p>

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/28466239-5b85-42fe-891a-6f70f80fcb8d" />
</p>

<h2>Bulk User Provisioning with PowerShell</h2>

<p>
Log in to Client-1 as "MYDOMAIN\example_admin" and allow "Domain Users" to access Remote Desktop. This allows all domain users (later created with a PowerShell script) to log in to Client-1 via RDP.

<b>Note on Security and Scalability: While this is done for the purposes of demonstration, in a production environment, this would be restricted to specific authorized security groups via Restricted Groups or User Rights Assignment in a GPO.</b>
</p>
<br />

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/34ddec01-9671-4cdf-9f7a-e67ec37db8a8" />
</p>

<p>
To simulate a corporate environment, I leveraged a community-developed PowerShell script for automatic bulk user creation on the DC, and modified the script to maintain DC stability. I also identified and fixed a variable typo ($fisrtName) in the script to ensure correct attribute mapping for the "-GivenName" field.

View the full script file [here.](https://github.com/andregregory45/active-directory/blob/main/Bulk-User-Provisioning.ps1)

<b>Note on Security: In the PowerShell script, passwords are set to never expire. In a production environment, "-ChangePasswordAtLogon $true" would be configured to align with security best practices.</b>

When the script has finished executing, open Active Directory Users and Computers and observe the accounts in the "_EMPLOYEES" OU. Log in to Client-1 with one of the accounts using "MYDOMAIN\username" or "username@mydomain.com" (take note of the password in the script).

</p>
<br />

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/d8350740-fcb0-4203-b86a-5e94ca4e3662" />
</p>

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/10177283-1734-4eb0-9a49-c0099e6f7f81" />
</p>

<p>
<img width="559" height="363" alt="image" src="https://github.com/user-attachments/assets/a535b7d3-0585-45b8-9555-4b52666e188a" />
</p>

<h2>Group Policy and Account Management</h2>

<p>
When the

<h2>References</h2>

- Original Source of Bulk User Creation Script: https://github.com/joshmadakor1/AD_PS/blob/master/Generate-Names-Create-Users.ps1
