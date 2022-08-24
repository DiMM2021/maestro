# frozen_string_literal: true

ActiveAdmin.register Item do
  permit_params :image, :name, :category_id, :brand_id, :type_acoustics, :size, :description, :price, :availability

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
