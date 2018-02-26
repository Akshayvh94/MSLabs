# Understanding Azure Resource Manager Templates

## Overview
This lab will guide the user through the structure and use of Azure Resource Manager (ARM) templates. The lab will walk the user through the process of loading an ARM template into Visual Studio, explain various sections of the template, and show the user how to run a simple pre-configured template in Azure.

### Lab Goals
- Understand ARM template structure and schema, including:
    - Parameters
    - Variables
    - Resources
- Understand PowerShell-driven Deployment
- Deploy PaaS resources via an ARM template
- Deploy IaaS resources via an ARM template

#### Overview
ARM templates have a core structure which includes various components. The components include:
- **Schema** - All templates require an ARM schema reference in order for ARM to validate the template. ARM template schema's are hosted at https://github.com/Azure/azure-resource-manager-schemas.git.
- **Content version** - This component is used by the developer to keep track of which version of the template is current.
- **Parameters** - Parameters are pieces of information which ARM needs to know about. Examples are names of VM's, regions, resource groups, etc.
- **Variables** - Variables contain details which ARM can determine on its own, for example resource ID's of resources created in Azure.
- **Resources** - The Resources component is the main component of the ARM template and contains all the resources that the template will create and deploy. 
- **Outputs** - Outputs are information you want to pass from the template to other applications such as PowerShell.

ARM template parameters have a specified structure:
- **name** - The name of the parameter and how it is referred to in other components of the ARM template.
- **type** - Defines the type of value for the parameter (for example, string, integer, array, etc.).
- **defaultValue** - The value to be used if no value has been provided.
- **allowedValues** - A list of values that are allowed as the value property.
- **Metadata** - A description of what this parameter is used for in the ARM template.

ARM template variables are optional pieces of information that are part of the ARM template and can be determine by ARM during the deployment process. 

ARM template resources have the same structure:
- **Type** - Defines the type of resource that will be created.
- **Name** - Identifies the name of resource.
- **apiVersion** - Identifies which version of the API should be used during the creation of this resource.
- **Location** - The geographical location where the resource is created.
- **Properties** - The list of properties required by the ARM template to create the resource.

**Capabilities or components used in this scenario:** 
- PowerShell ISE
- PaaS Resource Deployment 
- IaaS Resource Deployment 
- Azure Portal