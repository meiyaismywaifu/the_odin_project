require './caesar_cipher.rb'

describe Cipher do
    subject { Cipher.new.caesar(text,shift) }

    context "shift +1" do
        let(:text) {"example"}; let(:shift) {1}
        it {should eql "fybnqmf"}
    end

    context "shift -2" do
        let(:text) {"example"}; let(:shift) {-2}
        it {should eql "cvyknjc"}
    end

    context "shift +27" do
        let(:text) {"example"}; let(:shift) {27}
        it {should eql "fybnqmf"}
    end

    context "shift asd" do
        it "raises TypeError" do
            cipher = Cipher.new
            expect { cipher.caesar("example","asd") }.to raise_error(TypeError) # see thinking[86]
        end
    end

    context "conserve non-letters" do
        let(:text) {"ex ample!"}; let(:shift) {1}
        it {should eql "fy bnqmf!"}
    end

    context "conserve casing" do
        let(:text) {"ExAmPlE"}; let(:shift) {1}
        it {should eql "FyBnQmF"}
    end

end
