terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name                 = "RD1"
  vlan_pool            = "VP1"
  vlan_pool_allocation = "dynamic"
}

data "aci_rest" "l3extDomP" {
  dn = "uni/l3dom-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "l3extDomP" {
  component = "l3extDomP"

  equal "name" {
    description = "name"
    got         = data.aci_rest.l3extDomP.content.name
    want        = module.main.name
  }
}

data "aci_rest" "infraRsVlanNs" {
  dn = "${data.aci_rest.l3extDomP.id}/rsvlanNs"

  depends_on = [module.main]
}

resource "test_assertions" "infraRsVlanNs" {
  component = "infraRsVlanNs"

  equal "tDn" {
    description = "tDn"
    got         = data.aci_rest.infraRsVlanNs.content.tDn
    want        = "uni/infra/vlanns-[VP1]-dynamic"
  }
}
