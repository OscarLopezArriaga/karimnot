class AlterColumnProjects < ActiveRecord::Migration[5.2]
  def up
    change_table :projects do |t|
      t.change :active, :boolean, default: false, null: false
    end
  end
end
