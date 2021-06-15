class Notice < ApplicationRecord
  belongs_to :user
  belongs_to :target, class_name: 'User', foreign_key: 'target_id'
  after_create_commit do
    broadcast_prepend_to :notices
    broadcast_prepend_later_to(
      ActionView::RecordIdentifier.dom_id(target, :notices),
      partial: 'notices/notice',
      locals: { user: target}
    )
  end
  after_destroy_commit { broadcast_remove_to :notices }
end
