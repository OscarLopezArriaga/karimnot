class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name,            null: false
      t.string :description
      t.string :currentStatus,   null: false
      t.date :finishDate,        null: false
      t.boolean :active,         null: false, default: true
      t.references :category,  foreign_key: true
      t.timestamps
    end

    add_index :projects, :name, unique: true

  end
end
