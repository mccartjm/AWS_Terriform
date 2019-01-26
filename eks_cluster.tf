resource "aws_eks_cluster" "eks" {
  name = "eks"
  role_arn = "${aws_iam_role.cluster_role.arn}"
  vpc_config = {
    security_group_ids = ["${aws_security_group.cluster_role.id}"]
    subnet_ids = ["${module.vpc.public_subnets}"]
  }
  depends_on = [
    "aws_iam_role_policy_attachment.cluster_role-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.cluster_role-AmazonEKSServicePolicy",
  ]
}




