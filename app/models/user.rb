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

  def friendslist
    @graph = facebook
    response = @graph.get_connections("me", "friends", api_version: "v2.0").each do |hash|
      self.friends.find_or_create_by(name: hash['name'],uid: hash['id'],user_id: self.id)
      end
  end

  private
  def facebook
  @facebook ||= Koala::Facebook::API.new(access_token)
  end

end
