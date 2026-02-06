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

- Windows Server 2025
- Windows 11 Pro, version 25H2

<h2>Setting Up Infrastructure for Active Directory</h2>

<p>
This environment consists of two virtual machines (VMs) within a unified virtual network. A Windows Server 2025 VM serves as the domain controller (DC-1), while a secondary VM running Windows 11 Pro serves as the client (Client-1). Client-1 is joined to DC-1's domain and routes all DNS traffic through DC-1.
</p>
<br />

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/473a72b4-2960-40fb-97a8-22b18bd125b4" />
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

- Enabled an Inbound Firewall Rule on DC-1 to allow ICMP Echo Requests (ping) rather than disabling the firewall entirely.
- Updated Client-1's DNS settings to point to DC-1 as the primary resolver.
- Executed "ipconfig /flushdns" on the client machine to clear any stale records.
- Confirmed name resolution by pinging DC-1 from Client-1 using the command "ping 10.0.0.4", verifying that the client could successfully reach the Domain Controller via its FQDN.

</p>
<br />

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/cd9faf34-6f25-47d3-ba96-96bb360d2440" />
</p>

<h2>Deployment and Configuration</h2>

<p>
<img src="https://i.imgur.com/DJmEXEB.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
</p>
<p>
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
</p>
<br />

<p>
<img src="https://i.imgur.com/DJmEXEB.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
</p>
<p>
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
</p>
<br />
