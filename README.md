# Criação de uma API com banco de dados PostgreSQL usando Mini Test

## Passo 1: Instalação do Ruby e do Rails (Vou pular essa parte)
## Passo 2: Criação do app
* rails new teste_api -api -d postgresql
## Passo 3: Criar o Model
* rails g model Product name:string price:float
* Não esqueça de rodar o rails db:create  db:migrate
## Passo 5: Criar o Controller
* rails g controller Products
## Passo 6: Definição das rotas
* resources :products
## e por último e não menos importante, a implementação da lógica
* /app/controller/products_controller.rb



# Implementação dos Mini Tests
## 
