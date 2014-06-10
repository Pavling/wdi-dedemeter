class Address < ActiveRecord::Base
  belongs_to :user
  attr_accessible :county, :line1, :line2, :line3, :post_code, :town

  def full_address
    [:line1, :line2, :line3, :town, :county, :post_code].map { |e| self.send(e) }.compact
  end
end
