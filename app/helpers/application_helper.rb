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
	
	def facebook_like(default = nil)
	  if default.nil?
      content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=#{CGI::escape(request.url)}&layout=button_count&show_faces=false&width=200&action=like&font=arial&colorscheme=light&height=80", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :class => :facebook
    else
      content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=http://www.facebook.com/apps/application.php?id=214605415217989&layout=button_count&show_faces=false&width=200&action=like&font=arial&colorscheme=light&height=80", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :class => :facebook
    end
  end
end
