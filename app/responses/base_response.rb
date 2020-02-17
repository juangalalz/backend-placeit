class BaseResponse
  include ActiveModel::Model
  include ActiveModel::Serialization
  attr_accessor :data
  attr_accessor :message
end
