variable "appname" {
  default = %{ basename(abspath(path.root))
  type    = string
}
