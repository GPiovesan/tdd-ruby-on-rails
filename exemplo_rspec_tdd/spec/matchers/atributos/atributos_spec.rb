require 'pessoa'

describe 'Atributos' do

    around(:each) do |teste|
        puts "ANTES"
        @pessoa = Pessoa.new
        teste.run
        @pessoa.nome = "Sem Nome!"
        puts "Depois >>>>>> #{@pessoa.inspect}"
    end

    it 'have_attributes' do
        @pessoa = Pessoa.new
        @pessoa.nome = "Jackson"
        @pessoa.idade = 20

        expect(@pessoa).to have_attributes(nome: a_string_starting_with("J"), idade: (a_value >= 20))
    end
end