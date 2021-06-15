#!/usr/bin/ruby
# @Author: indigo
# @Date:   2021-06-15 10:04:58
# @Last Modified by:   Enoch Tamulonis
# @Last Modified time: 2021-06-15 16:12:37
class NoticesController < ApplicationController
  before_action :authenticate_user!
  def index
    @notices = Notice.where.not(target: current_user).order('created_at desc').limit(3)
    @my_notices = Notice.where(target: current_user).order('created_at desc')
  end

  def create
    @notice = Notice.create(notice_params)
    @notice.user = current_user
    @notice.save
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
  end

  private

  def notice_params
    params.require(:notice).permit(:target_id)
  end
end
