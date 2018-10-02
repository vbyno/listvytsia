class Core::Social::GoogleAdapter < Core::Social::BaseAdapter
  def first_name
    response.info.first_name
  end

  def last_name
    response.info.last_name
  end

  def email
    response.info.email
  end

  def photo_url
    response.info.image
  end
end
