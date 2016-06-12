module AppComponent
  class StaticPagePresenter < Core::BasePresenter
    presents :static_page

    def id
      static_page.id.to_s
    end
  end
end
