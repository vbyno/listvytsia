module ApplicationHelper
  def present(object, presenter_class = nil)
    presenter_class ||=
      begin
        "#{object.class}Presenter".constantize
      rescue
        "#{object.class.base_class}Presenter".constantize
      end

    presenter = presenter_class.new(object, self)

    yield(presenter) if block_given?
    presenter
  end

  def no_turbolink_link_to(*params)
    options = params.extract_options!.merge('data-no-turbolink': true)

    link_to *params, options
  end

  def phone_link_to(phone_number)
    link_to phone_number, Phone.new(phone_number).link_tel
  end

  def static_page_path(static_page)
    public_send "#{static_page.permalink}_path"
  end
end
