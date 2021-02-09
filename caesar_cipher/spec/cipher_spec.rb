require './caesar_cipher.rb'

# what to test...
# think the given tester loop has to be commented out.
    # forward integer
    # backward integer
    # integer greater than 26
    # fails if shift by non-integer.
        # how would this work? like how would the test be written and what would be the expected outcome in rspec?
    # conserves spaces and non-letters
    # conserves upper/lower casing

describe Cipher do
    context "positive integer" do
        it "shifts forward" do
            cipher = Cipher.new
            expect(cipher.caesar("shift",1)).to eql("tijgu")
        end
    end
end