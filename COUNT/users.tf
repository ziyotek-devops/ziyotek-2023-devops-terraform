resource "aws_iam_user" "team_a_users" {
  count = length(var.a_team_users)
  name = "${var.a_team_users[count.index]}-team-memeber-number-${count.index}"
}

variable "a_team_users" {
    default = [
        "jasmina", #jasmina-0
        "boris", #boris-1
        "aruina",
        "soso",
        "rady"
    ]
}
