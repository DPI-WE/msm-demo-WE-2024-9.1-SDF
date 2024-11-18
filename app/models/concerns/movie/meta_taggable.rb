module Movie::MetaTaggable
  extend ActiveSupport::Concern

  # Include helper modules to allow URL generation and asset management.
  # `Rails.application.routes.url_helpers` gives access to route helpers like `rails_blob_url`.
  include Rails.application.routes.url_helpers

  def to_meta_tags
    tags = {
      site: "Must See Movies",
      title: title,
      description: meta_description,
      og: {
        title: title,
        description: meta_description,
        site_name: "Must See Movies",
      }
    }

    if poster.attached?
      tags[:image] = rails_blob_url(poster)
      tags[:og][:image] = rails_blob_url(poster)
    end

    tags
  end

  def meta_description
    "#{director.name}, #{year}"
  end
end
