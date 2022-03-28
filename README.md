### kafffff_infra
### bastion host
bastion_IP = 178.154.247.92
someinternalhost_IP = 10.128.0.19


### Тема 6. Основные сервисы Yandex Cloud
#### Установка YC CLI
```
https://cloud.yandex.ru/docs/cli/operations/install-cli

https://cloud.yandex.ru/docs/cli/operations/profile/profile-create

yc config list
```
#### Создание инстанса
```
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/appuser.pub
  ```
  
  #### Установка приложений на инстанс
  ```
  ssh -i ~/.ssh/identity/appuser yc-user@51.250.11.30
  
  sudo apt update
  //ruby
  sudo apt install -y ruby-full ruby-bundler build-essential
  
  ruby -v
  
  bundler -v
  //mongod
  sudo apt-get install apt-transport-https ca-certificates
  
  wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
  
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-
  org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
  
  sudo apt-get update
  
  sudo apt-get install -y mongodb-org
  
  sudo systemctl start mongod
  
  sudo systemctl enable mongod
  
  sudo systemctl status mongod
  //deploy
  git clone -b monolith https://github.com/express42/reddit.git
  
  cd reddit && bundle install
  
  puma -d
  
  ps aux | grep puma

  ```
  
  Проверка
  ```
  http://51.250.11.30:9292/
  ```
  
  Для тестов
```
testapp_IP = 51.250.11.30
testapp_port = 9292
```
