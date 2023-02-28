class MissionSerializer < ActiveModel::Serializer
  attributes :id, :name, :distance_from_earth, :nearest_star, :image
  # belongs_to :planet

  def name
    self.object.planet.name
  end

  def distance_from_earth
    self.object.planet.distance_from_earth
  end

  def nearest_star
    self.object.planet.nearest_star
  end

  def image
    self.object.planet.image
  end

end
