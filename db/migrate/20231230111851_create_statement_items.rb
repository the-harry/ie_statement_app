class CreateStatementItems < ActiveRecord::Migration[7.1]
  def change
    create_table :statement_items do |t|
      t.string :title, null: false
      t.numeric :amount, precision: 30, scale: 15, null: false
      t.string :transaction_type, null: false
      t.references :statement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
