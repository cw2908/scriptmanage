# Override default flash messages with SLDS
module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <div class="slds-text-heading_small slds-text-color_inverse">
        <h2>#{sentence}</h2>
      </div>
      <div class="slds-text-color_error">
        <ul class="slds-list_dotted">#{messages}</ul>
      </div>
    </div>
    HTML

    html.html_safe
  end
  def devise_error_messages?
    !resource.errors.empty?
  end
end