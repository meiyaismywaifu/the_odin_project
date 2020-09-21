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

# saving
   # require 'json'
   # Dir.chdir("../saves")
   # File.open("testsave.json", "r") do |f|
   #    JSON.parse(f)
   # end
# incomplete...
   # require 'json'
   # Dir.chdir("../saves")
   # f = JSON.parse(File.read("testsave.json"))
   # ## equivalent:
   # ## f = File.read("testsave.json")
   # ## f = IO.read("testsave.json")
   # ## f = File.open("testsave.json", "r")
   # puts f["current"].join
# this feels like a rabbit hole.

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

# def save(state, name="autosave")
#    p "#{name}.json"
# end
# save("thing","2")

# Dir.chdir("..")
# puts File.open("think_gen.txt","r").size

   # def new_word
   #    target = 8693
   #    length = 0
   #    File.open("5desk.txt", "r").each_line.with_index do |line, index|
   #       if index == target
   #          word = line
   #          break
   #       end
   #    end
   #    puts word
   # end
   # new_word
# ..how does .each_line.with_index work? ".with_index" is an enumerator method?..
# File.open(thing)                      File. but "each_line" is a String method??
# File.open(thing).each_line            Enumerator "if no block is given"
# File.open("5desk.txt", "r").each_line.with_index       Enumerator?

   # module Test
   #    def test
   #       puts "hi"
   #       puts @secret
   #    end
   # end
   # class Thing
   #    include Test
   #    attr_reader :secret
   #    def initialize
   #       @secret = "hello"
   #       test
   #    end
   # end
   # Thing.new
# ...why does this work? oh well, convenient. why did i look into this again?

   # def input(string)
   #    if string == "1"
   #       puts "test"
   #       return 1
   #    else
   #       puts "try again"
   #       input(gets.chomp)
   #    end
   # end
   # puts "enter '1'."
   # result = input(gets.chomp)
   # puts "result: #{result}"
# is this "recursion"?

# puts hash1 = {"A" => 0, "B" => 1, "C" => 3}
# puts hash2 = {"A" => 1, "B" => 2}
# puts hash1.merge(hash2)

# def one(number)
#    return two(number)
# end
# def two(number)
#    return number + 3
# end
# puts one(2)

   # @a = 1
   # def thing(number)
   #    @a += 1
   #    number += 1
   #    puts number
   #    if @a > 4
   #       puts "returning #{number}, #{@a}"
   #       @carry = number.clone
   #       return @carry
   #    end
   #    thing(number) unless @a > 4
   #    puts @carry
   #    return @carry
   # end
   # b = thing(5)
   # puts "#{@a} #{b}"
# huh. hm. well, makes sense in retrospect. not sure i get it though.

   # def middleman(source, input)
   #    puts "middleman"
   #    puts source
   #    request = input.to_i
   #    if request == 1
   #       puts "middle repeat"
   #       middleman(source,gets.chomp)
   #    elsif request == 2 || request == 3
   #       second(request)
   #    else
   #       puts "terminating"
   #    end
   # end

   # def second(request)
   #    puts "passing"
   #    if request == 2
   #       puts "returning"
   #       return 2
   #    else
   #       puts "please enter 2"
   #       middleman("second",gets.chomp)
   #    end
   # end
   # result = middleman("outside",gets.chomp)
   # puts result
# this doesn't look like a recursion like the complicated one did? just chaining.
# adding "return" before method call changes nothing. maybe bc implicit returns?
# idgi...

# "arguments you supply to new are actually delivered to initialize."
   # class Test
   #    def initialize(settings=3)
   #       @thing = settings
   #       methodd
   #    end
   #    def methodd
   #       puts "settings: #{@thing}"
   #    end
   # end
   # Test.new(2)

# --- --- --- #

# map testing
   # x = "thing".chars.map { |character| character.upcase}
   # puts x

# modules read their instance's variables
   # module ThingMod
   #    @@blah = "also"
   #    def mod
   #       puts @a + 3
   #       puts @@blah
   #    end
   # end
   # class Thing
   #    include ThingMod
   #    def initialize
   #       @a = 5
   #       mod
   #    end
   # end
   # Thing.new

