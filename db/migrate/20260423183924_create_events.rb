class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
