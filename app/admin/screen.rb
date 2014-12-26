ActiveAdmin.register Screen do
  permit_params :screen_name,
                :description,
                :address,
                :demographic,
                :foot_traffic,
                :operating_hours

  index do
    id_column
    column :screen_name
    column :address
    column :operating_hours
    column :foot_traffic
    column :created_at do |screen|
      
    end
    actions
  end

  show do
    attributes_table do
      row :screen_name
      row :address
      row :operating_hours
      row :foot_traffic
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  filter :screen_name
  filter :address

  form do |f|
    f.inputs "Screen Details" do
      f.input :screen_name
      f.input :address
      f.input :operating_hours
      f.input :foot_traffic
    end
    f.actions
  end
end
