# Desafio 01: Infrastructure-as-code - Terraform

## Motivação

Este projeto foi criado utilizando: [Terraform](https://www.terraform.io/), para criação de recursos na cloud AWS.

O projeto foi divido da seguinte forma:

```bash terraform
├── idwall_instance
├── modules
│   ├── aws_ami
│   ├── ec2
│   ├── key_pair
│   ├── security_groups
│   └── vpc
├── scripts
└── state
```

Onde [idwall_instance](https://github.com/aka-cafu/desafios-devops/tree/master/terraform/idwall_instance) é o projeto principal, que contém todos os recursos necessários para seu funcionamento. O diretório [modules](https://github.com/aka-cafu/desafios-devops/tree/master/terraform/modules) contém, os módulos necessários para execução da aplicação **idwall_instance**, porém, estes podem ser reaproveitados para diversas outras aplicações. Dentro do diretório [scripts](https://github.com/aka-cafu/desafios-devops/tree/master/terraform/scripts) existe um arquivo chamado: _user-data.sh_, que é responsável pela instalação de alguns pacotes no servidor. E por último, o diretório: [state](https://github.com/aka-cafu/desafios-devops/tree/master/terraform/state), que contem o [estado](https://www.terraform.io/docs/state/), que nada mais é, do que um arquivo _.json_ que contém todas as configurações que foram realizadas, nesse caso, na AWS e em caso de alteração, por exemplo, em algum _security group_, quando o comando **terraform plan** for executado, ele vai buscar as informações no meu arquivo de estado (terraform.tfstate) e vai checar que há uma modificação e assim, irá exibir o que foi alterado, se algo foi removido e/ou se algo vai ser criado (exemplo abaixo).

![](http://i.imgur.com/lsrpMh9.png)

## Dependências

Para que seja possível criar a aplicação e seus demais recursos, antes de tudo é preciso baixar o binário do [terraform](https://www.terraform.io/downloads.html)

Como dito anteriormente, o projeto será criado na AWS, sendo assim, será preciso configurar suas credenciais através do [aws cli](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-welcome.html).

* Como instalar no **Linux:** https://docs.aws.amazon.com/pt_br/cli/latest/userguide/install-linux.html

* Como instalar no **macOS:** https://docs.aws.amazon.com/pt_br/cli/latest/userguide/install-macos.html

* Como instalar no **Windows:** https://docs.aws.amazon.com/pt_br/cli/latest/userguide/install-windows.html

Ao final da instalação para validar que a cli foi instalada, execute:
 
_aws --version_

A saída deve ser algo próximo a essa:
>aws-cli/1.16.132 Python/2.7.13 Linux/4.9.0-8-amd64 botocore/1.12.122

Sabendo que vamos usar a AWS como provider, é preciso que você possua uma conta e [seu usuário deve possuir permissão](https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html) para criar recursos na AWS. Tenha em "mãos" sua **access key** e **secret key** e execute o comando:

>aws configure

E adicione suas informações _Acess Key_ e _Secret Key_:

![](http://i.imgur.com/9tyPixd.png)

Um "perfil" será criado com o nome **default**, que é o mesmo nome que o terraform irá buscar para realizar a criação dos recursos na aws.


## Execução

Após realizar o clone do projeto, entre no diretório [terraform/idwall_instance](https://github.com/aka-cafu/desafios-devops/tree/master/terraform/idwall_instance) e execute o comando _terraform init_ para que os plugins utilizados sejam baixados. Em seguida execute _terraform plan_ e um plano de de tudo que será criado, será exibido. Por fim execute _terraform apply_ para executar a criação da app, para isto, será necessário confirmar a criação, digitando _yes_ e incluir as informações de IP que terá acesso via _SSH_ e a [região](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html) da AWS que serão criados os recursos.

Ao final, pode ser utilizado o comando _curl_ para verificar que a página do apache está respondendo, ou acessando via navegador o endereço ip que será exibido no [output](https://github.com/aka-cafu/desafios-devops/tree/master/terraform/idwall_instance) do terraform.


![](https://github.com/idwall/desafios-devops/blob/f15ffadfc2ff519718e8476e7904b5375cdc555f/terraform/screen.gif)

## Notas

Gostaria de deixar meu agradecimento à equipe da Idwall, pela oportunidade! :)