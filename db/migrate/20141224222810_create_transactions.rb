class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.datetime :remember_created_at
      t.float    :amount

      t.timestamps
    end
  end
end
