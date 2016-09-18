attributes :id, :identifier, :body
collection chunks.map { |chunk| present(chunk) }
