module ApplicationHelper
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?
    content_tag :div, capture(&block), class: css_class
  end

  def markdown(textArea)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, hard_wrap: true).render(textArea)
  end
end
