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

# Данные для подключения
bastion_IP = 34.77.200.119
someinternalhost_IP = 10.132.0.3
