describe 'be_within' do
    it { expect(12.5).to be_within(0.5).of(12) }#intervalo entre um valor padrao e o delta
    it { expect([11.6, 12.1, 12.4]).to all (be_within(0.5).of(12))}
end