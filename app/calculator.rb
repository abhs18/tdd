require_relative "error"

class Calculator
    def add(str)
        if str.empty?
            return 0
        else
            if str[0,2] === "//"
                delimiter = str[2]
                delimiter_str = str[4..-1] #Sliced the string from 4th charatcer to the last character
                get_sum(delimiter_str,delimiter)
            else
                str = str.gsub("\n",",")
                get_sum(str) 
            end
           
        end
    end

    def get_sum(str, delimiter = ",") #Considering default delimieter as ","
         num_arr = str.split("#{delimiter}").map {|num| num.to_i}
         status , negative_numbers_array =  validate_string_array(num_arr)

         if status
         return raise NegativeNumberNotAllowedError ,"negative numbers not allowed #{negative_numbers_array.sort.reverse.join(",")}"
         else
            sum = num_arr.reduce(0) {|sum,number| sum + number}
            return sum 
         end
                 
    end

    def validate_string_array(arr)
        status = false
        negative_numbers_array = arr.select {|num| num < 0}
        if negative_numbers_array.size > 0
            status = true
        end
        return status,negative_numbers_array
    end
end