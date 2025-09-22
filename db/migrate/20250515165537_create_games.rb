class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true
      t.string :user_move
      t.string :computer_move
      t.string :result

      t.timestamps
    end
  end
end
