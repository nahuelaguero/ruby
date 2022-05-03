class CreatePersons < ActiveRecord::Migration[6.1]
  def change
    create_table :persons do |t|
      t.string :name
      t.string :last_name
      t.boolean :is_supervisor
      t.timestamps
    end
  end
end
