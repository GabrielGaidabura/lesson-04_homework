# methods for testing
#0 reduce as base method
def reduce (array, arg)
   rez = arg
   for i in (0..(array.size-1))
      rez = yield rez, array[i]
   end
   
   rez
end

#1 count 
def count (array, &block)
	counter = 0

	counter = reduce array, counter do |arg, el|
		if block.call(el)
			arg = arg + 1
		else
			arg
		end
	end

	counter
end

#2 select
def select (array, &block)

   arrRez = Array.new(array.size)

   arrRez = reduce array, arrRez do |arg, el|
      if block.call(el)
         arg<<el
      else
         arg
      end
   end

   arrRez.compact
end

#3 detect
def detect (array, &block)

   rez = nil

   rez = reduce array, rez do |arg, el|
      if block.call(el)
		 return el
		else
		 arg
      end
   end

   rez
end

#4 map
def map (array, &block)

	arr_of_rez = Array.new()
	
	arr_of_rez = reduce array, arr_of_rez do |arg, el|
		arg<<block.call(el)		
	end

    arr_of_rez
end

#5 all?
def all? (array, &block)
	counter_of_fails = 0;

	counter_of_fails = reduce array, counter_of_fails do |arg, el|
		if !block.call(el)
			counter_of_fails = counter_of_fails + 1
		else
			counter_of_fails
		end
	end 
 
    counter_of_fails == 0
end

#6 any?
def any? (array, &block)
    counter_of_truth = 0;
   
    counter_of_truth = reduce array, counter_of_truth do |arg, el|
    	if block.call(el)
    		counter_of_truth = 1
    	else
    		counter_of_truth
    	end
    end
   
    counter_of_truth > 0
end

#7 local maximum
def local_maximum (array)
	array_of_lm = Array.new()
	array.each_cons(3) do |el|
		if (el[1] > el[0]) && (el[1] > el[2])
			array_of_lm<<el[1]
		end
	end
	array_of_lm
end

#8 flatten ver1
def flatten (array)
	
	must_check_again = true
	
	while must_check_again

		must_check_again = false
		array_temp = Array.new()

		array.each do |el|
			if !el.is_a?(Array)
				array_temp<<el
			else
				must_check_again = true
				el.each do |el_arr|
					array_temp<<el_arr
				end
			end
		end

		array = array_temp
	end 

	array
end

#9 sort_by even and odd numbers with descending, sort_by length of words
def sort_by_even_and_odd_numbers_with_desc (array)
	array.sort_by do |e| 
		[e%2, -e]
	end	
end

def sort_by_length (array)
	array.sort_by do |word| 
		[word.length]
	end	
end