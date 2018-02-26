# Reviewing Service and Resource Health

## Virtual Machine Resource Level Monitoring

## Overview

Microsoft Azure is a multi-tenant, public cloud computing platform. It is designed for building, deploying, and managing applications and services through a global network of Microsoft-managed datacenters. It provides SaaS (Software as a Service), PaaS (Platform as a Service), and IaaS (Infrastructure as a Service), and supports many different programming languages, tools, and frameworks, including both Microsoft and third-party software and systems.

In this scenario, you will be focusing on the basics of Azure IaaS Managing and Monitoring to monitor virtual machines. You will get a broad overview of monitoring and reviewing Insight and Analytics solutions in Azure. Concepts covered include Operations Management Solution (OMS) Workspaces, onboarding virtual machines and apps, Service Map, and Network Performance Monitor. 

### **Azure Monitoring Mindset**

Azure is part of your IT ecosystem which allows you to manage resources as a group, rather than individual instances. Azure can help monitor both on-premises and cloud resources, and should be thought of in terms of DevOps and large-scale infrastructure management.

* How to use the tools
* What is available in Azure
* What to look for
* How to address issues

Instance-level monitoring allows you to look at the performance of individual virtual machines. Instance-level monitoring includes metrics, alerts rules that can be configured to help monitor performance, diagnostic settings, and diagrams to help you monitor an individual VM. However, instance-level monitoring is not an appropriate tool for large-scale monitoring due to its limited view of a single instance of a resource.

### Azure Monitor

**Azure Monitor** provides an aggregated view of monitoring activities across all resources in Azure. **Azure Management Solutions** are the gateways to aggregating data and bringing them into Azure for comprehensive monitoring. Azure offers support for both Microsoft and third-party management solutions. 

**Capabilities or components used in this scenario:** 

- **Azure:** 
    * Azure Log Analytics
    * OMS workspace
    * Azure Management Solutions
    * Service Map