**The Contoso Story:** 
 
Contoso Coffee is a rapidly growing company that operates in many US states and internationally. They have built their business from the ground up and recently purchased a smaller company operating in several states where they previously had no presence. They have staff that are mobile, working with their customers on site and with suppliers in remote locations around the world.
 
Contoso Coffee's infrastructure is diverse. They have selected Azure as the primary provider for their infrastructure services due to the breadth and depth of available content. As many of their resources are moving to Azure, there are multiple opportunities to access data in various forms, and from outside of Contoso Coffee's corporate network. With this new exposure, data security has become a higher priority for Contoso Coffee. 

One of Contoso Coffee's main competitors recently had a data breach after their mobile app platform was compromised due to a vulnerability in their IaaS provider's customer portal. This gave external parties access to virtual disks that should have been encrypted.

Contoso Coffee does not want to experience a similar breach. Their CIO wants to add an additional layer of security. They have asked you to implement **Azure Disk Encryption** to help protect them in the event that external parties are able to gain unauthorized access to their virtual disks. 
 
   >Azure Disk Encryption leverages the industry standard **BitLocker** feature of Windows and the **DM-Crypt** feature of Linux to provide volume encryption for the operating system and data disks. The solution is integrated with **Azure Key Vault** to help you control and manage the disk encryption keys and shared secret values in your key vault subscription, while ensuring that all data at rest in the virtual machine disks is encrypted in your Azure storage.

**Capabilities or Components Used in this Story:**    
**Azure:** VM Disk Encryption


