ActiveAdmin.register News do
  permit_params :name, :content, :author_id, :sphere

end
