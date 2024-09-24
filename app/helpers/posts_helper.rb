module PostsHelper
  class HTMLRenderer < Redcarpet::Render::HTML
    def header(text, header_level)
      header_level = [header_level, 3].min
      "<h#{header_level}>#{text}</h#{header_level}>"
    end
  end

  def md_to_html(text)
    renderer = HTMLRenderer.new
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text).html_safe
  end
end