# reverse include -> reverse boolean
   # puts !("thing".include?("t"))
   # puts "thing".include?("t").! # this feels a bit off but it's equivalent

# stacking
   # x = [1]
   # a = {"b" => [1,2]}
   # b = [1,2]
   # p a["b"].include?(x.reduce)

# # trying to combine keys at hash level
   # a = {"miss" => 0}
   # b = {"miss" => -1}
   # a["miss"] = a["miss"] + b.fetch("miss")
   # puts a

# map, horizontal stacking
   # state = "secret"
   # current = %w[s _ _ _ _ _]
   # x = "e"
   # if state.include?(x)
   #    current.map!.with_index do |char, index|
   #       state[index] == x ? char = x : char = char
   #    end
   #    # long version:
   #    # current.map!.with_index do |char, index|
   #    #    if state[index] == x
   #    #       char = x
   #    #    else
   #    #       char = char
   #    #    end
   #    # end
   # end
   # puts current
# ask and ye shall receive.
   # state = "secret"
   # current = %w[s _ _ _ _ _]
   # x = "e"
   # if state.include?(x)
   #    temp = current.map.with_index do |char, index|
   #       state[index] == x ? char = x : char = char
   #    end
   # end
   # puts temp # HA!

# trying to combine keys at hash level
   # a = {}
   # a["b"] = 1
   # p a["b"].is_a? Integer

# single line if, multiple operations
   # a = 5
   # (puts "hello"; puts "hi") if a == 5

# break testing
   # a = 0
   # b = 1
   # until a > 5 || b > 6
   #    a += 1
   #    b += 2
   #    puts "#{a} #{b}"
   #    (puts "wao!"; break) if b > 4
   # end
   # puts "end"

# CSV fiddling
   # require 'csv'
   # Dir.chdir("../dic")
   # contents = CSV.read("dic_settings.csv", headers: true) do
   #    puts "HELLO"
   #    p contents["min_size"].reduce.to_i # that's annoying.
   # end
   
   # require 'csv'
   # Dir.chdir("../dic")
   # contents = CSV.open("dic_settings.csv", headers: true) {|file| file.read}
   # puts contents["min_size"]
# apparently "contents" is a "CSV::Table" when headers are specified.

# new dictionary prototyping
# most of the work was reading docs and thinking how to ask the google gods
   # require 'csv'
   # Dir.chdir("../dic")
   # setting = CSV.read("dic_setting.csv", headers: true){|file| file.read}
   # setted = CSV.read("dic_setted.csv", headers: true){|file| file.read}
   # unless setting == setted
   #    min = setting["min_size"].reduce.to_i
   #    max = setting["max_size"].reduce.to_i
   #    puts "#{min} #{max}"
   #    thing = ""
   #    counter = 0
   #    File.open("small_dic.txt", "r").each_line do |line|
   #       counter +=1
   #       thing << line if line.chomp.length >= min && line.chomp.length <= max
   #       # tried map/map! and copying then deleted but succeeded here first
   #    end
   #    File.open("small_dic_mod.txt", "w"){|f| f.write("#{counter}\n#{thing}")}
   # end
   # puts File.open("small_dic_mod.txt", "r"){|f| f.readline}

   # # file = File.open("small_dic.txt", "a+")
   # # thing = ""
   # # file.each_line.with_index do |line, index|
   # #    thing << line if line.chomp.length > min && line.chomp.length < max
   # # end
   # # thing.each_line do |line|
   # #    puts line
   # # end

   # # arr = %w[a b c d]
   # # arr2 = arr.map do |letter|
   # #    letter == "a" ? letter = 0 : letter = letter
   # # end
   # # p arr2

# def case_tester2 (type, input)
#    case
#    when type == 0
#       case input
#       when "a"
#          puts "WAA!"
#       else
#          puts "type 0, input #{input}"
#       end
#    when type == 1
#       puts "type 1, input #{input}"
#    when input == "a"
#       puts "type #{type}, input a"
#    when input == "b"
#       puts "type #{type}, input b"
#    end
# end
# case_tester2(0,"a")

# case [thing] is match only, case empty is like if/else.
   # a = 4
   # case 
   # when a != 5
   #    puts "hit"
   # else
   #    puts "nothing"
   # end

