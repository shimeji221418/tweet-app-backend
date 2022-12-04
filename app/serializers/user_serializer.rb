class UserSerializer < ActiveModel::Serializer
  attributes :id , :name , :email , :uid , :icon, :created_at

  has_many :posts
end
