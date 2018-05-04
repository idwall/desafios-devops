## Desafio Técnico: Infra-as-code

Você está encarregado de explorar a viabilidade do conceito **Infra-as-code** da cultura DevOps dentro da **Legada S.A**. A Legada, apesar de líder no mercado dentro do seu segmento, ainda possuí toda sua infraestrutura configurada manualmente, provisionando seus servidores diretamente pela a interface gráfica de seu _provider_. 

Apesar desta metodologia ter funcionado durante todos estes anos, a Legada S.A se vê agora na necessidade de automatizar o provisionamento de seus servidores de forma mais ágil, devido a uma imensa gama de seus clientes estarem necessitando da aplicação instalada _on-premises_ em servidores remotos.

### Objetivo:
Provisionar um **Proof-of-concept** (POC) que implemente aplicação de forma automática com apenas **uma linha de comando**

### Instruções e FAQ:
- O provisionamento deve ser feito com a criação de um cluster de node único em Kubernetes
- A aplicação a ser implementada é um Wordpress junto de seu respectivo banco MySQL.
- A aplicação deve responder à URL legada-sa.com
- Podem ser utilizados containers/charts públicos das duas ferramentas
- O candidato tem liberdade para utilizar as ferramentas que melhor achar interessante para a codificação do provisionamento da aplicação.
- Boas práticas serão analisadas

## Como entregar o desafio:
Você deve criar um repositório para este projeto e fazer o push no seu próprio repositório e enviar o link como resposta à este teste junto às especificações da máquina que deve ser utilizada para a execução, pois iremos provisionar a mesma exata configuração para rodar o teste **:)**

**Por exemplo:**
1. Iremos fazer um clone do seu projeto em uma máquina com as mesmas especificações sugeridas.
2. Executaremos o script de provisionamento.
3. Criaremos um DNS e URL - legada-sa.com - apontando para o cluster kubernetes provisionado.
4. Acessando a URL - legada-sa.com - esperamos ver a tela de configuração do Wordpress.


Fique à vontade para adicionar qualquer tipo de conteúdo que julgue útil ao projeto, tal como alterar/acrescentar um **README** com instruções de como executá-lo e dependências necessárias para tal. Também prezamos feedbacks no mesmo sobre a descrição e motivações para a resolução adotada ao projeto.

**Obs.** Não é necessário automatizar a instalação do Wordpress, a mesma será feita na execução do teste para validar a conectividade com o banco
