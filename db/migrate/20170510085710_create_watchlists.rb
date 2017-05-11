class CreateWatchlists < ActiveRecord::Migration[5.0]
  def change
    create_table :watchlists do |t|
      t.integer :UserId
      t.string :MovieId

      t.timestamps
    end
  end
end
