provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/"
}

resource "aws_iam_group" "management" {
  name = "Management"
  path = "/"
}

resource "aws_iam_user" "tim" {
  name = "tim"
}

resource "aws_iam_user" "bob" {
  name = "bob"
}

resource "aws_iam_user" "ben" {
  name = "ben"
}

resource "aws_iam_group_membership" "developers_team" {
  name = "developers-group-membership"

  users = ["${aws_iam_user.tim.name}", "${aws_iam_user.bob.name}", "${aws_iam_user.ben.name}"],

  group = "${aws_iam_group.developers.name}"
}

resource "aws_iam_group_membership" "Management" {
  name = "Management-group-membership"

  users = [
    "${aws_iam_user.bob.name}"],
    group = "${aws_iam_group.management.name}"
}
