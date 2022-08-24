# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :name, :mobile, :email, :comment
end
