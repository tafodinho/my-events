class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :venue
      t.datetime :date
      t.integer :creator_id, foreign_key: true
      # t.references :creator, foreign_key: true

      t.timestamps
    end
  end
end
