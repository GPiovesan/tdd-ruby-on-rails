require 'pessoa'

describe 'Atributos' do

    #before(:each) do
    #    @pessoa = Pessoa.new
    #end

    let(:pessoa) { Pessoa.new }

    it 'have_attributes' do
        pessoa = Pessoa.new
        pessoa.nome = "Jackson"
        pessoa.idade = 20

        expect(pessoa).to have_attributes(nome: a_string_starting_with("J"), idade: (a_value >= 20))
    end
end