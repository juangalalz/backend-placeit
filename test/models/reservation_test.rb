# == Schema Information
#
# Table name: reservations
#
#  id                  :bigint           not null, primary key
#  movie_id            :bigint           not null
#  reservation_date    :date             not null
#  identification_card :string           not null
#  full_name           :string           not null
#  email               :string           not null
#  phone               :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
