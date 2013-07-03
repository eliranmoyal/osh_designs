class Category < ActiveRecord::Base
  attr_accessible :name , :min_price , :max_price , :min_days_work , :max_days_work
  has_many :templates, dependent: :destroy
end
