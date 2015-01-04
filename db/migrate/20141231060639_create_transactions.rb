class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to :user, index: true
      t.belongs_to :ad, index: true
      t.integer    :total_amount, default: 0, null: false
      t.boolean    :paid, defualt: false, null: false
      t.datetime   :start_date
      t.datetime   :end_date

      t.timestamps null: false
    end
  end
end
