module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    # messages = resource.errors.messages.map { |attr,msg| content_tag(:li, msg.join(', ')) }.join

     html = <<-HTML
    <div class="container center waves-effect waves-light flash_message">
      <span class="waves-effect waves-light btn flash_message">
        #{messages}
      </span>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end