class AddDatabases < ActiveRecord::Migration[5.2]
  def change
    create_table :databases do |t|
      t.string :host
      t.string :password
      t.string :username
      t.string :name

      t.timestamps
    end

    add_reference :databases, :company, foreign_key: true
  end
end
