## Getting Started with Azure Insight and Analytics

### Using Log Analytics and Log Search

#### Experience A - Getting Started with Log Search

**What can you do with log search in Azure?**

There are a variety of ways that log search can help you monitor and manage your cloud resources. You can perform direct searches across your subscription, save and recall searches that are needed regularly, and view documentation of the searches right in the portal's search window.   

1. [Click here to open the Azure Portal](https://portal.azure.com) and maximize the browser window

1. In the **Email or phone** field, enter **<inject key="AzureAdUserEmail"/>**

1. Click **Next**

1. In the **Password** field, enter **<inject key="AzureAdUserPassword"/>**

1. Click **Sign in**

1. You _may_ encounter a popup entitled **Stay signed in?** with buttons for **No** and **Yes** - Choose **No**

1. You may encounter a **Welcome to Microsoft Azure** popup window with buttons for **Start Tour** and **Maybe Later** - choose **Maybe Later**

1. In the **Search resources** box near the top of the screen, enter **log** 

1. In the **search results**, click **Log Analytics**

1. On the **Log Analytics** blade, click the **SWMIAAS-OMS** workspace in the list

1. On the **SWMIAAS-OMS** blade, click the **Log Search** tile under **Management** in the right pane

1. On the **Log Search** blade, click **Usage** 

	> **Note:** The Query screen has a variety of tools to help you search for the exact data you need to find. As you are typing in the query expression editor, you will see a list of suggested search terms as well as saved searches or previous queries, providing you with interactive assistance in developing effective log search queries. 

1. Click the **Data based on last 1 day** dropdown box

1. Change the **SCOPE BY:** value to **6 HOURS** and click **OK**

    > **Note:** Date conflicts may cause no data to be returned. As you are changing date ranges in Log search queries, make sure the custom time span does not conflict with the time span from the original query. 

1. On the **Log Search** blade in the **timeline** bar graph in the left pane, click any of the blue vertical bars to drill down to activities that occurred during that hour

1. On the right side of the **Usage query string** in the right pane, click the **X** to return to the main **Log Search** page

1. Under **A few more queries to try**, click **All collected data**

1. On the **Log Search** blade, click the **Data based on last 1 day** dropdown box in the left pane

1. Change the **SCOPE BY:** value to **6 HOURS** and click **OK**

1. In the **TYPE** list below the bar graph, click on **[+] More**

1. Scroll through the **TYPE** list to review all the different data types available

1. In the **TYPE** list, check the box next to **ProtectionStatus**

1. Click **Apply** at the bottom of the **Type** list

1. In the **timeline** bar graph above the **TYPE** list, click the **vertical bar on the far right** to view data for the last hour

1. In the **Results** list in the right pane, click **Table** to switch the log search results to table view, then click **List** to return to the list view

1. Click **Refresh** near the top left of the screen to return to the main **Log Search** page

	> **Note:** As you have seen through these sample queries, Microsoft Azure provides support for a wide variety of log search queries to make it easy to find and act on performance issues in your IT ecosystem. Searches can also be saved to be executed at a later time.

#### Experience B - Viewing and Interpreting Results

1. Scroll left to return to the **SWMIAAS-OMS Log Analytics** blade

1. Under the **GENERAL** section in the left pane, click **Solutions**

1. Click **AlertManagement(swmiaas-oms)** in the solutions list in the right pane

1. On the **AlertManagement(swmiaas-oms)** blade, click the **Alert Management OMS Portal** tile under **Summary** in the right pane

	> **Note:** If you see a window says **This browser is in compatibility mode...** click on **Continue using this browser** 

1. In the **Microsoft Operations Management Suite** portal, click the **System Update Assessment** tile

1. In the **Windows Updates** tile under **MISSING UPDATES**, click the slice of the pie chart that corresponds to **SECURITY UPDATES**

1. On the **Log Search** blade, click the **Alert** icon near the top of the blade

	> **Note:** Other options available for analyzing and monitoring data in the **OMS Portal** include **Export** (to a .csv file), **PowerBI** (export for use in PowerBI), or **Save** (to save a query for later use).  

1. On the **Add Alert Rule** page in the **Name** field under **General** on the left side of the page, enter **Missing Windows security updates**

1. Note that the **Search query** field below the **Description** and **Severity** fields is already populated with a search query

1. In the **Time window** field below the **Search query** field, change the setting to **2 Hours**

1. In the **Number of results** field below the **Schedule** section, choose **Greater than 1**

	> **Note:** Under the **Actions** section, you can configure **Email notification**, **Webhook*, **Runbook**, and/or **ITSM Actions**. OMS will prompt you for the necessary information for any notification actions that you choose to enable

1. Click **Save** near the bottom left of the **Add Alert Rule** page 

	> **Note:** More information about how to find data using log searches can be found on [Microsoft.com](https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-log-searches)
