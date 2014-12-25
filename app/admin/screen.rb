ActiveAdmin.register Screen do
  permit_params :screen_name,
                :description,
                :address,
                :demographic,
                :foot_traffic,
                :operating_hours
end
