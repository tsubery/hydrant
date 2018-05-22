class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.string :owner, null: false
      t.integer :sniffed_butts, default: 0

      t.timestamps
    end
  end
end
