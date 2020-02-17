class MovieSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :description,
              :image_url,
              :movie_date,
              :created_at
end
