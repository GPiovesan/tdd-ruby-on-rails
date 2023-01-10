describe 'Matcher output' do
    it { expect{puts "Gabriel"}.to output.to_stdout}
    it { expect{print "Gabriel"}.to output("Gabriel").to_stdout}
    it { expect{puts "Gabriel"}.to output(/Gabriel/).to_stdout}
end