class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.belongs_to :organization
      t.timestamps
    end
  end
end
