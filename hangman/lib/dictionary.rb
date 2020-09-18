require 'csv'
module Dictionary
   @@dic_ref = "5desk.txt"
   @@dic_gen = "hangman_dic.txt"
   @@dic_size = 0
   
   def load_dic
      # if not identical to current settings, write new dictionary.
      setting = CSV.read("dic_setting.csv", headers: true){|file| file.read}
      setted = CSV.read("dic_setted.csv", headers: true){|file| file.read}
      new_dic(setting) if setting != setted
      # first line of generated dictionary is its number of entries.
      @@dic_size = File.open(@@dic_gen, "r"){|f| f.readline}

      Dir.chdir("../saves")
   end

   def new_word
      Dir.chdir("../dic")

      # (+1): rand not inclusive. +1: first line is where i store length.
      pick = rand(@@dic_size + 1) + 1 
      # apparently enumerators are better/faster than readlines.
      File.open(@@dic_name, "r").each_line.with_index do |line, index|
         (@state["secret"] = line; break) if index == pick
      end
   
      Dir.chdir("../saves")
   end

   #ref thinking "new dictionary prototyping"
   def new_dic(setting)
      Dir.chdir("../dic")

      min = setting["min_size"].reduce.to_i
      max = setting["max_size"].reduce.to_i
      new_dic = ""; counter = 0
      File.open(@@dic_ref, "r").each_line do |line|
         counter += 1
         thing << line if line.chomp.length >= min && line.chomp.length <= max
      end
      File.open(@@dic_gen, "w"){|f| f.write("#{counter}\n#{new_dic}")}

      Dir.chdir("../saves")
   end
end