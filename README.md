[Задание](https://github.com/netology-code/mnt-homeworks/tree/MNT-video/08-ansible-01-base)

### [Задача 1](tasks/01.md)
Запуск playbook на окружении `test.yml`:  
`ansible-playbook -i inventory/test.yml site.yml`  
![run ansible-playbook](images/image01.png)  
Значение `some_fact` = 12

### [Задача 2](tasks/02.md)
Указанное значение находится в [`group_vars/all/examp.yml`](/playbook/group_vars/all/examp.yml)

### [Задача 3](tasks/03.md)
Для выполнения этой задачи создадим контейнеры, как указано в [prod.yml](/playbook/inventory/prod.yml):
Для ubuntu создаём [Dockerfile](/playbook/Dockerfile) и поднимаем оба образа:
- `docker build -t ubuntu-python .`
- `docker run -d --name centos7 --hostname centos7 centos:7 sleep infinity`
- `docker run -d --name ubuntu --hostname ubuntu ubuntu-python sleep infinity`
### [Задача 4](tasks/04.md)
- Запускаем `ansible-playbook -i inventory/prod.yml site.yml`
- Результат:  
![run ansible-playbook](/images/image02.png)

some_fact для `centos7` = `"el"`, для `ubuntu` = `"deb"`

### [Задача 5](tasks/05.md)
Меняем значение `some_fact` в обоих файлах:  
![some_fact](/images/image03.png)  

### [Задача 6](tasks/06.md)
Результат:  
![ansible-playbook](/images/image04.png)  

### [Задача 7](tasks/07.md)
- `ansible-vault encrypt group_vars/el/examp.yml`
- `ansible-vault encrypt group_vars/deb/examp.yml` 

### [Задача 8](tasks/08.md)
`ansible-playbook -i inventory/prod.yml site.yml --ask-vault-password`  
![ansible-playbook](/images/image05.png)  

### [Задача 9](tasks/09.md)
`ansible-doc --type connection --list`  
![ansible-dic](/images/image06.png)  

### [Задача 10](tasks/10.md)
Добавляем новую группу в [prod.yml](/playbook/inventory/prod.yml)  

### [Задача 11](tasks/11.md)
`ansible-playbook -i inventory/prod.yml site.yml --ask-vault-password`  
![ansible-playbook](/images/image07.png)  
