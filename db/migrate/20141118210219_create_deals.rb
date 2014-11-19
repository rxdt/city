class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :company_name, null: false
      t.text :blurb
      t.text :description
      t.string :round
      t.float :raise
      t.float :commitment
      t.float :min_investment
      t.string :security_type
      t.float :conversion_discount
      t.float :valuation_cap
      t.float :interest_rate
      t.float :warranty_coverage
      t.integer :note_term

      t.timestamps
    end
  end
end
