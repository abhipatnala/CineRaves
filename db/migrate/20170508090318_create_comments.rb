class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :UserId
      t.string :MovieId
      t.text :description

      t.timestamps
    end
  end
end
