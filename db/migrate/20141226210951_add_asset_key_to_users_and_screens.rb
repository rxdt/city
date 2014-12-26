class AddAssetKeyToUsersAndScreens < ActiveRecord::Migration
  # Migrate up in two phases, since we need to generate and store the asset keys
  # in any existing models before we can add a non-null constraint on the column.
  def up
    add_column :screens, :asset_key, :string
    add_column :users, :asset_key, :string

    # puts 'Adding asset keys to models ...'
    # [Screen, User].each do |clazz|
    #   puts "  #{ clazz.name.pluralize }:"
    #   clazz.all.each do |instance|
    #     asset_key = SecureAttachable::generate_asset_key
    #     instance.update_attribute :asset_key, asset_key
    #     puts "    id: #{ instance.id } assigned key: #{ asset_key }"
    #   end
    # end

    # change_column :screens, :asset_key, :string, null: false
    # change_column :users, :asset_key, :string, null: false
  end

  def down
    remove_column :screens, :asset_key
    remove_column :users, :asset_key
  end
end
