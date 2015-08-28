class User < ActiveRecord::Base
has_many :friends

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.access_token = auth["credentials"]["token"]
    end
  end

# raise response.inspect

  def friendslist
    @graph = facebook
    # raise @graph.get_connections("me", "friends", api_version: "v2.0").inspect
    response = @graph.get_connections("me", "friends", api_version: "v2.0").each do |hash|
      self.friends.find_or_create_by_name_and_uid_and_user_id(hash['name'], hash['id'], self.id)
    end

  end

  private
  def facebook
  # access_token = User.find(session[:user_id]).access_token
  @facebook ||= Koala::Facebook::API.new(access_token)
  end

end