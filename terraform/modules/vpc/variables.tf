variable "db_disk_image" {
  description = "Disk image for reddit db"
  default     = "reddit-base-1650112666"
}

variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}

variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable "subnet_id" {
  description = "Subnet"
}
