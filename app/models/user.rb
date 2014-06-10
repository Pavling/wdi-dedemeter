class User < ActiveRecord::Base
  attr_accessible :name, :phone
  has_many :invoices
  has_one :address
end
