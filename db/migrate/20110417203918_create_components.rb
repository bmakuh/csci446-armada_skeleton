class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.string :name
      t.integer :age
      t.string :cost
      t.string :attack
      t.string :gender
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :components
  end
end
