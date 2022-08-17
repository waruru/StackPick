class Users::IconController < ApplicationController
  def new
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(icon_params)
        format.turbo_stream { render layout: false, content_type: 'text/vnd.turbo-stream.html' }
        format.html { redirect_to account_url, notice: "Icon was successfully updated." }
      else
        format.html { redirect_to account_url, alert: "Icon was not successfully updated." }
      end
    end
  end

  private
    def icon_params
      params.require(:user).permit(:icon)
    end
end
