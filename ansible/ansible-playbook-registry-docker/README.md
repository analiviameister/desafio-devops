# Ansible Playbok Registry Docker

Playbook automatizar a implantação do Registry Docker como contêiner.
### Instruções:


<strong>Requirements</strong>

```console
foo@bar:~$ make requirements
```

<strong>Executar Playbook</strong>

```console
foo@bar:~$ ansible-playbook -i inventories/gcp.yml site.yml --tags configure,zabbix,registry
```

### Tags:

    - configure: Preparar Host com Docker Services
    - registry: Implantar contêiner do Registry Docker
    - zabbix: Implantar agente do zabbix