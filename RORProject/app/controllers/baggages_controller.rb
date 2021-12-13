class BaggagesController < ApplicationController
  def index
    @baggages = Baggage.all
  end

  def show
    @baggage = Baggage.find(params[:id])
  end

  def new
    @baggage = Baggage.new
  end

  def create
    @baggage = Baggage.new(baggage_params)

    if @baggage.save
      redirect_to @baggage
    else
      render :new
    end
  end

  def edit
    @baggage = Baggage.find(params[:id])
  end

  def update
    @baggage = Baggage.find(params[:id])

    if @baggage.update(baggage_params)
      redirect_to @baggage
    else
      render :edit
    end
  end

  def destroy
    @baggage = Baggage.find(params[:id])
    @baggage.destroy

    redirect_to root_path
  end

  def get_average_weight(baggage_array)
    total_weight = 0.0
    total_count = 0
    baggage_array.each do |baggage|
      total_weight += baggage.total_weight
      total_count += baggage.count
    end

    total_weight / total_count
  end

  def get_average_count(baggage_array)
    length = baggage_array.length
    count = 0
    baggage_array.each do |baggage|
      count += baggage.count
    end
    (count / length).to_i
  end

  def average_difference
    all = Baggage.all
    @baggages = []
    unless all.empty?
      average_weight_general = get_average_weight(all)
      @baggages = all.select do |baggage|
        (baggage.get_average_weight - average_weight_general).abs <= 0.3
      end
    end
  end

  def task_b
    all = Baggage.all

    @average_count = 0
    @baggage_more_than_two = 0
    @baggage_more_than_average = 0

    if all.empty?
      return
    end

    @average_count = get_average_count(all)

    all.each do |baggage|
      current_count = baggage.count
      if current_count > 2
        @baggage_more_than_two += 1
      end
      if current_count > @average_count
        @baggage_more_than_average += 1
      end
    end
  end

  def task_c
    all = Baggage.all
    @answer = false

    if all.length <= 1
      return @answer
    end

    sorted = all.sort { |first, second| first.count <=> second.count }

    (0...sorted.length - 1).each do |i|
      if sorted[i].count == sorted[i + 1].count && (sorted[i].total_weight - sorted[i + 1].total_weight).abs <= 0.5
        @answer = true
        return @answer
      end
    end
    @answer
  end

  def task_d
    all = Baggage.all
    @answer = false

    if all.empty?
      return @answer
    end

    if all.length == 1
      @answer = true
      return @answer
    end

    sorted_by_count = all.sort { |first, second| first.count <=> second.count }
    sorted_by_weight = all.sort { |first, second| first.total_weight <=> second.total_weight }

    last_index = all.length - 1

    if sorted_by_count[last_index].count == sorted_by_count[last_index - 1].count &&
      sorted_by_weight[last_index].total_weight == sorted_by_weight[last_index - 1].total_weight
      return @answer
    end

    @answer = sorted_by_count[last_index] == sorted_by_weight[last_index]
  end

  def task_e
    all = Baggage.all
    @answer = false

    if all.empty?
      return @answer
    end

    with_one_item = all.select { |baggage| baggage.count == 1 }

    with_one_item.each do |baggage|
      if baggage.total_weight < 30
        @answer = true
        return @answer
      end
    end

    @answer
  end

  private

  def baggage_params
    params.require(:baggage).permit(:count, :total_weight)
  end
end
