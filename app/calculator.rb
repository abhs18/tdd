class Calculator
    def add(str)
        if str.empty?
            return 0
        else
            str = str.gsub("\n",",")
            num_arr = str.split(",").map {|num| num.to_i}
            sum = num_arr.reduce(0) {|sum,number| sum + number}
            return sum 
        end
    end

   
end