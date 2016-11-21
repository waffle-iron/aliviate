module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.messages.map { |attr,msg| content_tag(:li, msg.join(', ')) }.join

    html = <<-HTML
    <ul class="collapsible">
      <li>
        <div class="collapsible-header active center"><i class="material-icons error-icon">error</i> <span class="error-title"> ¡ UPS ! Algo ha sucedido </span> </div>
        <div class="collapsible-body center">
          <ul class="error-message">
            #{messages}
          </ul>
        </div>
      </li>
    </ul>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end
