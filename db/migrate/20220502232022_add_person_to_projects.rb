class AddPersonToProjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :person
  end
end
