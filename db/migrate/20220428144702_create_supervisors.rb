class CreateSupervisors < ActiveRecord::Migration[6.1]
  def change
    create_table :supervisors do |t|
      t.integer :people_id
      t.integer :organization_id
      t.timestamps
    end
  end
end
