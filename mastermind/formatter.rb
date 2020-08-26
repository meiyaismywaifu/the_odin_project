module Formatter

   def array_to_display(string, colors)
      display = String.new
      array = Array.new
      internal = string.upcase.chars
      internal.each do |character|
         if colors.include?(character)
            array << character
            if display.length < 12
               display << character + " - "
            else
               display << character
            end
         end
      end
      output = {"array" => array, "string" => display}
      return output
   end
   
end