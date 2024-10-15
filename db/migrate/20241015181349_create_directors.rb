class CreateDirectors < ActiveRecord::Migration[7.1]
  def change
    create_table :directors do |t|
      t.datetime :date_of_birth
      t.string :name
      t.text :bio

      t.timestamps
    end
  end
end
