
resource "aws_iam_group_membership" "developers_team" {
  name = "developers-group-membership"

  users = ["${aws_iam_user.tim.name}", "${aws_iam_user.bob.name}", "${aws_iam_user.ben.name}"],

  group = "${aws_iam_group.developers.name}"
}

resource "aws_iam_group_membership" "Management" {
  name = "Management-group-membership"

  users = [
    "${aws_iam_user.ben.name}"],
    group = "${aws_iam_group.management.name}"
}