module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_filter :set_page_defaults
    end

    def set_page_defaults
        @page_title = "Credible Food Project"
        @seo_keywords = "Credible Food Project - Sustainable, profitable farming that improves food quality and biodiversity"
    end
end