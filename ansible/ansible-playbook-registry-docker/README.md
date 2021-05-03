# Ansible Playbok Registry Docker

### Requisitos:

```console
foo@bar:~$ make requirements
```

### Comando para execução do playbook

```console
foo@bar:~$ ansible-playbook -i inventories/gcp.yml site.yml --tags configure,registry
```

### Roles:

    - configure: Preparar Host com Docker Services
    - registry: Implantar contêiner do Registry Docker