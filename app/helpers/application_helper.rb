module ApplicationHelper
    def markdown(text)
        assembler = Redcarpet::Render::HTML.new(:hard_wrap => true)
        options = { :autolink => true, 
                    :no_intra_emphasis => true,
                    :space_after_headers => true }
        markdown = Redcarpet::Markdown.new(assembler, options)
        markdown.render(text).html_safe
    end
end
