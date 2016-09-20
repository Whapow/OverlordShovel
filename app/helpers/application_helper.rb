module ApplicationHelper

	def header(text)
	  content_for(:header) { text.to_s }
	end

  def is_controller?(controller_name)
    params[:controller] == controller_name ? 'active' : ''
  end

end
