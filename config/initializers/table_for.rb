module ActiveAdmin
	module Views
		class TableFor < Arbre::HTML::Table
			def visible_columns
			 @columns.select{|col| col.title=="unvisible" }
			end
		end
	end
end

