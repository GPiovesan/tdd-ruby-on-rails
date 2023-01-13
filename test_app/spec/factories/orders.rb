FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido número - #{n}" }
    
    
    #association :customer, factory: :customer # Funciona da mesma maneira que a linha de baixo
    customer # Automáticamente verifica se existe uma factory com o nome de 'customer' e cria a instância
  end
end
