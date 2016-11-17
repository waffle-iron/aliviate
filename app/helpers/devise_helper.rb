module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.messages.map { |attr,msg| content_tag(:li, msg.join(', ')) }.join

    html = <<-HTML
    <div class="row center">
      <div class="col s12">
        <div class="card-panel">
          <h4> Faltan algunos campos por llenar </h4>
          <ul>
            #{messages}
          </ul>
        </div>
      </div>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end
