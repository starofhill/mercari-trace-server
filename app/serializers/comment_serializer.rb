class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_name, :created_at

  def user_name
    object.user.name
  end
end
