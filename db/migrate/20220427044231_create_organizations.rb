class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :department
      t.integer :office
      t.integer :budget
      t.integer :people

      t.timestamps
    end
  end
end
