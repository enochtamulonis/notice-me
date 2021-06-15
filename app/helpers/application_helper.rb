module ApplicationHelper
  def notice_exists?(user, target)
    Notice.where(user: user, target: target).any?
  end
end
