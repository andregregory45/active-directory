<p align="center">
<img src="https://cdn.worldvectorlogo.com/logos/active-directory-1.svg" alt="Microsoft Active Directory Logo"/>
</p>

<h1>Active Directory Deployment and Administration in Azure</h1>

This project demonstrates the implementation and administration of an Active Directory environment within Azure virtual machines.

<h2>Environments and Technologies Used</h2>

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
</p>

<b>Note on Authentication Syntax: In some cases, the domain controller will default to domain authentication when attempting to log in to it (as they lack a local SAM database). However, when logging into the domain as a client, always use the Down-Level Logon Name (MYDOMAIN\labuser) or the User Principal Name (labuser@mydomain.com). This ensures explicit authentication and prevents unintended login attempts with local accounts.

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/3a157d1c-bffe-4aeb-9ad8-b96eecee7aea" />
</p>

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/1ea3e6e3-5462-47bc-980d-c2ee1d3f7460" />
</p>

<p>
Lorem ipsum...
</p>
<br />

<p>
<img src="https://i.imgur.com/DJmEXEB.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
</p>

<p>
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
</p>
<br />
