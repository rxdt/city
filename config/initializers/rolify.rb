# Monkey-patch rolify to prevent issue where db:migrate fails due to lack of
# roles table, and thus can't create the roles table.
# https://github.com/RolifyCommunity/rolify/issues/168
module Rolify::Configure
  def role_table_missing?(role_class)
    !role_class.table_exists?
  end
end

Rolify.configure do |config|
  config.use_dynamic_shortcuts
end
