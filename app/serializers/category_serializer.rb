class CategorySerializer < ActiveModel::Serializer
  attributes :id, :category_name, :category_description
end
