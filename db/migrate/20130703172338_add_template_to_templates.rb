class AddTemplateToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :template, :string
  end
end
