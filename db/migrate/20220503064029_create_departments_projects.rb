class CreateDepartmentsProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :departments_projects do |t|
      t.references :department, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
