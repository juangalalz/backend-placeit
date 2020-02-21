# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text             not null
#  image_url   :text             not null
#  start_date  :date             not null
#  final_date  :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MovieSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :description,
              :image_url,
              :start_date,
              :final_date,
              :created_at,
              :number_reservations

end
