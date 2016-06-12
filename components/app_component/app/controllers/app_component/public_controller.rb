module AppComponent
  class PublicController < Core::ApplicationController
    helper ::Pictures::PicturesHelper,
           ::SeoContents::SeoContentsHelper
  end
end
