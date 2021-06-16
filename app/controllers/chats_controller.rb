#!/usr/bin/ruby
# @Author: Enoch Tamulonis
# @Date:   2021-06-15 19:46:28
# @Last Modified by:   Enoch Tamulonis
# @Last Modified time: 2021-06-16 17:54:50
class ChatsController < ApplicationController
  def create
    @chat = Chat.find_by(target_id: params[:chat][:target_id], user_id: current_user.id)
    @chat ||= Chat.find_or_initialize_by(user_id: params[:chat][:target_id], target_id: current_user.id)
    @chat.save if @chat.new_record?
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.update('main-modal-content', partial: 'chat_modal_content', locals: { chat: @chat })}
    end
  end
end
