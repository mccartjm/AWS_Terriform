data "http" "workstation-external-ip" {
  url = "http://ipv4.jeremytest.com"
}

locals {
  workstation-external-cidr = "${chomp(data.http.workstation-external-ip.body)}/32"
}