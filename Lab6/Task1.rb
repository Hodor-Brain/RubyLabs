class Passenger
  attr_reader :count, :weight

  def initialize(count, total_weight)
    @count = count.to_i
    @weight = total_weight.to_f
  end

  def get_average_weight
    @weight / @count
  end

  def to_s
    "Number of baggage: #{@count}, Weight: #{@weight}, Average: #{get_average_weight}"
  end
end

class Passengers
  attr_reader :passengers_array

  def initialize(baggage_array = [])
    @passengers_array = Array.new
    baggage_array.each { |baggage| @passengers_array << baggage.dup }
  end

  def add_passenger(baggage)
    @passengers_array.append(baggage)
  end

  def to_s
    string = "Average weight: #{get_average_weight}\n"
    string += "Average count of baggage: #{get_average_count}\n"
    @passengers_array.each { |baggage| string += baggage.to_s + "\n" }
    string
  end

  def get_average_weight
    total_weight = 0.0
    total_count = 0
    @passengers_array.each do |baggage|
      total_weight += baggage.weight
      total_count += baggage.count
    end

    total_weight / total_count
  end

  def get_average_count
    count = 0
    @passengers_array.each do |baggage|
      count += baggage.count
    end
    (count / @passengers_array.length).to_f
  end

  def task_a
    average_weight_general = get_average_weight

    Passengers.new(
      @passengers_array.select do |baggage|
        (baggage.get_average_weight - average_weight_general).abs <= 0.3
      end
    )
  end

  def task_b
    average_count = get_average_count
    baggage_more_than_two = 0
    baggage_more_than_average = 0
    @passengers_array.each do |baggage|
      current_count = baggage.count
      if current_count > 2
        baggage_more_than_two += 1
      end
      if current_count > average_count
        baggage_more_than_average += 1
      end
    end
    [baggage_more_than_two, baggage_more_than_average]
  end

  def task_c
    sorted = @passengers_array.sort {|first, second| first.count <=> second.count}

    (0...sorted.length - 1).each do |i|
      if sorted[i].count == sorted[i + 1].count && (sorted[i].weight - sorted[i + 1].weight).abs <= 0.5
        return true
      end
    end
    false
  end

  def task_d
    if @passengers_array.length == 1
      return true
    end

    sorted_by_count = @passengers_array.sort {|first, second| first.count <=> second.count}
    sorted_by_weight = @passengers_array.sort {|first, second| first.weight<=> second.weight}

    last_index = @passengers_array.length - 1

    if sorted_by_count[last_index].count == sorted_by_count[last_index - 1].count &&
      sorted_by_weight[last_index].weight == sorted_by_weight[last_index - 1].weight
      return false
    end

    sorted_by_count[last_index] == sorted_by_weight[last_index]
  end

  def task_e
    with_one_item = @passengers_array.select { |baggage| baggage.count == 1 }

    with_one_item.each do |baggage|
      if baggage.weight < 30
        return true
      end
    end
    false
  end
end

baggage_array = Passengers.new([Passenger.new(1, 5),
                                Passenger.new(20, 82.2)])
baggage_array.add_passenger(Passenger.new(10, 640.56))
baggage_array.add_passenger(Passenger.new(134, 520.2))
baggage_array.add_passenger(Passenger.new(24, 143.3))
baggage_array.add_passenger(Passenger.new(24, 143.8))
baggage_array.add_passenger(Passenger.new(62, 30.98))

puts "Baggage array:"
printf("#{baggage_array}\n")

puts "Task a:"
printf("Passengers with average weight of baggage is not further from general average weight than 0.3 kg\n#{baggage_array.task_a}\n")

puts "Task b:"
task_b_array = baggage_array.task_b
printf("Count of passengers with more than 2 baggage: #{task_b_array[0]}\nCount of passengers with count of baggage more than average: #{task_b_array[1]}\n\n")

puts "Task c:"
printf("Are there 2 passengers with same count of baggage and weight differance isn't more than 0.5kg: #{baggage_array.task_c}\n\n")

puts "Task d:"
printf("Is there a passenger with the biggest count of baggage as well as weight: #{baggage_array.task_d}\n\n")

puts "Task e:"
printf("Is there a passenger with 1 baggage and weight < 30kg: #{baggage_array.task_e}\n")
