class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :organization
      t.string :status
      t.integer :supervisor
      t.string :people
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
