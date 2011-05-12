class Createvelociraptors < ActiveRecord::Migration
  def self.up
    create_table :velociraptors do |t|
      t.string :name
      t.integer :age
      t.integer :cost
      t.string :attack
      t.string :gender
      t.string :description
      t.integer :creator_id
      t.timestamps
    end
  end

  def self.down
    drop_table :velociraptors
  end
end
