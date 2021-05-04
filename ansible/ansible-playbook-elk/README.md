# Ansible Playbok Elasticsearch Logstash Kibana

Playbook para automatizar a implantação do elastisearch, logstash e kibana (ELK Stack).

### Instruções:

<strong>Requirements</strong>

```console
foo@bar:~$ make requirements
```

<strong>Executar Playbook</strong>

```console
foo@bar:~$ ansible-playbook -i inventories/gcp.yml site.yml --tags configure,zabbix, elk
```

### tags:

    - configure: Preparar Host com Docker Services
    - zabbix: Configurar agente do zabbix
    - registry: Implantar contêineres do elk stask