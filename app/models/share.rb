class Share < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  def self.recents(current_user)
    all_shares_ordered = self.where(user: current_user).order(created_at: :desc)
    all_bookmarked_orders = Selection.where(user: current_user, bookmarked: true, recommended: nil).order(created_at: :desc)
    all_recent = all_shares_ordered + all_bookmarked_orders
    all_recent_ordered = all_recent.sort_by { |activity| activity.updated_at }.reverse_each
    six_recent = all_recent_ordered.reject do |activity|
        if !activity.restaurant.selections.find_by(user: current_user).nil?
          activity.restaurant.selections.find_by(user: current_user).recommended == true
        end
      end
    six_recent = six_recent.map { |activity| activity.restaurant}.uniq.first(6)
  end
end
