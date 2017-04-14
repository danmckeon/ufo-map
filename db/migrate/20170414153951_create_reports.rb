class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.datetime :sighted
      t.string :city
      t.string :state
      t.string :shape
      t.string :duration
      t.string :summary
      t.date :posted
      t.timestamps null: false
    end
  end
end
