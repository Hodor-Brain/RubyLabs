class Baggage < ApplicationRecord
  validates :count, presence: true, :numericality => { :only_integer => true, :greater_than => 0,
                                                       :less_than_or_equal_to => 1000 }
  validates :total_weight, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 50000 }

  def get_average_weight
    itself.total_weight / itself.count
  end
end
