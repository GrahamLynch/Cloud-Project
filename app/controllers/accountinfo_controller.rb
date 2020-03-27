class AccountinfoController < ApplicationController
def index
  @user_decorator = helpers.decorate(current_user)
end
end
