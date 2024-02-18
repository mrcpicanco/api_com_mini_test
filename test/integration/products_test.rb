require 'minitest'
require 'test_helper'

class ProductsTest < ActionDispatch::IntegrationTest
  # Listar Produtos
  test 'listar produtos' do
    get '/products'
    assert_response :success
  end
  
  # Cadastrar um novo produto
  test 'cadastrar produto' do
    assert_difference('Product.count') do
      post '/products', params: { product: { name: 'Produto Antigo', price: 19.90 }}
    end
    assert_response :created
  end
  
  # Atualizar produto
  test 'Atualizar produto' do
    product = Product.create(name: 'Novo Produto', price: 39.99)
      put "/products/#{product.id}", params: { product: { name: 'Caneta', price: 20.00 }}

    product.reload
      assert_equal 'Caneta', product.name
    assert_equal 20.00, product.price

    assert_response :success
  end
end
