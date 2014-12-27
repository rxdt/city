ActiveAdmin.register User do
  decorate_with UserDecorator

  permit_params :email, 
                :password, 
                :password_confirmation, 
                role_ids: []

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :current_sign_in_at
    column :sign_in_count
    column :roles do |user|
      user.roles.pluck(:name).join(", ")
    end
    actions defaults: true do |obj|
      link_to 'Send Reset Password Email', send_reset_email_admin_user_path(obj), method: :post
    end  
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
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


  member_action :send_reset_email, method: :post do
    authorize! :manage, User
    user = User.find params[:id]
    user.send_reset_password_instructions
    flash[:notice] = 'Reset password email sent to user.'
    redirect_to action: :index
  end
end
