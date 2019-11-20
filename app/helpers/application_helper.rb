module ApplicationHelper

	def bootstrap_class_for(flash_type)
	  { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
	end

	def flash_messages(opts = {no_x: false})
		flash.each do |msg_type, message|
			puts "flash_msg_type: #{msg_type.class}"
			puts "flash_message: #{message}"
			concat(
				content_tag(:div, class: "container-fluid", style: "padding-top:1rem;") do
					concat(
						content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type.to_sym)}", role: "alert") do
							concat content_tag(:button, '<span aria-hidden="true">&times;</span>'.html_safe, class: "close close-alert", data: { dismiss: 'alert' }) unless opts[:no_x]
							concat content_tag(:span, message.html_safe, class: 'message')
						end
					)
				end
			)
		end
		nil
	end

end
