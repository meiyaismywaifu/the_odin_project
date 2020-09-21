require 'csv'
module Dictionary
   @@dic_ref = "5desk.txt"
   @@dic_gen = "hangman_dic.txt"
   @@dic_size = 0
   
   def load_dic
      Dir.chdir("../dic")

      # if not identical to current settings, write new dictionary.
      setting = CSV.read("dic_setting.csv", headers: true){|file| file.read}
      setted = CSV.read("dic_setted.csv", headers: true){|file| file.read}
      new_dic(setting) if setting != setted
      # first line of generated dictionary is its number of entries.
      @@dic_size = File.open(@@dic_gen, "r"){|f| f.readline}.to_i

      Dir.chdir("../saves")
   end

   def new_word
      Dir.chdir("../dic")

      # new word
      pick = rand(1..@@dic_size)
      # apparently enumerators are better/faster than readlines.
      File.open(@@dic_gen, "r").each_line.with_index do |line, index|
         (@state["secret"] = line.chomp; break) if index == pick
      end

      # loads blanks
      @state["current"] = @state["secret"].chars.map {|char| char = "_"}
   
      Dir.chdir("../saves")
   end

   #ref thinking "new dictionary prototyping"
   def new_dic(setting)
      min = setting["min_size"].reduce.to_i
      max = setting["max_size"].reduce.to_i
      new_dic = ""; counter = 0
      File.open(@@dic_ref, "r").each_line do |line|
         if line.chomp.length >= min && line.chomp.length <= max
            counter += 1
            new_dic << line
         end
      end
      File.open(@@dic_gen, "w"){|f| f.write("#{counter}\n#{new_dic}")}

      #save dictionary settings. see thinking [516]
      CSV.open("dic_setted.csv", "w") do |csv|
         csv << ["min_size", "max_size"]
         csv << ["#{min}", "#{max}"]
      end

   end
end