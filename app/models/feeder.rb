class Feeder < ActiveRecord::Base
  belongs_to :substation
  has_many :meters
  has_and_belongs_to_many :switches

end
