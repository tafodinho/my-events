class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string, :
      t.string :email
      t.string :

      t.timestamps
    end
  end
end
