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

require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
