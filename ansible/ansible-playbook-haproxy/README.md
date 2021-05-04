# Ansible Playbok HAProxy

Playbook para automatizar a implantação do HAProxy como serviço.

### Instruções:


<strong>Requirements</strong>

```console
foo@bar:~$ make requirements
```

<strong>Executar playbook</strong>

```console
foo@bar:~$ ansible-playbook -i inventories/gcp.yml site.yml --tags configure,zabbix,loadbalancer
```

### Tags:

    - configure: Preparar Host com Docker Services
    - zabbix:Implantar agente do zabbix
    - loadbalancer: Implantar serviço do HAProxy