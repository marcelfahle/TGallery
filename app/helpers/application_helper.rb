module ApplicationHelper
  def markdown(text)
    rndr = Redcarpet::Render::HTML.new(:hard_wrap => true)
    md = Redcarpet::Markdown.new(rndr, :autolink => true, 
                                 :space_after_headers => true)
    raw md.render(text)
  end
end
