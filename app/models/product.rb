class Product < ApplicationRecord
  belongs_to :supplier

  validates_presence_of :name, :amount, :mfd, :exp, :category
end
