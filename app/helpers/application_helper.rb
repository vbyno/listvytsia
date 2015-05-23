module ApplicationHelper
  def no_turbolink_link_to(*params)
    options = params.extract_options!.merge('data-no-turbolink': true)

    link_to *params, options
  end
end
