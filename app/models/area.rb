class Area < ActiveRecord::Base
  has_and_belongs_to_many :service_nodes
  
end
