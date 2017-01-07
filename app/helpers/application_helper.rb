module ApplicationHelper
	def active_link(link)
    return 'active' if params[:controller] == link
    return ''
  end

  def render_link(title, path)
    "<li class=#{active_link(title.downcase)}>#{link_to(title, path)}</li>".html_safe
	end

	def auth_pages?
		current_page = new_user_session_url
	end

	def first_signup
		Exam.joins(:signups).where(signups: {user_id: current_user.id}).first
	end
end
