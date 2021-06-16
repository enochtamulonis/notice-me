#!/usr/bin/ruby
# @Author: Enoch Tamulonis
# @Date:   2021-06-16 17:24:59
# @Last Modified by:   Enoch Tamulonis
# @Last Modified time: 2021-06-16 17:41:04
class MessagesController < ApplicationController
  before_action :set_chat
  before_action :authenticate_user!

  def create
    @message = @chat.messages.create(message_params)
    @message.user = current_user
    if @message.save
      render turbo_stream: turbo_stream.update(
        'new_chat_message', partial: 'form', locals: { chat: @chat }
      )
    else
      render turbo_stream: turbo_stream.update(
        'new_chat_message', partial: 'form', locals: { chat: @chat, errors: @message.errors.full_messages }
      )
    end
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
