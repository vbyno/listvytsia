Deface::Override.new(
  virtual_path: 'layouts/_footer',
  name: 'footer_latest_pages',
  insert_bottom: "[data-core-hook='latest_pages']",
  partial: 'app_component/overrides/latest_pages',
  namespaced: true
)
