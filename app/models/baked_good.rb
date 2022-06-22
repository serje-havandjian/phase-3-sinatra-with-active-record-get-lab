class BakedGood < ActiveRecord::Base
  belongs_to :bakery

  def self.most_expensive
    self.all.order(price: :desc).first
  end

  def self.order_by_price
    self.all.order(price: :desc)
  end

end
