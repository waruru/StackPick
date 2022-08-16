class Users::IconController < ApplicationController
  def new
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(icon_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@post, partial: "posts/post", locals: {post: @post}) }
        format.html { redirect_to account_url(@user), notice: "Icon was successfully updated." }
      end
    end
  end

  private
    def icon_params
      params.require(:user).permit(:icon)
    end
end
