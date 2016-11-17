class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :student, index: true, foreign_key: true
      t.date :payment_date
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
