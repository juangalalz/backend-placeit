class ReservationSerializer < ActiveModel::Serializer
  attributes  :id,
              :movie_id,
              :identification_card,
              :full_name,
              :email,
              :phone,
              :created_at

  has_one :movie
end
