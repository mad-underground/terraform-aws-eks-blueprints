variable "eks_cluster" {
  type = object({
    version = string
    id = string
    vpc_id = string
    private_subnet_ids = optional(list(string), [])
    public_subnet_ids = optional(list(string), [])
    node_security_group_ids = list(string)
  })
}

variable "managed_node_groups" {
  description = "Managed node groups configuration"
  type        = any
  default     = {}
}

variable "self_managed_node_groups" {
  description = "Self-managed node groups configuration"
  type        = any
  default     = {}
}

variable "tags" {
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
  type        = map(string)
  default     = {}
}