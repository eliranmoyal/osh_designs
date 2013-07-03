class Template < ActiveRecord::Base
  attr_accessible :category_id, :title,:template
  belongs_to :category
  mount_uploader :template, TemplateUploader
end
