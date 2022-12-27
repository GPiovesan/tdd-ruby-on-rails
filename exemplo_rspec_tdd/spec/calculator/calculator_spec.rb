require 'calculator'

describe Calculator do

    subject(:calc) { described_class.new() }

    context '#sum' do
        it 'positive numbers' do             
            result = calc.sum(5, 7)
            expect(result).to eq(12)
        end

        it 'negative and positive numbers' do             
            result = calc.sum(-5, 7)
            expect(result).to eq(2)
        end

        it 'negative numbers' do            
            result = calc.sum(-5, -7)
            expect(result).to eq(-12)
        end
    end 
end