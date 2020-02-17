# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text             not null
#  image_url   :text             not null
#  movie_date  :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Movie < ApplicationRecord
  validates :name, presence: { message: 'Se requiere Nombre' }
  validates :description, presence: { message: 'Se requiere Descripcion' }
  validates :image_url, presence: { message: 'Se requiere Imagen' }
  validates :movie_date, presence: { message: 'Se requiere Fecha de pelicula' }

  has_many :reservations, dependent: :destroy
end
