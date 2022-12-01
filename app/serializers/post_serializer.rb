class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :user_id, :image, :created_at

  belongs_to :user
end
