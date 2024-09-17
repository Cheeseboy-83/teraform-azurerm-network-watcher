# Overview
This module builds a network watcher with the required tags imbedded.

## Requirements
No requirements

## Providers
| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_watcher.nw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Network Watcher Name | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource_group_name](#input\_resource_group_name) | Resource Group Name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the Resource Group should exist | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `list` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |

## Versions

#### ***This module was previously tested with the below version for Terraform and AzureRM

| Name | Version |
|------|---------|
|Terraform | 1.9.5 |
|Azurerm | 3.109.0 |

### How to use

Simply copy the code below 

```
module "network-watcher" {
  source  = "app.terraform.io/cheeseboy/network-watcher/azurerm"
  version = "0.1.0"                                                    # replace with latest/desired version
  for_each = { for key, value in var.resource_groups : key => value }

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  tags                = merge(var.required_tags, each.value.tags)
}
```

You must also include the following variable declaration in your `variables.tf`:

```
variable "network_watchers" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    tags                = optional(map(string))
  }))
  description = "Resource groups in the deployment"
}
```

This will allow the module to consume the variable properly. You must also define the variable in your `network-watchers.tfvars` file:
```
network_watchers = {
  network_watcher_0 = {
    name                = "nw_0_name"
    resource_group_name = "nw_0_rg_name"
    location            = "nw_0_location"
    tags = {
      key0 = "value0"
      key1 = "value1"
    }
  }
}
```
