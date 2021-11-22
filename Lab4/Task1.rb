def generate_array(n)
  array = []
  (1..n).each {
    element = rand(-n..n)
    array.append(element)
  }
  array
end

def get_repeating_number_count(array)
  count = 0
  i = 0
  while i < array.size do
    count += 1 if i + 1 < array.size && array[i] == array[i + 1]
    i += 1 while i + 1 < array.size && array[i] == array[i + 1]
    i += 1
  end
  count
end

def first_task
  array = generate_array(12)
  number = get_repeating_number_count(array)
  printf("First task:\nArray: #{array}\nNumber of repeating sections: #{number}\n\n")
end

def find_intersection_of_arrays(first_array, second_array)
  array = []
  temp_second_array = second_array.map(&:clone)
  (0...first_array.length).each { |i|
    (0...temp_second_array.length).each { |j|
      if first_array[i] == temp_second_array[j]
        array.append(first_array[i])
        temp_second_array.delete_at(j)
        break
      end
    }
  }
  array
end

def third_task
  first_array = generate_array(10).sort
  second_array = generate_array(10).sort
  intersection = find_intersection_of_arrays(first_array, second_array)
  printf("Third task (intersection of arrays):\nFirst array: #{first_array}
Second array: #{second_array}\nIntersection: #{intersection}\n\n")
end

def fifth_task
  array = generate_array(13)
  zeros = []
  negatives = []
  positives = []

  array.map do |element|
    zeros.append(element) if element == 0
    negatives.append(element) if element < 0
    positives.append(element) if element > 0
  end

  printf("Fifth task (zeros, neg, pos):\nArray: #{array}\nResult: #{zeros + negatives + positives}\n\n")
end

def eighth_task
  array = generate_array(16)
  repeating = []
  sorted = array.sort

  i = 0
  while i < array.size - 1
    if sorted[i] == sorted[i + 1]
      repeating.append(sorted[i])
      while sorted[i] == sorted[i + 1]
        i += 1
      end
    end
    i += 1
  end

  iterators = [1] * repeating.size
  result = []

  array.each do |element|
    index = repeating.index(element)
    if index != nil
      result.append(iterators[index])
      iterators[index] += 1
    else
      result.append(element)
    end
  end

  printf("Eighth task (multiple occurs):\nArray: #{array}\nResult array: #{result}")
end

first_task
third_task
fifth_task
eighth_task
