class User < ActiveRecord::Base
  has_many :loans

  def self.find_by_id_or_login user_id_or_login
    if id?(user_id_or_login)
      user = find(user_id_or_login)
    else
      user = find_by_login user_id_or_login
    end
    return user
  end

  def self.id?(user_id_or_login)
    numeric?(user_id_or_login)
  end

  def self.numeric?(object)
    true if Float(object) rescue false
  end
  
end
