locals {
  my_current_ip = data.http.my_ip.response_body
}