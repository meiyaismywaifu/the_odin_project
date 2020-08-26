module Formatter

   def array_to_display(string, colors)
      display = String.new
      array = Array.new
      internal = string.upcase.chars
      internal.each do |character|
         if colors.include?(character)
            string_array << character
            if string_display.length < 12
               string_display << character + " - "
            else
               string_display << character
            end
         end
      end
      output = {"array" => array, "string" => display}
      return output
   end
   
end