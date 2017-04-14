class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :sighted # variable format for input data, potentially switch to t.date later
      t.string :city
      t.string :state
      t.string :shape
      t.string :duration
      t.string :summary
      t.string :posted # variable format for input data, potentially switch to t.date later
      t.timestamps null: false
    end
  end
end
