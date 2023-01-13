require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  # Usando fixtures
  # fixtures :all # Carrega os dados no arquivo customers.yml

  it '#full_name' do
    customer = create(:customer) # ou create(:user) -> usando aliases Usando o factory bot
    expect(customer.full_name).to start_with("Sr.")
  end

  it '#full_name -- Sobrescrevendo atributo' do
    customer = create(:customer, name: "Gabriel Piovesan")
    expect(customer.full_name).to eq("Sr. Gabriel Piovesan")
  end

  # Utilizando herança com factories
  it '#vip_customer' do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)
  end

  it '#default_customer' do
    customer = create(:customer_default)
    expect(customer.vip).to eq(false)
  end

  it 'Usando o attributes_for' do # Utilizado para testes com json / é possivel passar como argumento para o .create(attrs)
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Sr.")
  end

  it 'Atributo Transitório' do
    customer = create(:customer_default, upcased: true) # upcased:true --> atributo Transitório
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente Masculino Default' do
    customer = create(:customer_male)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(false)
  end

  it 'Cliente Masculino Vip' do
      customer = create(:customer_male_vip)
      expect(customer.gender).to eq('M')
      expect(customer.vip).to eq(true)
  end

  it 'travel_to' do
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
      @customer = create(:customer_vip)
    end
    expect(@customer.created_at).to be < Time.now
  end

  it { expect{ create(:customer)}.to change {Customer.all.size}.by(1) }
end