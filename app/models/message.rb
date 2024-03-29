class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  after_create_commit { broadcast_append_to ActionView::RecordIdentifier.dom_id(chat), :messages}
end
