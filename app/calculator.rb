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
        sum = num_arr.reduce(0) {|sum,number| sum + number}
        return sum 
    end
end