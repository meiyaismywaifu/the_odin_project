require 'json' # apparently not class-level. program-level?..

module Input
   # hm.. what could i put in here? if it's specific to a particular class then it's not really "modular". i suppose it doesn't have to be, it's a matter of organization, and "modules" are also "classes that don't need an instance".
   # the first idea is to find things easily and then read things easily.
   # ..i don't see anything wrong with the validator structure from mastermind.
end

class Hangman
   include Input
   def initialize

      ###
      # game_file = {
      #    "true" => "file",
      #    "current" => %w[_ i _ e],
      #    "miss" => %w[s t r],
      #    "left" => 4,
      # }
      # File.open("testsave.json", "w") do |f|
      #    f.write(JSON.pretty_generate(game_file))
      # end
   end
   # each round
   # until exit, complete, or no more attempts
      # autosave | how to save only previous move? that seems standard.
      # get input
         # can i set this as a separate method and loop there? is that allowed?
      # check input, update current state
      # display current state
   # complete -> victory, no more attempts -> defeat
   # autosave
   # space to re-initialize


end

class Menu
   include Input
   attr_reader :thing
   def initialize
      @thing = "secret"
      Dir.chdir("../saves")
      game = Hangman.new
      # hm. it wouldn't be new if it was loading. need to pass save from here to game, but that doesn't work since game is inside menu.. unless we start using globals.
      # how do big games do it then? are games not actually inside menus?
      # maybe don't do everything inside initialize...?
      game.newsave
      game.continue(file)
      # like this maybe?
   end
   # menu
   # loop unless exit
      # continue / new / load / exit
      # get input
end

Menu.new # doesn't need to be stored in anything.