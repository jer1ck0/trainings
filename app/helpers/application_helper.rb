module ApplicationHelper

  def title_for(element)
    if element.is_a?(Training)
      return link_to "Тренировка #{element.id}", edit_training_path(element)
    end
  end

  def info_about(element)
    if element.is_a?(Training)
      return link_to "Тренировка #{element.id}", edit_training_path(element)
    end
  end

  def full_title(page_title = '')
    base_title = "Torres"
    if page_title.empty?
      base_title
    else
      "#{base_title} ::: #{page_title}"
    end
  end

  def is_dev_mode?
    request.headers["X-Dev"] == 'on' ? true : false
  end

  def page_bg(class_name = nil)
    return 'bg-development' if is_dev_mode?
    class_name.empty? ? "bg-gradient-3" : class_name
  end

  def flash_message
    ret = []
    flash.each do |key, value|
      next unless [:success, :warning, :danger, :info, :alert].include? key.to_sym
      ret << "<div class=\"alert alert-#{key}\">#{value}</div>"
    end
    ret.join.html_safe
  end

  def icon(shape, text = nil)
    p = []
    p << "<i class='fa fa-#{shape}'></i>"
    p << " #{text}" unless text.nil?
    p.join.html_safe
  end

  def resource_role(resource_type, resource_id)
    Role.find_by(resource_type:resource_type, resource_id:resource_id)
  end

end
