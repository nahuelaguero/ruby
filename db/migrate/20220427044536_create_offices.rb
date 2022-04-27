class CreateOffices < ActiveRecord::Migration[6.1]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
