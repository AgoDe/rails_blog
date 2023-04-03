class CreatePartecipants < ActiveRecord::Migration[7.0]
  def change
    create_table :partecipants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
