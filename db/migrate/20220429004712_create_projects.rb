class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.belongs_to :organization
      t.string :status
      # t.integer :supervisor
      # t.integer :person_id
      t.belongs_to :budget
      t.belongs_to :department
      t.belongs_to :office
      t.string :description
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
