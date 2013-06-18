module ApplicationHelper
  def error_div(errors, &block)
    content_tag :div, id: 'error_explanation', &block if errors.any?
  end

  def error_list(errors)
    content_tag :ul do
      errors.full_messages.each do |msg|
        concat content_tag :li, msg
      end
    end
  end
end
