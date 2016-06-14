Deface::Override.new(
  virtual_path: 'layouts/core/_header',
  name: 'header_navigation_menu',
  insert_bottom: "[data-core-hook='navigation_menu']",
  partial: 'app_component/overrides/navigation_menu',
  namespaced: true
)
