class CreateServiceNodes < ActiveRecord::Migration
  def self.up
    create_table :service_nodes do |t|
      t.column :coord_id, :integer
      t.column :identifier, :integer
      t.column :name, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :service_nodes
  end
end
