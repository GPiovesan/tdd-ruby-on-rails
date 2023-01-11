require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  # Usando fixtures
  # fixtures :all # Carrega os dados no arquivo customers.yml

  it 'Create a Customer' do
    customer = create(:customer) # Usando o factory bot
    expect(customer.full_name).to eq("Sr. Gabriel Piovesan")
  end
end