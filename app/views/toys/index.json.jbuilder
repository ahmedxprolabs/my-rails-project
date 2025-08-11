json.array! @toys do |toy|
  json.extract! toy, :id, :name, :price, :in_stock
  json.description toy.description
end
