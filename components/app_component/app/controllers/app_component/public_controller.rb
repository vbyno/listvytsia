module AppComponent
  class PublicController < Core::ApplicationController
    helper ::Pictures::PicturesHelper,
           ::SeoContents::SeoContentsHelper,
           ::AppComponent::ApplicationHelper
  end
end
