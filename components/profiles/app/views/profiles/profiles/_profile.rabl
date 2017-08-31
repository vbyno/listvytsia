attributes :id, :first_name, :last_name, :published

node :picture_url do |profile|
  if picture = Pictures::Picture.by_page_id(profile.id).first
    picture.data.small.url
  else
    '#'
  end
end
