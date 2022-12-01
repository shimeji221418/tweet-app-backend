class UserSerializer < ActiveModel::Serializer
  attributes :id , :name , :email , :uid , :created_at

  has_many :posts
end
