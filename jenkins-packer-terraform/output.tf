resource "aws_key_pair" "mykeypair" {
  key_name = "mykeypair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
  lifecycle {
    ignore_changes = ["public_key"]
  }
}
root@inode2:~/terraform-course/terraform-course/jenkins-packer-demo# cat output.tf
output "jenkins-ip" {
  value = "${aws_instance.jenkins-instance.public_ip}"
}
output "app-ip" {
  value = "${aws_instance.app-instance.public_ip}"
}
