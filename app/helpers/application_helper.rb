module ApplicationHelper
	def tabify list
		r = '<ul class="nav nav-tabs">'
		active = true
		list.each_pair do |li, str|
			if content_for? li
				r << "
				"
				if active
					r << '<li class="active"><a data-toggle="tab" href="#'+li.to_s+'">'+str+'</a></li>'
					active = false
				else
					r << '<li><a data-toggle="tab" href="#'+li.to_s+'">'+str+'</a></li>'
				end
			end
		end
		r << '</ul>'
		r << "

		"
		r << '<div class="tab-content" style="border: thin inset black; margin-top: 0px; background-color: #fff; padding: 5px;">'
		list.each_pair do |li, str|
			if content_for? li
				if !active
					r << '<div class="tab-pane active" id="'+li.to_s+'">'
					active = true
				else
					r << '<div class="tab-pane" id="'+li.to_s+'">'
				end
				r << "
				"
				r << content_for(li)
				r << "
				"
				r << '</div>'
				r << "
				"
			end
		end
		r << '</div>'
		r.html_safe
	end

	def twitterized_type(type)
		case type
		when :alert
			"warning"
		when :error
			"error"
		when :notice
			"info"
		when :success
			"success"
		else
			type.to_s
		end
	end

	def time_delta time
		if time < Time.now
			distance_of_time_in_words_to_now(time) + " ago"
		else
			distance_of_time_in_words_to_now(time) + " from now"
		end
	end

	def truthy_thumb(value)
		if value=="*"
			i('star').html_safe
		elsif value
			i('thumbs-up').html_safe
		else
			i('thumbs-down').html_safe
		end
	end

	def i(c)
		('<i class="icon-' + c + ' icon-white"></i>').html_safe
	end

  def link_to_page x, n=nil
    link_to( (n ? n : x), find_pages_path(:name => x))
  end

  def btn x, url, c=nil
    link_to x, url, :class => (c ? "btn btn-#{c}": 'btn' )
  end
end
