class Customer < ApplicationRecord
    has_many :orders # Para que o customer tenha vários pedidos

    validates :address, presence: true
    def full_name
        "Sr. #{name}"
    end
end
