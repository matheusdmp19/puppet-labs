
# Puppet-labs

## Objetivo

O objetivo desse repositório é ter diversos labotarórios de puppet, utilizando diferentes ambientes, através de infraestrutura como código (IAC) e que sejam simples de configurar, modificar, testar e aprender.

# Configuração de ambientes

## Virtualbox

### Requisitos

- Virtualbox instalado;
- Vagrant instalado;
- Estar dentro do repositório clonado.

### Subir ambiente

    cd environments/virtualbox
    ./init.sh

### Destruir ambiente

    vagrant destroy -f

### Comandos úteis

Acessar máquinas via ssh:

    vagrant ssh <nome-da-máquina>

Executar comando remoto na máquina:

    vagrant ssh <nome-da-máquina> -c "echo teste"

# Referências utilizadas

## Puppet:

- [Apostila Puppet - BR](https://github.com/puppet-br/apostila-puppet)

## Vagrant:

- [Vagrant 101 - Utilizando Infraestrutura como Código para Desenvolvimento e Estudo](https://www.youtube.com/watch?v=PX6OmeIbjC4)
- [Repositório caiodelgadonew/blog-vagrant-101](https://github.com/caiodelgadonew/blog-vagrant-101)

## Regex:

- [Regex](https://aurelio.net/shell/canivete/#metacaracteres)
