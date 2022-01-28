resource "aci_rest_managed" "l3extDomP" {
  dn         = "uni/l3dom-${var.name}"
  class_name = "l3extDomP"
  content = {
    name = var.name
  }
}

resource "aci_rest_managed" "infraRsVlanNs" {
  dn         = "${aci_rest_managed.l3extDomP.dn}/rsvlanNs"
  class_name = "infraRsVlanNs"
  content = {
    tDn = "uni/infra/vlanns-[${var.vlan_pool}]-${var.vlan_pool_allocation}"
  }
}
