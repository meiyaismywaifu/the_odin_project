# apparently "let" and "subject" are mostly the same?
# except "let" doesn't allow implicit calls, which i don't like anyways.
# what were the other equivalents again? "context" and "it"? wasn't there a third here? are these identical too or is there some catch like there's always some catch? well we'll just stick to the same thing.
# but the main thing here was
    let(:thing) { block }
# would also be equivalent to
    subject(:thing) { block }
# wouldn't allow it {should be (something)} stuff though.

# ah, calling explicit vs implicit is different. which is different from define ex/imp.
# from caesar cipher which has now been modified,
# implicit:
    subject { Cipher.new.caesar(text,shift) }
    context "shift +1" do
        let(:text) {"example"}; let(:shift) {1}
        it {should eql "fybnqmf"}
    end
# explicit:
    subject(:cipher) { Cipher.new.caesar(text,shift) }
    context "shift +1" do
        let(:text) {"example"}; let(:shift) {1}
        it "shifts by 1" do
            expect(cipher).to eql "fybnqmf"
        end
    end
# oh thats not entirely parallel.
# this
    it "shifts by 1" do
        expect(cipher).to eql "fybnqmf"
    end
# and
    it { expect(cipher).to eql "fybnqmf" }
# are identical, except for the message you want to print to console.
# which is probably the most important thing, this would be second.


# oh, "xit" is a built-in holder in rspec, it appears.


# lol some of this shit is a joke
# comments are in the files themselves with triple #'s for differentiation, here would be too cluttered.


    # 'eq' checks for equal VALUE.
    # 'eql' checks for equal VALUE and TYPE.
    # 'equal' checks for OBJECT IDENTITY.
    # 'be' checks for OBJECT IDENTITY.
# eeeeee

# i think i should be paying more attention to how describe/context/it is structured more than this other stuff being pointed at.


# ...what is [respond_to]?


# not sure i entirely grasp implications of "shared_examples".