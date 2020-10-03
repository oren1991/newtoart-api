class ContentsPropertiesSerializer < ActiveModel::Serializer
  attributes :id, :name, :value, :icon

  def name
    object.property.name
  end

  def icon
    object.property.icon
  end
end
