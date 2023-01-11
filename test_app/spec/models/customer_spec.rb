require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  fixtures :all # Carrega os dados no arquivo customers.yml

  it 'Create a Customer' do
    customer = customers(:gabriel)
    expect(customer.full_name).to eq("Sr. Gabriel Piovesan")
  end
end