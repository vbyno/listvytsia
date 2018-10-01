class Core::Social::FacebookAdapter < Core::Social::BaseAdapter
  def first_name
    name_parts.first
  end

  def last_name
    name_parts.last
  end

  def email
    response.info.email
  end

  def photo_url
    response.info.image
  end

  private

  def name_parts
    response.info.name.split
  end
end
