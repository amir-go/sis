module ApplicationHelper
	def active_link(link)
    return 'active' if params[:controller] == link
    return ''
  end

  def render_link(title, path)
    "<li class=#{active_link(title.downcase)}>#{link_to(title, path)}</li>".html_safe
	end
end
