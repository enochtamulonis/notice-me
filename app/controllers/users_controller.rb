#!/usr/bin/ruby
# @Author: Enoch Tamulonis
# @Date:   2021-06-15 10:43:15
# @Last Modified by:   Enoch Tamulonis
# @Last Modified time: 2021-06-16 20:34:41
class UsersController < ApplicationController
  def search
    @search_results = User.where('lower(username) LIKE lower(?)', "%#{params[:q]}%")
    render turbo_stream: turbo_stream.update('search-results',
      partial: 'search_result',
      collection: @search_results
    )
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
