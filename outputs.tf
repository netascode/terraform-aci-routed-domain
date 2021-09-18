output "dn" {
  value       = aci_rest.l3extDomP.id
  description = "Distinguished name of `l3extDomP` object."
}

output "name" {
  value       = aci_rest.l3extDomP.content.name
  description = "Routed domain name."
}
