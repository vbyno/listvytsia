Deface::Override.new(
  virtual_path: 'layouts/_footer',
  name: 'footer_latest_pages',
  insert_bottom: "[data-core-hook='latest_pages']",
  partial: 'app_component/overrides/latest_pages',
  namespaced: true,
  original: 'ea198459fec98229eb65a46467e5aa4eb2f2b551'
)
