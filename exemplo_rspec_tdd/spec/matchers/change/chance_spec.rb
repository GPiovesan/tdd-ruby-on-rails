require 'contador'

describe 'Matcher change' do
    it { expect{Contador.incrementa}.to change { Contador.qtd } } # Qtd 1
    it { expect{Contador.incrementa}.to change { Contador.qtd }.by(1) } # Qtd 2
    it { expect{Contador.incrementa}.to change { Contador.qtd }.from(2).to(3) } # Qtd 3
end