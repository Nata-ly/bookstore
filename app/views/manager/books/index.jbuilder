json.success true
json.message ''
json.data @books do |book|
  json.(book, :id, :title, :picture_url, :description, :price, :author_id, :category_id)
end
