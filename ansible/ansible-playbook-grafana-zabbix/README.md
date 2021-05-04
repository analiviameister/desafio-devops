# Ansible Playbok Grafana Zabbix

Playbook para automatizar a implantação das ferramentas grafana e zabbix em contêineres

### Instruções:

<strong>Requirements</strong>

```console
foo@bar:~$ make requirements
```

<strong>Executar playbook</strong>

```console
foo@bar:~$ ansible-playbook -i inventories/gcp.yml site.yml --tags configure,grafana, zabbix
```

### tags:

    - configure: Preparar Host com Docker Services
    - grafana: Implantar contêiner do grafana
    - zabbix: Implantar contêineres do zabbix-server, zabbix-web, zabbix-db, zabbix-agent