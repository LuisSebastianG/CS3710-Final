class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.date :creation_date

      t.timestamps
    end
  end
end
