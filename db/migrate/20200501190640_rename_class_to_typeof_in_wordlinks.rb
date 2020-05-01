class RenameClassToTypeofInWordlinks < ActiveRecord::Migration[6.0]
  def change
    rename_column :wordlinks, :class, :typeof
  end
end
