# Go back to the Caesar Cipher Project and write tests for your code. It shouldn’t take more than a half-dozen tests to cover all the possible cases.

# --- --- ---

# what to test...
# think the given tester loop has to be commented out.
    # forward integer
    # backward integer
    # integer greater than 26
    # fails if shift by non-integer.
        # how would this work? like how would the test be written and what would be the expected outcome in rspec?
    # conserves spaces and non-letters
    # conserves upper/lower casing
#


describe Cipher do
    context "positive integer" do
        it "shifts forward" do
            cipher = Cipher.new
             expect(cipher.caesar("shift",1)).to eql "tijgu"
            #expect(cipher.caesar("shift",1)).to eql("tijgu")
        end
    end
end

# copying along from [http://testing-for-beginners.rubymonstas.org/rspec/advanced.html]

describe Cipher do
    before { @caesar_cipher = Cipher.new.caesar("shift",shift) }

    context "positive integer" do
        let(:shift) {1}
        it "shifts forward" do
            expect(@caesar_cipher).to eql "tijgu"
        end
    end
end

describe Cipher do
    let(:caesar_cipher) { Cipher.new.caesar("shift",shift) }

    context "positive integer" do
        let(:shift) {1}
        it "shifts forward" do
            expect(caesar_cipher).to eql "tijgu"
        end
    end
end

describe Cipher do
    subject { Cipher.new.caesar("shift",shift) }

    context "positive integer" do
        let(:shift) {1}
        it "shifts forward" do
             expect(subject).to eql "tijgu"
            #should eql "tijgu"
        end
    end
end

describe Cipher do
    subject { Cipher.new.caesar("shift",shift) }

    context "positive integer" do
        let(:shift) {1}
        it {should eql "tijgu"}
    end
end

# all these are equivalent in function.
# [should] is defined only when [subject] is defined.
# the last one provides a different [rspec --format doc] output.
# others:
    # Cipher
    #   positive integer
    #       shifts forward
# last:
    # Cipher
    #   positive integer
    #       is expected to eql "tijgu"
# in both cases, it prints out the line input to [it].



subject { Cipher.new.caesar("example",shift) }
context "shift asd" do
    # works
    it "raises TypeError" do
        expect { Cipher.new.caesar("example","asd") }.to raise_error(TypeError)
    end

    # doesn't work, gives the error itself
    context "shift asd" do
        let(:shift) {"asd"}
        it {should raise_error(TypeError)}
    end

    # script fails to run, "#let or #subject called without a block"
    context "shift asd" do
        let(:shift) {"asd"}
        expect(subject).to raise_error(TypeError)
    end
end
# i don't care about looking into why this doesn't work.