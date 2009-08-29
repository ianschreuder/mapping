class ServiceNode < ActiveRecord::Base
  belongs_to :coord
  has_and_belongs_to_many :areas
  
end
