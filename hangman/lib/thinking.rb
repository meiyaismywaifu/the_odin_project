# writes inside lib
   # somefile = File.open("think_gen.txt", "w")
   # somefile.puts "asdfg"
   # somefile.close
# fails to read from parent..
   # somefile = File.open("thinking.txt", "r")
   # contents = file.read
   # puts contents
# why didn't CSV fail? does CSV autoread? garbage tutorial. "you will learn" garbage.
# i suppose it's possible it also doesn't work, since i never tested it.

# File.open is a synonym for File.new. so it's creating an instance. File.open is used because of... blocks. apparently.

# this reads
   # Dir.chdir ".."
   # somefile = File.open("thinking.txt", "r")
   # contents = somefile.read
   # puts contents
   # puts Dir.pwd
# this writes
   # Dir.chdir ".."
   # somefile = File.open("think_gen.txt", "w")
   # somefile.puts "thingen file"
   # somefile.close
# Dir remembers where it is, no need to declare as variable... apparently. a global variable then?
# it's a class? but I can invoke its methods without making an object? what's going on here
   # Dir.chdir("../..")
   # dir = Dir.new("event_manager") # Dir.new needs 1 arg. can do Dir.new(Dir.pwd) though.
   # dir.each { |thing| puts thing}
# this serves the same function as going to event_manager and then using ls.
# ...makes enough sense, if i didn't look into this from where i wanted to. but i did.
# hm. well, i can do what i want to do, so no need to solve mysteries.

# makes directory at parent level unless already exists
   # Dir.chdir ".."
   # puts "lib #{File.exists?("lib")}"
   # puts "arb #{File.exists?("arb")}"
   # Dir.mkdir("saves") unless File.exists?("saves")
# ..why would i create a save directory here when i can just do it manually?

# saving as json...
   # require 'json'
   # tempHash = {
   #     "key_a" => "val_a",
   #     "key_b" => "val_b"
   # }
   # File.open("public/temp.json","w") do |f|
   #   f.write(tempHash.to_json)
   # end
# apparently it's like that. looks simple enough. so problem goes back to what sort of thing do we want to save.
# thinking.txt [24] seems fine. next question is, is that a hash.

   # require 'json'
   # game_file = {
   #    "true" => "file",
   #    "current" => %w[_ i _ e],
   #    "miss" => %w[s t r],
   #    "left" => 4,
   # }
   # Dir.chdir("../saves")
   # File.open("testsave.json", "w") do |f|
   #    f.write(JSON.pretty_generate(game_file))
   # end # this closes file / flushes from memory
# "JSON.pretty_generate" makes it readable.
# "test2.to_json" works fine.
# ..what the heck is this pathing in the docs?
# "JSON::Ext::Generator::GeneratorMethods::Hash"?
# how would i have found this internally?
# oh the other docs site has it. hm.

   # class Test
   #    def initialize
   #       puts "testing"
   #    end
   # end
   # Test.new
# huh.

# def case_tester (type, input)
#    case
#    when type == 0
#       puts "type 0, input #{input}"
#    when type == 1
#       puts "type 1, input #{input}"
#    when input == "a"
#       puts "type #{type}, input a"
#    when input == "b"
#       puts "type #{type}, input b"
#    end
# end
# case_tester(0,"a")