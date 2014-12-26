ActiveAdmin.register User do
  permit_params :email, 
                :password, 
                :password_confirmation, 
                role_ids: []

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :roles do |user|
      user.roles.pluck(:name).join(", ")
    end
    actions
  end

  show do
    attributes_table do
      row :email
      row :sign_in_count
      row :confirmed_at
      row :created_at
      row :updated_at
      row :roles do |user|
        user.roles.pluck(:name).join(", ")
      end
    end
    active_admin_comments
  end

  filter :roles
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles, as: :check_boxes
    end
    f.actions
  end
end
