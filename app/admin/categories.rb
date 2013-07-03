ActiveAdmin.register Category do

index do
	column :name , :sortable => :name do |cat|
		link_to cat.name , admin_category_path(cat)
	end
	
	column "Price Range" , :sortable => :min_price do |cat|
		"#{cat.min_price} - #{cat.max_price}"
	end

  	column "Work Days Range" , :sortable => :min_days_work do |cat|
		"#{cat.min_days_work} - #{cat.max_days_work}"
	end

	column "Number Of Templates"  do |cat|
		Template.where(category_id: cat.id).count
	end

	column "Templates" do |cat|
		link_to "templates" , admin_category_templates_path(cat)
	end

	column "Add New Template" do |cat|
		link_to "add" ,  new_admin_category_template_path(cat)
	end
	default_actions
end


 show do |cat|
    attributes_table do
      row :name
      row "Price Range" do
      	"#{cat.min_price} - #{cat.max_price}"
      end

      row "Work Days Range" do 
      	"#{cat.min_days_work} - #{cat.max_days_work}"
      end

      cat.templates.each do |template|
	      row "#{template.title} template image:" do
		        link_to image_tag(template.template_url(:thumb)) , admin_category_template_path(cat,template)
	      end	
      end

    end
    active_admin_comments
  end


end
