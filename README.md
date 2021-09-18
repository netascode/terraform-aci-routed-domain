<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/netascode/terraform-aci-routed-domain/actions/workflows/test.yml/badge.svg)](https://github.com/netascode/terraform-aci-routed-domain/actions/workflows/test.yml)

# Terraform ACI Routed Domain Module

Manages ACI Routed Domain

Location in GUI:
`Tenants` » `XXX`

## Examples

```hcl
module "aci_routed_domain" {
  source  = "netascode/routed-domain/aci"
  version = ">= 0.0.1"

  name                 = "RD1"
  vlan_pool            = "VP1"
  vlan_pool_allocation = "dynamic"
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aci"></a> [aci](#requirement\_aci) | >= 0.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aci"></a> [aci](#provider\_aci) | >= 0.2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Routed domain name. | `string` | n/a | yes |
| <a name="input_vlan_pool"></a> [vlan\_pool](#input\_vlan\_pool) | Vlan pool name. | `string` | n/a | yes |
| <a name="input_vlan_pool_allocation"></a> [vlan\_pool\_allocation](#input\_vlan\_pool\_allocation) | Vlan pool allocation mode. Choices: `static`, `dynamic`. | `string` | `"static"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dn"></a> [dn](#output\_dn) | Distinguished name of `l3extDomP` object. |
| <a name="output_name"></a> [name](#output\_name) | Routed domain name. |

## Resources

| Name | Type |
|------|------|
| [aci_rest.infraRsVlanNs](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
| [aci_rest.l3extDomP](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
<!-- END_TF_DOCS -->