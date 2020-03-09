class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :name
      t.string :pos
      t.string :definition
      t.string :notes

      t.timestamps
    end
  end
end
