# Desafio DevOps

Desafio feito a partir das seguintes orientações:

- Aplicação em nodejs que precisa exibir a frase bem-vindo {nome_do_candidato} 
- Utilização do serviço Docker
- Orquestração com kubernetes
- Utilização de um CI integrado ao GIT
- Centralizador de Logs
- Monitoramento para os contêineres


## Instruções
Para acessar os hosts configurados, execute o seguinte comando :

```console
foo@bar:~$ sudo bash scripts/insert-hosts.sh
```

<strong>URL da Aplicação</strong>

Url para exibir mensagem indicada nas orientações do desafio:

- [AppNodeJS](http://app.desafio)

URL para exibir mensagem de healthcheck:
  
- [AppHealthCheck](http://app.desafio/actuator/health)


<strong>URL dos Serviços:</strong>

CI:

- [Jenkins](http://jenkins.desafio)

Monitoramento:

- [Grafana](http://grafana.desafio)

- [Zabbix](http://zabbix.desafio)

Dashboard do Orquestrador de Contêineres

- [Kubernetes_Dashboard](http://dash.k8s.desafio)

Dashboard do Centralizador de Logs:

- [kibana](http://kibana.desafio)


## Tecnologias utilizadas

Para automatização de tarefas e provisionamento, as seguintes ferramentas foram utilizadas:

- [Ansible](https://github.com/analiviameister/desafio-devops/tree/master/ansible)
  
- [Terraform](https://github.com/analiviameister/desafio-devops/tree/master/terraform)
  
- [Shell Script](https://github.com/analiviameister/desafio-devops/tree/master/scripts)
