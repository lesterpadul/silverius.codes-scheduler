class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :image_url

  def image_url
    "hahaha"
  end
end
