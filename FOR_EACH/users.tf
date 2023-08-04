resource "aws_iam_user" "team_a_users" {
  for_each = var.users
  name     = each.key
  tags = {
    position = each.value
  }
}

variable "users" {
  default = {
    jasmina = "manager",
    boris   = "tech_lead",
    aruina  = "senior_devops",
    soso    = "scrum_master",
    rady    = "junior_devops"
  }
}
