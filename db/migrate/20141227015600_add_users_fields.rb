class AddUsersFields < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, default: '', null: false
    add_column :users, :last_name, :string, default: '', null: false
    add_column :users, :phone_office, :string, default: '', null: false
    add_column :users, :phone_home, :string, default: '', null: false
    add_column :users, :phone_mobile, :string, default: '', null: false
    add_column :users, :address_street, :string, default: '', null: false
    add_column :users, :address_city, :string, default: '', null: false
    add_column :users, :address_state, :string, default: '', null: false
    add_column :users, :address_zip, :string, default: '', null: false
  end
end
