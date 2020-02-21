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

class ReservationSerializer < ActiveModel::Serializer
  attributes  :id,
              :movie_id,
              :identification_card,
              :full_name,
              :email,
              :phone,
              :movie_name,
              :created_at

  has_one :movie
end
