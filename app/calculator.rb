require_relative "error"

class Calculator
    def add(str)
        if str.empty?
            return 0
        else
            if str[0,2] === "//"
                end_index , delimiters = check_and_get_multiple_delimiters(str) #this function will return end_index of the last delimiter and list of all the delimiters
                is_multi_length_or_multiple = delimiters.size > 0 ? true : false
                delimiter = is_multi_length_or_multiple ? delimiters[0] : str[2]
                delimiter_str = is_multi_length_or_multiple ? str[end_index + 2..-1] : str[4..-1] #Sliced the str from to get string after \n
                delimiter_str = format_delimiter_string(delimiter_str,delimiters)
                get_sum(delimiter_str,delimiter)
            else
                str = str.gsub("\n",",")
                get_sum(str) 
            end
           
        end
    end

    def get_sum(str, delimiter = ",") #Considering default delimieter as ","
         num_arr = str.split("#{delimiter}").map {|num| num.to_i < 1000 ? num.to_i : 0} #Ignore numbers greater than 1000
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

    def check_and_get_multiple_delimiters(str)
        delimiters = []
        start_index = str.index('[')
        while start_index
            end_index = str.index(']', start_index)
            if end_index
                bracket_content = str[start_index + 1...end_index]
                delimiters << bracket_content
                start_index = str.index('[', end_index)
            else
                break
            end
        end
        return end_index , delimiters
    end

    def format_delimiter_string(str,delimiters)
        #Replace all he delimiters in the string with the first delimiter present in delimiters array
        delimiters.each do |symbol|
            str.gsub!(symbol,delimiters.first)
        end
        return str
    end
end