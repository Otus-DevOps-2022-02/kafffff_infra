### Тема 7. Модели управления инфраструктурой. Подготовка образов с помощью Packer
### Устанавливаем Packer.
### #Создаём сервисный аккаунт YC.
```
yc config list
```
### Создание файла-шаблона packer
### Создание скриптов для provisioners
```
Так как Packer выдавал ошибку при установке пакетов, то изменяем следующие параметры в скриптах install_ruby.sh и install_mongodb.sh: apt update на apt-get update apt install на apt-get install Вставляем следующие команды сразу после apt-get update:

sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/dpkg/lock-frontend
```
### Проверка корректности файла
```
packer validate -var-file=variables.json ubuntu16.json
```
### Сборка
```
packer build -var-file=variables.json ubuntu16.json
```
### После сборки переходим в Ya cloud -> Образы. Там найдём созданный инстанс. В Ya cloud -> Виртуальные машины создаём ВМ. Подключаемся к ВМ
```
ssh -i ~/.ssh/appuser appuser@<публичный IP машины>
```
