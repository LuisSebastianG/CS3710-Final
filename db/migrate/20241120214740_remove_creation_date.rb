class RemoveCreationDate < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :creation_date, :date
  end
end
