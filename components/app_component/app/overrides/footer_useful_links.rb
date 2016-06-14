Deface::Override.new(
  virtual_path: 'layouts/core/_footer',
  name: 'footer_useful_links',
  insert_bottom: "[data-core-hook='useful_links']",
  partial: 'app_component/overrides/useful_links',
  namespaced: true
)
