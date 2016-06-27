Rails.application.routes.draw do
  constraints subdomain: 'www' do
    get ':any', to: redirect(subdomain: nil, path: '/%{any}'), any: /.*/
  end

  mount AppComponent::Engine, at: '/', as: :app_component
end
