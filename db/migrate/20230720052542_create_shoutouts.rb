class CreateShoutouts < ActiveRecord::Migration[6.1]
  def change
    create_table :shoutouts do |t|
      t.string :name
      t.text :description
      t.string :message

      t.timestamps
    end
  end
end
