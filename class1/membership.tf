
resource "aws_iam_group_membership" "developers_team" {
  name = "developers-group-membership"

  users = [
    "${aws_iam_user.tim.name}",
  ]

users =[ "${aws_iam_user.bob.name}"]

users =["${aws_iam_user.ben.name}"]
  group = "${aws_iam_group.developers.name}"
}

resource "aws_iam_group_membership" "management_team" {
  name = "management-group-membership"

  users = [
    "${aws_iam_user.ben.name}",
  ]

  group = "${aws_iam_group.ben.name}"
}