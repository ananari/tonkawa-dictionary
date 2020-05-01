class CreateWordlinks < ActiveRecord::Migration[6.0]
  def change
    create_table :wordlinks do |t|
      t.integer :word_id
      t.integer :word_2
      t.string :class

      t.timestamps
    end
  end
end
