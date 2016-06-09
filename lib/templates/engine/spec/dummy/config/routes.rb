Rails.application.routes.draw do
  mount <%= name %>::Engine => '/<%= file_name %>'
end
