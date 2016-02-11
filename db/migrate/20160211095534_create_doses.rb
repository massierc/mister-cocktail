class CreateDoses < ActiveRecord::Migration
  def change
    create_table :doses do |t|
      t.references :cocktail, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.string :description

      t.timestamps null: false
    end
  end
end
