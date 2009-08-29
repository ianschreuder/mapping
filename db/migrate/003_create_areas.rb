class CreateAreas < ActiveRecord::Migration
  def self.up
    create_table :areas do |t|
      t.column :name, :string
      t.timestamps
    end
    
    create_table :areas_service_nodes, :id => false do |t|
      t.column :area_id, :integer, :null => false
      t.column :service_node_id, :integer, :null =>false
    end

  end

  def self.down
    drop_table :areas_service_nodes
    drop_table :areas
  end
end
