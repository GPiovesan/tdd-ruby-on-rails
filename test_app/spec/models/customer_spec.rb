require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  # Usando fixtures
  # fixtures :all # Carrega os dados no arquivo customers.yml

  it '#full_name' do
    customer = create(:customer) # Usando o factory bot
    expect(customer.full_name).to start_with("Sr.")
  end

  it { expect{ create(:customer)}.to change {Customer.all.size}.by(1) }
end