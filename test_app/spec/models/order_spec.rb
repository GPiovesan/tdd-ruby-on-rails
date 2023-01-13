require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer) # Testando com associações
  end

  it 'Tem 3 pedidos - create_list' do # Criando lista de elementos para teste
    orders = create_pair(:order) # create_pair = cria 2 objetos
    expect(orders.count).to eq(2)
  end

  it 'has_many' do
    customer = create(:customer_with_orders)
    expect(customer.orders.count).to eq(3)
  end
end
