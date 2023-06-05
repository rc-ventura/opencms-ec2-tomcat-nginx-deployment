<div align="center">
  
<!--![Converta-me_cover](https://user-images.githubusercontent.com/87483916/224345890-7077b778-878c-42cb-9292-2590de454519.png)



<img src= "./frontend/assets/currency_theme_white-trim.png" width="850" height="300" alt=" rosto de uma presidente americano em uma moeda">
-->

</div>

## :8ball: Descrição

Este repositório contém instruções e configurações para implantar o OpenCMS em uma instância EC2 na AWS. O objetivo é criar um ambiente de implantação para o OpenCMS, utilizando um servidor Tomcat para hospedar a aplicação e um servidor Nginx como proxy reverso.

Aqui você encontrará os passos necessários para configurar a instância EC2, instalar e configurar o servidor Tomcat para executar o OpenCMS, e configurar o servidor Nginx como um proxy reverso para redirecionar as solicitações do OpenCMS.

Essa implantação proporciona um ambiente robusto e escalável para executar o OpenCMS na nuvem da AWS, garantindo um desempenho eficiente e uma experiência de uso aprimorada. Siga as instruções detalhadas neste repositório para realizar a implantação do OpenCMS em sua própria instância EC2.

<!--
<div align="center">

  <!-- Um imagem>
  
</div>
 
 -->

## :smile: Status do Projeto

![→_-em desenvolvimento-green](https://user-images.githubusercontent.com/87483916/224333868-804e4712-ecb7-492b-8c47-6c6bff8e3b7a.svg)


## 🚀 Começando

Essas instruções permitirão que você obtenha uma cópia do projeto em operação em um servidor remoto mas almejo construir um tutorial para fins de desenvolvimento e teste localmente.


### 📋 As tecnologias de pré-requisitos:

 ##### <a href="https://www.oracle.com/br/java/technologies/downloads"> * Amazon Web Services (AWS)</a> : É necessário ter uma conta na AWS para criar e gerenciar uma instância EC2. 
 ##### <a href="https://www.oracle.com/br/java/technologies/downloads"> * EC2 (Elastic Compute Cloud)</a>: É o serviço da AWS que fornece capacidade computacional redimensionável na nuvem. Você precisará criar uma instância EC2 para hospedar o OpenCMS.
 ##### <a href="https://www.oracle.com/br/java/technologies/downloads"> * Tomcat </a>: É um servidor web de código aberto que implementa as especificações Java Servlet e JavaServer Pages (JSP). O Tomcat será usado para executar o OpenCMS na instância EC2.
 ##### <a href="https://www.oracle.com/br/java/technologies/downloads"> * Nginx </a>: É um servidor web de alto desempenho, proxy reverso e balanceador de carga. O Nginx será configurado como um proxy reverso para redirecionar as solicitações do OpenCMS.

### 📋 As tecnologias de pré-requisitos adicionais:

##### <a href="https://www.oracle.com/br/java/technologies/downloads"> * PostgreSQL</a>: É um sistema de gerenciamento de banco de dados relacional de código aberto. O PostgreSQL será utilizado como o banco de dados para o OpenCMS. É necessário ter conhecimento na instalação e configuração do PostgreSQL, além de habilidades básicas de administração de banco de dados.


### 🔧 Instalação


#### :anger: Subindo uma máquina EC2 na AWS:
<hr>

1. Acesse o Console de Gerenciamento da AWS em https://console.aws.amazon.com.

2. Crie uma nova instância EC2:
   - Navegue até o serviço EC2.
   - Clique em "Launch Instances" (Iniciar instâncias).
   - Selecione uma AMI (Amazon Machine Image) adequada para o sistema operacional desejado, como a versão mais recente do Ubuntu LTS.
   - Escolha o tipo de instância e o tamanho adequados para suas necessidades.
   - Configure as opções de rede, como VPC, subrede e grupos de segurança.
     - Certifique-se de criar ou editar o grupo de segurança associado à instância EC2.
     - Adicione regras de entrada para permitir as portas 8080, 5432, 80, 443 e 22 (Tomcat, PostgreSQL, HTTP, HTTPS e SSH, respectivamente).
   - Defina as configurações de armazenamento, como volumes e discos.
   - Configure as permissões de segurança e as chaves de acesso.
   - Revise as configurações e inicie a instância.

3. Aguarde a inicialização da instância EC2:
   - Aguarde até que o estado da instância mude para "running" (em execução).
   - Obtenha o endereço IP público da instância EC2 atribuído pelo AWS.

4. Conecte-se à instância EC2:
   - Utilize uma ferramenta de acesso remoto, como SSH (para instâncias Linux) ou RDP (para instâncias Windows), para se conectar à instância EC2 usando o endereço IP público e as chaves de acesso.


#### :anger: Instalando e configurando um servidor TOMCAT:
<hr>


#### Etapa 1: Instalação do Java 11 LTS
 ```
sudo apt-get update
sudo apt install -y openjdk-11-jre-headless  
 ```

#### Etapa 2: Download e instalação do Tomcat 9.0.75
 ```
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.zip
 ```

#### Etapa 3: Download do unzip
 ```
 sudo apt install -y unzip
 ```
#### Etapa 4: Descompactar o Tomcat para um diretório
 ```
sudo unzip apache-tomcat-9.0.75.zip -d /opt/tomcat
 ```

#### Etapa 5: Navegar até a pasta /bin do Tomcat
 ```
cd /opt/tomcat/apache-tomcat-9.0.75/bin/
 ```

#### Etapa 6: Permissões de execução para a /bin do Tomcat
 ```
sudo chmod +x *.sh
 ```

#### Etapa 7: Inicialização do servidor Tomcat
 ```
sudo ./startup.sh
 ```

#### Etapa 8: Download do OpenCms 15.0
 ```
cd /home/ubuntu
sudo wget http://www.opencms.org/downloads/opencms/opencms-15.0.zip
 ```

#### Etapa 9: Implantação da aplicação OpenCms no servidor Tomcat
 ```
sudo unzip opencms-15.0.zip -d /opt/tomcat/apache-tomcat-9.0.75/webapps/
 ```

#### Etapa 10: Reinicia o Tomcat
 ```
sudo /opt/tomcat/apache-tomcat-9.0.75/bin/shutdown.sh
sudo /opt/tomcat/apache-tomcat-9.0.75/bin/startup.sh
 ```


#### :anger: Instalando e configurando o Postgres:
<hr>


#### Etapa 1:  Atualiza os pacotes disponíveis no sistema

 ```
sudo apt-get update
 ```

#### Etapa 2:  Instala o PostgreSQL

 ```
sudo apt install -y postgresql
 ```
#### Etapa 3:  Acessa a conta de usuário "postgres" do PostgreSQL

 ```
sudo su - postgres
 ```
#### Etapa 4:  Conecta-se ao banco de dados "postgres" como o usuário "postgres"

```
psql -d postgres -U postgres
 ```
#### Etapa 5:  Altera a senha do usuário "postgres"
```
alter user postgres with password 'minhasenha';
```

## :scroll: Funcionalidades

<Br>

<!--

* Conversor de câmbio entre um par de moedas.

https://user-images.githubusercontent.com/87483916/224521177-28dfcd7d-a7f8-4b07-8165-008f50befc2d.mp4

<Br>
<Br>


* Salvando transações de conversão no banco de dados.

https://user-images.githubusercontent.com/87483916/224570140-59ec3d15-2057-4b94-b85e-2c733daf2f98.mp4

-->

## :airplane: Roadmap
 
- [x] Configurar uma instância EC2 na AWS com a AMI mais recente do Ubuntu LTS.
- [x] Liberar as portas necessárias (8080, 5432, 80, 443, 22) no grupo de segurança associado à instância EC2.
- [ ] Instalar e configurar o servidor Tomcat na instância EC2.
- [ ] Instalar e configurar o PostgreSQL como banco de dados na instância EC2.
- [ ] Configurar e testar a conexão entre o Tomcat e o PostgreSQL.
- [ ] Fazer o download e configurar o pacote de instalação do OpenCMS.
- [ ] Realizar a implantação do OpenCMS no Tomcat.
- [ ] Configurar o servidor Nginx como um proxy reverso para redirecionar as solicitações do OpenCMS.
- [ ] Testar a configuração do Nginx e verificar se o OpenCMS está acessível através do proxy reverso.
- [ ] Configurar um cenário local no arquivo hosts para mapear o domínio da aplicação para o endereço IP da instância EC2.
- [ ] Acessar a instalação do OpenCMS através do domínio configurado localmente, verificando se a aplicação está funcionando corretamente.
- [ ] Executar o comando terraform init para inicializar o projeto Terraform.
- [ ] Executar o comando terraform plan para visualizar as alterações que serão aplicadas.
- [ ] Executar o comando terraform apply para criar e provisionar a infraestrutura na AWS.
- [ ] Verificar se a infraestrutura foi criada corretamente e se a aplicação está acessível através do domínio configurado.
- [ ] Criar um arquivo Dockerfile para a construção da imagem do OpenCMS.
- [ ] Configurar as dependências necessárias no Dockerfile, como o JDK, Tomcat e PostgreSQL.
- [ ] Construir a imagem Docker do OpenCMS usando o Dockerfile.
- [ ] Realizar o push da imagem Docker para um registro de contêiner, como o Docker Hub ou um registro privado.
- [ ] Configurar o Docker na instância EC2, instalando o Docker Engine e Docker Compose, se necessário.
- [ ] Criar um arquivo docker-compose.yml para definir a composição dos contêineres necessários, incluindo o OpenCMS, PostgreSQL e Nginx.
- [ ] Configurar as variáveis de ambiente ou arquivos de configuração necessários para o funcionamento adequado dos contêineres.
- [ ] Configurar o Nginx como um proxy reverso, redirecionando as solicitações para o contêiner do OpenCMS.
- [ ] Provisionar a infraestrutura e iniciar os contêineres utilizando o Terraform e o Docker Compose.
- [ ] Verificar se os contêineres estão em execução

À medida que você avança neste roadmap, marque com um "x" as etapas que já foram concluídas. Isso ajudará a acompanhar o progresso até acessar a aplicação rodando.


 


## :book: Documentação
  
##### <a href="https://swagger.io/specification/)" target="_blank"> Swagger/OpenAPI </a>
  
<img src="https://user-images.githubusercontent.com/87483916/230924283-b1cf026a-ca3d-4ad0-a721-d762791bc960.png" alt="documentacão Api swagger"/>


<div align="center">

https://user-images.githubusercontent.com/87483916/230924780-c11f1a06-e2d6-4cf1-a6d8-3e75b8c24f01.mp4

  </div>
  
## ⚙️ Executando os testes
<Br>
  
* Overview dos testes feitos em Junit, Mockito, Rest Assured
<Br>
   
 <div  style="display: inline-block" >

<img src="https://user-images.githubusercontent.com/87483916/230927490-7ff73c1c-cc32-4e4f-bf0c-e899d38d96d9.png" alt="Imagem modificada" width="800"/>

<img src="https://user-images.githubusercontent.com/87483916/230928492-249e0adf-1f74-48d4-9b40-b95a67b7846b.png" alt="Imagem modificada" width="800"/>
<Br>
<Br>
  
  ### :fast_forward: Testes de Integração
  <Hr>
  
   #### :o: shouldConvertCurrencyAndSaveTransaction
   * Simula uma consulta na API externa. 
   * Retorna com a taxa de conversão.
   * Processa a conversão.
   * Salva no banco de dados a transação. 
  <Br>
 <img src= "https://user-images.githubusercontent.com/87483916/230958891-d9ff3b4b-1f7f-43ef-96a4-fb72c2a47303.png" alt= "Imagem modificada" width="800"/>

    
  #### :o: Transaction Controller Feature
  * Simula todos os endpoints da aplicação ao manipular uma transação
  * Controller->Service->Repository
  * GET, UPDATE, GET/ID, DELETE/ID, SAVE
  <Br>
  

<img src="https://user-images.githubusercontent.com/87483916/230958940-8f6d3e33-36f8-4244-a334-59429143a0a1.png" alt=" Imagem modificada" width="800"/>

<Br>

 ### :fast_forward: Testes Unitários
<Hr>
 
 #### :o: CurrencyExceptionHandler
 * Simula o controle de exceções
  <Br>
    
  ![Sem título - Brave 10_04_2023 11_56_51](https://user-images.githubusercontent.com/87483916/230982651-7dbe2ae6-b3f4-4808-8c83-38cb4f8733d3.png)

     
 #### :o: Currency Conversion
 * Simula uma conversão.
 * Chama a API Externa
 * Faz uma conversão do par USD para BRL.
  <Br>
    
 ![Sem título - Brave 10_04_2023 11_54_53](https://user-images.githubusercontent.com/87483916/230982897-a2460374-df92-43b4-8a68-ae14140fe758.png)

    
<Br>
    
 #### :o: Transaction Service
* Simula todas as manipulações de transações na camada de Serviços
* Service->Repository
    
<Br>
 
![Sem título - Brave 10_04_2023 11_55_35](https://user-images.githubusercontent.com/87483916/230983762-5092a75c-d24e-4d28-8d41-6b3ee1b71449.png)

  
</div>
  
  
<!-- Explicar como executar os testes automatizados para este sistema.

### 🔩 Analise os testes de ponta a ponta

Explique que eles verificam esses testes e porquê.

```
Dar exemplos
```

### ⌨️ E testes de estilo de codificação

Explique que eles verificam esses testes e porquê.

```
Dar exemplos
```
-->
  
## 📦 Implantação
  
  <Br>
  
<div align="center">
 
  ![Deploy-Currency-Converter drawio](https://github.com/rc-ventura/CurrencyConverter_CI-CD-K3D/assets/87483916/8ce8a791-f8fc-4e4d-8d05-8cc90a121330)

  
</div> 
  
  <Br>
  
  #### :crystal_ball: DEVOPS
    
  * Utilizando o Terraform provisiona uma infra-estrutura básica na  Digital Ocean.
  * Criação de um cluster kubernetes com três serviços: backend, frontend e bancode dados
  * Criação de 3 réplicas do backend e do frontend para escalonamento
  * Criação de um load balancer aberto para internet que balanceia a carga para o frontend na porta 80 (http)
  * Provisionamento de um máquina virtual (Droplet) para configurar a orquestração com o Jenkins.
  * Criação do pipeline com o Jenkins CI utilizando o Docker e o DockerHub.
  * Configuração d eum webhook no github para automatização do início do pipeline CI após um gitpush no repositório.
    
  #### :mag: SRE 
  
 * Criação de observabilidade utlizando o Helm para configurar o cluster Kubernetes.
 * Criação um load balancer aberto para requisições http na porta 80 e redirecionamento para a porta 9090 (prometheus) 
 * Criação um load balancer aberto para requisições http na porta 80 e redirecionamento para 3000 (grafana).
 * Criação dos dashboards das métricas funcionais e não funcionais da aplicação.
  
  #### :computer: DEV
  
 * Promove alterações no código e ativa o trigger do pipeline.
 * Manutenção e implementação dos testes unitários 
 * Promove a cobertura do código nos testes.
  
<Br>



## 🛠️ Tecnologias

 <div  style="display: inline-block" >

 <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg" width="80"  /> 
 <img src= "https://user-images.githubusercontent.com/87483916/224313415-17511f48-87e4-4d9d-98ed-01daba701270.png" width="80"/>  
 <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original-wordmark.svg"width="80" />
 <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original-wordmark.svg"width="80"  />
 <img src= "https://user-images.githubusercontent.com/87483916/224327989-cbe927a8-c35c-48e1-99e2-6baadec00d9b.svg" width="80">
 <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" width="80">
 <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/terraform/terraform-original.svg" width="80" />
 <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/digitalocean/digitalocean-original-wordmark.svg" width="80" />
 <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ansible/ansible-original.svg" width="80"/>
 <img src="https://user-images.githubusercontent.com/87483916/235651549-6462c52d-2e71-4afc-9baa-e8bb05b1ddfb.png" width="80"/>
 <img src="https://user-images.githubusercontent.com/87483916/235651471-f5d27c13-0881-4cde-8001-29ad237636fc.svg" width="80"/>
 <img src="https://user-images.githubusercontent.com/87483916/235651505-baebd218-b8eb-4452-89a4-1263ac864abe.svg" width="80"/>

</div>




## 🖇️ Colaborando

Por favor, leia o [COLABORACAO.md](https://gist.github.com/usuario/linkParaInfoSobreContribuicoes) para obter detalhes sobre o nosso código de conduta e o processo para nos enviar pedidos de solicitação.

## 📌 Versão

 Para as versões disponíveis, observe as [tags neste repositório](https://github.com/suas/tags/do/projeto). 

## ✒️ Autores

Mencione todos aqueles que ajudaram a levantar o projeto desde o seu início

* **Rafael Ventura** - *Idealizador do projeto* - [Dev Ventura](https://github.com/rc-ventura)

Você também pode ver a lista de todos os [colaboradores](https://github.com/usuario/projeto/colaboradores) que participaram deste projeto.

## 📄 Licença

Este projeto está sob a licença (sua licença) - veja o arquivo [LICENSE.md](https://github.com/usuario/projeto/licenca) para detalhes.

## 🎁 Expressões de gratidão


---
⌨️ com ❤️ por [Rafael Ventura](https://gist.github.com/rc-ventura) 😊
