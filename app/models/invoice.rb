class Invoice < ActiveRecord::Base
  belongs_to :user
  attr_accessible :number, :price
end
