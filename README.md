### Тема 8. Знакомство с Terraform
### Перед terraform init идем
```
https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart
```
### в main.tf вставляем 
```
terraform {
  required_providers {
    yandex = {
      source = "terraform-registry.storage.yandexcloud.net/yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "<OAuth>"
  cloud_id  = "<идентификатор облака>"
  folder_id = "<идентификатор каталога>"
  zone      = "<зона доступности по умолчанию>"
}
```
### Далее в main.tf добавляем
```
resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = "fd8fg4r8mrvoq6q2ve76"
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = "e9bem33uhju28r5i7pnu"
    nat       = true
  }
}
```
### где лежит в YC -> VPC -> подсети. ssh-keygen https://ruvds.com/ru/helpcenter/ssh-ubuntu-18-04-linux/
### добавить ssh ключ в main.tf
```
  metadata {
    foo      = "bar"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
```
### Задание со *
```
Создаём lb.tf, идём 
https://cloud.yandex.com/en/docs/tutorials/infrastructure-management/terraform-quickstart 
далее идём 
https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_network_load_balancer#import

```
### Откуда взять output values смотрим в terraform.tfstate
### Count, dynamic
```
https://www.terraform.io/language/meta-arguments/count,
https://www.terraform.io/language/expressions/dynamic-blocks
```
### Чтобы не было Error  Cycle host меняет на self
### Добавляем sleep в .sh

### Итог: с помошью терраформа создано 2 инстанса в YC, добавлен балансировщик нагрузки.На инстансы установлены приложения.
