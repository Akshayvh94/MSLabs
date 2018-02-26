**The Contoso Story:**  

Contoso Coffee is a rapidly growing company that operates in many US states and internationally. They have built their business from the ground up and recently purchased a smaller company operating in several states where they previously had no presence. They have staff that are mobile, working with their customers on site and with suppliers in remote locations around the world.
 
Contoso Coffee's infrastructure is diverse. It is hosted on several different platforms and in different datacenters. The recent purchase of the smaller company has added to their infrastructure diversity. As their data is being moved to Azure, multiple opportunities exist to access data in various forms, from outside of Contoso Coffee's corporate network. With this new exposure, data security has become a higher priority for Contoso Coffee. 

Having completed a successful proof-of-concept for a new web-based line-of-business application, you will now create the production network for the application in Microsoft Azure.

The application uses a standard three-layer security zone model to house:
* The web servers in the **WFE** (DMZ) zone
* The application servers in the **APP** (Trusted) zone
* The database servers in the **DB** (Restricted) zone
 
Network security groups (NSGs) in Azure can be used to generate a list of access control list (ACL) rules that allow or deny network traffic to subnets, individual virtual machine instances, or even virtual network interface cards (NICs), similar to what used to be done on hardware firewalls, switches, and routers.

You will need to create a new virtual network in Azure with three subnets (one for each security zone) and use network security groups to control the ingress and egress traffic between each subnet.

At a high level, you need the NSG rules to:

* Allow Internet ingress and egress for WFE
* Allow WFE-APP ingress and egress
* Allow APP-DB ingress and egress
* Deny WFE-DB ingress and egress
* Deny APP-Internet ingress and egress
* Deny DB-Internet ingress and egress

**Capabilities or Components Used in this Story:**    
**Azure:** Network Security


