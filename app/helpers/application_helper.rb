module ApplicationHelper
	def active_link(link)
    return 'active' if current_page?(link) #params[:controller] == link
    return ''
  end

  def render_link(title, path, icon)
    "<li class=#{active_link(path)}><a href=#{path}><i class='#{icon}'></i> #{title}</a></li>".html_safe
	end

	def auth_pages?
		current_page = new_user_session_url
	end

	def current_user_signups
		Exam.joins(:signups).where(signups: {user_id: current_user.id}).order(start_date: :asc)
	end

	def next_signup
		(current_user_signups.first.start_date - Time.zone.now).to_i / 1.day
	end
end
