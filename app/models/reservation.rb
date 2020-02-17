# == Schema Information
#
# Table name: reservations
#
#  id                  :bigint           not null, primary key
#  movie_id            :bigint           not null
#  identification_card :string           not null
#  full_name           :string           not null
#  email               :string           not null
#  phone               :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Reservation < ApplicationRecord
  validates :identification_card, presence: { message: 'Se requiere Cedula' }
  validates :full_name, presence: { message: 'Se requiere Nombre' }
  validates :email, presence: { message: 'Se requiere Email' }
  validates :phone, presence: { message: 'Se requiere phone' }

  belongs_to :movie

  def chairs_available?
    return Reservation.where(movie_id: movie_id).count < 10
  end

end
