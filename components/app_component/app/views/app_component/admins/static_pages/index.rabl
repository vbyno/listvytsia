attributes :id, :title, :permalink, :content, :published
collection static_pages.map { |static_page| present(static_page) }
