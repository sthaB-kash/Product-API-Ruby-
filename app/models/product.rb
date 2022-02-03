class Product < ApplicationRecord
  belongs_to :supplier

  validates_presence_of :name, :amount, :mfd, :exp, :category

  # def date_format(date_value)
  #   date = date_value.split(%r{[-/:._]})
  #   Time.local(date[0], date[1], date[2])
  # end
end
