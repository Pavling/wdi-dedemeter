class User < ActiveRecord::Base
  attr_accessible :address, :name, :phone
  has_many :invoices
end
