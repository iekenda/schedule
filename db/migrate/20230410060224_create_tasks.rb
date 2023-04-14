class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :starting
      t.date :ending
      t.boolean :all
      t.datetime :updated

      t.timestamps
    end
  end
end
