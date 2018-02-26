# Reviewing Service and Resource Health Outline
 
## Overview

Microsoft Azure is a multi-tenant, public cloud computing platform. It is designed for building, deploying, and managing applications and services through a global network of Microsoft-managed data centers. It provides SaaS (Software as a Service), PaaS (Platform as a Service), and IaaS (Infrastructure as a Service) and supports many different programming languages, tools, and frameworks, including both Microsoft and third-party software and systems.

In this scenario, we will be focusing on the basics of Azure IaaS Managing and Monitoring to monitor your Azure resources. We will explore ways to determine Azure Service Status, utilize Azure Monitor tools, review activity and diagnostic logs, and review services available through Application Insights. 
 
#### Monitoring - The big picture
Azure Infrastructure as a Service offers a means to manage all of your assets to make it easier to look at the big picture of your IT infrastructure and identify trends. 

Within your Azure IaaS subscription, there are elements of your ecosystem that produce telemetry data. Looking at the big picture using the tools in Azure allows you to gather data and metrics from activity logs, virtual machines, guest operating systems, applications, and diagnostic logs. You can then use the logs and metrics generated to:  

* Visualize by creating charts and graphs and views in dashboards of the metrics coming out of your VMs
* Archive diagnostics and log data for compliance purposes
* Query telemetry data using a variety of tools
* Route data to notification service
* Automate remediation efforts based on metrics

**Capabilities or components used in this scenario:** 

- **Azure:** 
    * Azure Status Dashboard
    * Azure VM Diagnostics
    * Azure VM Metrics
    * Azure Monitor Center
	* Application Insights 