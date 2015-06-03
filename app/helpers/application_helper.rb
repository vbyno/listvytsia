module ApplicationHelper
  def no_turbolink_link_to(*params)
    options = params.extract_options!.merge('data-no-turbolink': true)

    link_to *params, options
  end

  def phone_link_to(phone_number)
    link_to phone_number, Phone.new(phone_number).link_tel
  end
end
