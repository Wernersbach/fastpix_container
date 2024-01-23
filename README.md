# Configuração do Ambiente FastPix com Docker
Este guia irá ajudá-lo a configurar o ambiente Docker para o projeto FastPix, incluindo clonagem do repositório e configuração do banco de dados.
## Pré-requisitos
- Docker e Docker Compose devem estar instalados na sua máquina.
- Acesso ao repositório privado do GitHub com sua chave SSH configurada corretamente.

## Configuração

### 1. Clonar o Repositório

Clone o repositório fastpix para a máquina local utilizando o seguinte comando:
```bash
git clone git@github.com:Wernersbach/fastpix.git web
```
Este comando cria uma pasta chamada web com o conteúdo clonado do repositório.

### 2. Preparar o Dump do Banco de Dados
Coloque o arquivo de dump do banco de dados na pasta dump, que deve estar dentro do diretório principal do projeto.

Certifique-se de que as credenciais e configurações do banco de dados estejam corretas no arquivo docker-compose.yml.

### 3. Iniciar o Container do Banco de Dados
Use o Docker Compose para iniciar o container do banco de dados com o seguinte comando:
```bash
docker-compose up -d db
```

### 4. Importar o Dump do Banco de Dados
Depois que o container do banco de dados estiver em execução, importe o dump:
```bash
docker exec -i fastpix_db mysql --defaults-extra-file=./etc/mysql/conf.d/config.cnf -u fastpix fastpix < ./dump/fastpix.sql
```
Nota: Ajuste o comando acima com a senha correta e o caminho do arquivo de dump conforme necessário.

### 5. Iniciar o Container da Aplicação
Após configurar o banco de dados, inicie o container da aplicação com:
```bash
docker-compose up -d web
```

A aplicação agora deve estar acessível em localhost:8000.

## Acesso
- Web: http://localhost:8000
- MySQL: localhost:3306 (ou a porta configurada no docker-compose.yml)

## Após qualquier alteração de configuração no container, você precisa reeconstruir seu container:
```bash
docker-compose up --build -d
```