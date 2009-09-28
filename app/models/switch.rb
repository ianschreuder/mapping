class Switch < ActiveRecord::Base
  has_and_belongs_to_many :meters
  has_and_belongs_to_many :feeders

end
