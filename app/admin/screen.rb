ActiveAdmin.register Screen do
  permit_params :screen_name,
                :description,
                :address,
                :demographic,
                :foot_traffic,
                :operating_hours,
                :location_image, :location_image_delete

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

  show do |obj|
    attributes_table do
      row :location_image do
        image_tag(obj.location_image.url(:card))
      end
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

  form html: { enctype: "multipart/form-data" } do |f|
    f.semantic_errors
    f.inputs except: [ :location_image_file_name, :location_image_content_type, :location_image_file_size, :location_image_updated_at ] do
      f.input :screen_name
      f.input :address
      f.input :operating_hours
      f.input :foot_traffic
      f.inputs 'Location Image' do
        f.input :location_image, as: :file, hint: f.image_tag(f.object.location_image.url(:thumb))
        f.input :location_image_delete, as: :boolean, label: 'Remove image'
      end
    end
    f.actions
  end
end
