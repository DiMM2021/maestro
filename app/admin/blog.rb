# frozen_string_literal: true

ActiveAdmin.register Blog do
  permit_params :image, :title, :description

  form do |f|
    f.inputs 'Blog' do
      f.inputs do
        f.input :image, as: :file
      end
      f.input :title
      f.input :description, as: :quill_editor, input_html: { data:
      { options:
      { modules:
      { toolbar:
      [%w[bold italic underline strike], %w[blockquote code-block],
       [{ 'list': 'ordered' }, { 'list': 'bullet' }],
       [{ 'align': [] }], ['link'], [{ 'size': ['small', false, 'large', 'huge'] }],
       [{ 'header': [1, 2, 3, 4, 5, 6, false] }], [{ 'indent': '-1' }, { 'indent': '+1' }],
       [{ 'direction': 'rtl' }], [{ 'color': [] }, { 'background': [] }],
       [{ 'font': [] }], ['clean'], ['image']] }, theme: 'snow' } } }
    end
    f.actions
  end
end
