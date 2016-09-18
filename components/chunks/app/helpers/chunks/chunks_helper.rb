module Chunks
  module ChunksHelper
    def chunks_chunk(identifier)
      chunk =  policy_scope(Chunks::Chunk).where(identifier: identifier).first

      render('chunks/chunks/chunk', chunk: chunk, identifier: identifier)
    end
  end
end
