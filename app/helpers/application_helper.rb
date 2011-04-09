module ApplicationHelper
	#set basic title if nothing else specified, else add it to the end
	def title
		base_title = "Artgallery"
		if @title.nil?
			base_title
		else
			"#{base_title} - #{@title}"
		end
	end
end
