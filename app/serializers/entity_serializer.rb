class EntitySerializer < ActiveModel::Serializer
  attributes :id, :entity_email, :entity_name, :entity_telephone_number
end
