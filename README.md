<p align="center">
<img src="https://cdn.worldvectorlogo.com/logos/active-directory-1.svg" alt="Microsoft Active Directory Logo"/>
</p>

<h1>Active Directory Deployment and Administration in Azure</h1>

This project outlines the implementation of on-premises Active Directory within Azure virtual machines.<br />


<h2>Environments and Technologies Used</h2>

- Microsoft Azure (Virtual Machines/Compute)
- Remote Desktop Connection
- Active Directory Domain Services
- PowerShell

<h2>Operating Systems Used</h2>

- Windows Server 2025
- Windows 11 Pro (25H2)

<h2>Setting Up Infrastructure for Active Directory</h2>

Two virtual machines (VMs) will be created in the same virtual network (VNet). One VM will be a Domain Controller (DC), and the other VM will be a client machine. The client will be joined to the DC's domain (mydomain.com), and the DNS settings will be changed on the client machine to use the DC as its DNS server. 

<b>Important: The DC's private IP address should be set to static, because the client machine needs to be able to find the DC on the network using its domain.</b>

<h2>Deployment and Configuration Steps</h2>

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

<p>
<img src="https://i.imgur.com/DJmEXEB.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
</p>
<p>
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
</p>
<br />