# append inside hash
   # a = {"array" => %w[a b c]}
   # b = {"array" => %w[d e f]}
   # a["array"].push(b["array"])
   # puts a["array"]

# display testing
   # state = {
   #    "number"  => 7,
   #    "current" => %w[_ _ _ _ _],
   #    "known_f" => %w[a b c d]
   # }
   #    # huh. puttin a newline inside puts reflects in its output.
   #    # apparently 'print' is puts without newline, but you need to use stdsync or flush or something complicated and i don't feel like looking into it.
   # puts "#{state["number"]} | #{state["current"].join(" ")} | #{state["known_f"].join(", ")}"

# clone problems inspection
   # state = {
   #    "number"  => 7,
   #    "current" => %w[_ _ _ _ _],
   #    "known_t" => [],
   #    "known_f" => %w[a b c d]
   # }
   # second = state.clone
   # state["known_t"].push("w")
   # p state["known_t"]
   # p second["known_t"]
   # p state["known_t"].object_id
   # p second["known_t"].object_id
# what... why? so if it's empty it copies all future mappings?
   # first = {"key" => %w[a b]}
   # second = first.clone
   # first["key"].push("w")
   # p first["key"]
   # p second["key"]
# ??? that's not it either...
   # first = {"key" => %w[a b]}
   # second = first.clone
   # first["key"] = first["key"].push("w")
   # p first["key"]
   # p second["key"]
# so it's a push problem. why?????
   # first = %w[a b]
   # second = first.clone
   # first.push("w")
   # p first
   # p second
# it's a push problem *specifically* inside hashes. huh. that's annoying....
# what do dis mean...
   # state = {
   #    "number"  => 7,
   #    "current" => %w[_ _ _ _ _],
   #    "known_t" => [],
   #    "known_f" => %w[a b c d]
   # }
   # second = state.clone
   # p state.object_id
   # p second.object_id
   # p state["current"].object_id
   # p state["known_f"].object_id
   # p second["current"].object_id
   # p second["known_f"].object_id
# the hashes aren't the same object, but the things inside them are.
# public example
   # first = {"key" => %w[a b]}
   # second = first.clone
   # first["key"] = first["key"].push("w")
   # p first["key"]
   # p second["key"]
# retrieved example
   # a = [1,2]
   # b = a.dup
   # a << 3
   # puts b.inspect
   # a = [ [1,2] ]
   # b = a.dup
   # a[0] << 3
   # puts b.inspect
      # "There is another method worth mentioning, clone. The clone method does the same thing as dup with one important distinction: it's expected that objects will override this method with one that can do deep copies.

      # So in practice what does this mean? It means each of your classes can define a clone method that will make a deep copy of that object. It also means you have to write a clone method for each and every class you make."
   # def deep_copy(o)
   #    Marshal.load(Marshal.dump(o))
   # end
   # first = {"key" => %w[a b]}
   # second = deep_copy(first)
   # first["key"] = first["key"].push("w")
   # p first["key"]
   # p second["key"]
# "Marshalling is Ruby's name for serialization. With marshalling, the object--with the objects it refers to--is converted to a series of bytes; those bytes are then used to create another object like the original."
# huh.
# some people saying marshal as general purpose un/serialization is bad for reasons i don't care about, and i also don't like it because idgi. someone suggests using JSON instead.
   # require 'json'
   # def deep_copy(hash)
   #    return JSON.parse(hash.to_json)
   # end
   # first = {"key" => %w[a b]}
   # second = deep_copy(first)
   # first["key"] = first["key"].push("w")
   # p first["key"]
   # p second["key"]
# fantastic.

# CSV writing
   # require 'csv'
   # min = 99
   # Dir.chdir("../dic")
   # setted = CSV.read("dic_setted.csv", headers: true){|file| file.read}
   # CSV.open("dic_setted.csv", "w") do |csv|
   #    csv << %w[min_size max_size]
   #    csv << ["#{min}", "100"]
   # end
# apparently "editing" CSV isn't as trivial as it is on excel.
# "edit" seems to be a concept for databases...? other than that it's read or write, and you could read the entire file into memory, pick it out, then write it all again, or at least that's how it works as far as i understand it. reading is easy and +/- as expected, but writing not so much.
# didn't look into fancy stuff because i only need this much.