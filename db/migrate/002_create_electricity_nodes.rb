class CreateElectricityNodes < ActiveRecord::Migration
  def self.up
    create_table :enodes do |t|
      t.column :coord_id, :integer
      t.column :info1, :string
      t.column :info2, :string
      t.column :info3, :string
      t.column :info4, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :enodes
  end
end
