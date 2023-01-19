require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    
    it "Works! 200" do
      get customers_path
      expect(response).to have_http_status(200)
    end
    
    it "index - JSON 200 OK" do
      get "/customers.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json([
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String)
      ])
    end

    it "show - index - JSON 200 OK" do
      get "/customers/1.json"
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(
        id: /\d/, #Expressão regular para números
        name: (be_kind_of String),
        email: (be_kind_of String)
      )
    end

    it 'create - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { "ACCEPT" => "application/json" }
      
      customers_params = attributes_for(:customer)

      post "/customers", params: { customer: customers_params}

      expect(response.body).to include_json(
        id: /\d/, #Expressão regular para números
        name: customers_params[:name],
        #address: customers_params.fetch(:address).fetch(:street), UTILIZAÇÃO PARA JSON ANINHADO
        email: customers_params.fetch[:email]
      )
    end
  end
end
