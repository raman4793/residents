ActiveAdmin.register Complaint do
  before_filter :skip_sidebar!, :only => :index
  actions :index, :show
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    column :id do |record|
      link_to(record.id, admin_complaint_path(record))
    end
    column :content do |record|
      link_to(record.content, admin_complaint_path(record))
    end
  end

  controller do
    def scoped_collection
      Complaint.where(recipient_type: 'Admin')
    end
  end

end
