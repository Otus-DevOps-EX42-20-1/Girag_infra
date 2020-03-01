# Girag_infra
Girag Infra repository

# Способ подключения к `someinternalhost` в одну команду
Создать на рабочем устройстве файл `~/.ssh/config` со следующим содержимым:
```
Host bastion
        HostName 34.77.200.119
        User appuser
        IdentityFile ~/.ssh/appuser

Host someinternalhost
        HostName 10.132.0.3
        User appuser
        IdentityFile ~/.ssh/appuser
        ProxyCommand ssh -W %h:%p bastion
```

Если такой файл уже есть, то добавить эти строки в его конец. После этого можно будет подключаться одной командой `ssh someinternalhost`.

# Дополнительное задание
Добавить в файл `~/.bash_aliases` строку:
```
alias someinternalhost="ssh someinternalhost"
```

И выполнить команду:
```
source ~/.bash_aliases
```

Затем для подключения можно будет использовать команду `someinternalhost`. 

# Команда gcloud для создания инстанса со startup_script
```
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata startup-script='wget -O - https://hastebin.com/raw/cukofawawi | bash'
```

# Команда gcloud для создания правила брандмауэра
```
gcloud compute firewall-rules create default-puma-server --allow=tcp:9292 --target-tags=puma-server
```

# Данные для подключения
bastion_IP = 34.77.200.119
someinternalhost_IP = 10.132.0.3

testapp_IP = 35.205.34.220
testapp_port = 9292
