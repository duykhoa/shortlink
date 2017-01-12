class ShortUrl < ActiveRecord::Base
  def self.all_by_user_id(user_id)
    select(:full_url, :id).where(user_id: user_id)
  end
end
