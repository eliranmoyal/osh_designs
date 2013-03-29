# module ActiveAdmin
# 	module Views
# 		class IndexAsTable < ActiveAdmin::Component

# 			def render_to_string(*args, &block)
# 				options = _normalize_render(*args, &block)
# 				render_to_body(options)
# 			end

# 			def render_to_body(options = {})
# 				_process_options(options)
# 				_render_template(options)
# 			end

# 			def _normalize_render(*args, &block)
# 				options = _normalize_args(*args, &block)
# 				_normalize_options(options)
# 				options
# 			end

# 			def _normalize_options(options)
# 				if options[:partial] == true
# 					options[:partial] = action_name
# 				end

# 				if (options.keys & [:partial, :file, :template]).empty?
# 					options[:prefixes] ||= _prefixes
# 				end

# 				options[:template] ||= (options[:action] || action_name).to_s
# 				options
# 			end
# 			def _process_options(options)
# 			end

# 			    def _render_template(options) #:nodoc:
# 			    	lookup_context.rendered_format = nil if options[:formats]
# 			    	view_renderer.render(view_context, options)
# 			    end
# 			end

# 			def view_renderer
# 				@_view_renderer ||= ActionView::Renderer.new(lookup_context)
# 			end

# 			def _normalize_args(action=nil, options={})
# 				case action
# 				when NilClass
# 				when Hash
# 					options = action
# 				when String, Symbol
# 					action = action.to_s
# 					key = action.include?(//) ? :file : :action
# 					options[key] = action
# 				else
# 					options[:partial] = action
# 				end

# 				options
# 			end

# 		end
# 	end
# end