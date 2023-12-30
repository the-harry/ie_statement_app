class CreateStatements < ActiveRecord::Migration[7.1]
  def change
    create_table :statements do |t|
      t.numeric :disposable_income, precision: 30, scale: 15
      t.string :ie_rating
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
