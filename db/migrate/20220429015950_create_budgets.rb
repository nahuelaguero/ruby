class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.float :amount
      t.belongs_to :organization, null: true
      t.timestamps
    end
  end
end
