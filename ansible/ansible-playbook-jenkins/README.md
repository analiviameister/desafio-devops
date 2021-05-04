# Ansible Playbok Jenkins

Playbook para automatizar a implantação do Jenkins como serviço.

### Instruções:


<strong>Requirements</strong>

```console
foo@bar:~$ make requirements
```

<strong>Executar playbook</strong>

```console
foo@bar:~$ ansible-playbook -i inventories/gcp.yml site.yml --tags configure,zabbix,packages,master
```

### Tags:

    - configure: Preparar Host com Docker Services
    - zabbix:Implantar agente do zabbix
    - packages: Configurar pacotes necessários
    - master: Implantar single-node-master do Jenkins.