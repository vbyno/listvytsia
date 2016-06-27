attributes :id, :link, :address, :title, :phone, :price, :published

node :picture_url do |hotel|
  if picture = Pictures::Picture.by_page_id(hotel.id).first
    picture.data.small.url
  else
    '#'
  end
end