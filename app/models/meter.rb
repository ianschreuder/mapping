class Meter < ActiveRecord::Base
  belongs_to :feeder
  has_and_belongs_to_many :switches

end
