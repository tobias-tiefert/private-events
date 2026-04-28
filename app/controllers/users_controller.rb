class UsersController < ApplicationController
  def show
    @user = User.find(Current.user.id)
  end
end
