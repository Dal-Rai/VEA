class UsersInvitationsController < ApplicationController

  def valid_token
    @user = User.find_by(invitation_token: params[:invitation_token])
    if @user.present?
    else

    end
  end

  def accept_invitation
    @user = User.find(params[:id])

    @accept_invite = AcceptInvite.new(user_params)
    if @accept_invite.save
      sign_in(:user, @accept_invite.user)
      redirect_to :controller => 'student', :action => 'show'
      #render json: { user: @accept_invite.user.jwt }, status: :ok
    else
      invalid_resource!(@accept_invite)
    end
  end

  private

  def user_params
    params.permit(:password, :password_confirmation, :invitation_token)
  end
end
