# Reviewing Service and Resource Health Outline

## Deep Analysis with Microsoft Azure Log Analytics

## Overview

Microsoft Azure is a multi-tenant, public cloud computing platform. It is designed for building, deploying, and managing applications and services through a global network of Microsoft-managed data centers. It provides SaaS (Software as a Service), PaaS (Platform as a Service), and IaaS (Infrastructure as a Service) and supports many different programming languages, tools, and frameworks, including both Microsoft and third-party software and systems.

In this scenario, we will be focusing on the basics of Azure Insight and Analytics. The concepts we will cover include Log Analytics and log searches. 

### Deep Analysis with Microsoft Azure Log Analytics

In this lab, we will work with Log Analytics to provide you with an understanding of how it can extend the monitoring tools available in Azure Monitor Center. We will also explore log search and its benefits to a comprehensive monitoring plan.
 
#### Log Analytics 

At the center of Log Analytics is the OMS repository which is hosted in the Azure cloud. Data is collected into the repository from connected sources by configuring data sources and adding solutions to your subscription. Data sources can include counters, logs, Application Insights, Agent Services for both on-premises and cloud assets, and SCOM management groups. Data sources and solutions will each create different record types that have their own set of properties but may still be analyzed together in queries to the repository. This allows you to use the same tools and methods to work with different kinds of data collected by different sources.
 
#### Log Search

At the core of Log Analytics is the log search feature which allows you to query any machine data from multiple sources within your environment. Solutions are also powered by log search to bring you metrics pivoted around a particular problem area.
 
On the Search page, you can create a query, and then when you search, you can filter the results by using facet controls. You can also create advanced queries to transform, filter, and report on your results. Search results can output to alerts, dashboard, Power BI, and exported reports. 

**Capabilities or components used in this scenario:** 

- **Azure:** 
    * Azure Log Analytics
    * Log Searches
	* OMS Workspace 