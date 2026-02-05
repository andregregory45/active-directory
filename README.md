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
<b>Important: DC-1 is configured with a static IP address to maintain consistent name resolution. This prevents authentication failures and ensures uninterrupted access to domain-joined resources (such as network shares and Group Policy Objects) that would occur if the domain controller's IP address unexpectedly changed.</b>

</p>
<br />

<p>
<img width="750" height="650" alt="image" src="https://github.com/user-attachments/assets/f91cd1bd-a62c-401b-adda-f633dae1ec0e" />
</p>
<p>
To confirm that Client-1 is using DC-1 as the DNS server, The "ping" command will be used to test connectivity.

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
