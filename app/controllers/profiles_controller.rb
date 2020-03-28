class ProfilesController < ApplicationController
  def index
  @user = User.find(params[:user_id])
  @profile = @user.profile
end

# GET /users/1/profiles/1
def show
@user = User.find(params[:user_id])
# For URL like /movies/1/reviews/2
# Find an review in movies 1 that has id=2
@profile = @user.profile
@current = current_user

@userproducts = Product.all.where("user_id =", "%" + params[:user_id] + "%")
@user_decorator = helpers.decorate(current_user)
@following = @user.active_relationships
end

# GET /users/1/profiles/new
def new
@user = User.find(params[:user_id])
# Associate an review object with movie 1
@profile = @user.build_profile
end

# POST /movies/1/reviews
def create
@user = User.find(params[:user_id])
@profile = @user.build_profile(params.require(:profile).permit(:name , :gender, :age, :location))
if @profile.save

redirect_to user_profile_url(@user, @profile)
else
render :action => "new"
end

end







end
