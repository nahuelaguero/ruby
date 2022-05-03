class CreateOfficesProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :offices_projects do |t|
      t.references :office, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
