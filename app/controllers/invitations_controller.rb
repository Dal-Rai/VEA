# class InvitationsController < Devise::InvitationsController
#   #before_action :authenticate_user!
#   #before_action :set_user, only: [:re_invite]
#
#   def create
#     binding.pry
#     authorize(:invitation)
#     @invite = ExternalUserInviter.new(invite_params)
#     unless @invite.save
#       invalid_resource!(@invite)
#     end
#   end
#
#   def update
#     binding.pry
#     @accept_invite = AcceptInvite.new(user_params)
#     if @accept_invite.save
#       sign_in(resource_name, @accept_invite.user)
#       render json: { user: @accept_invite.user.jwt }, status: :ok
#     else
#       invalid_resource!(@accept_invite)
#     end
#   end
#
#   def edit
#     binding.pry
#   end
#
#   def re_invite
#     binding.pry
#     authorize(@user)
#
#     unless @user.re_invite
#       invalid_resource!(@user)
#     end
#   end
#
#   def new
#     binding.pry
#     @user = User.find_by(invitation_token: params[:invitation_token])
#   end
#
#   def accept
#     binding.pry
#   end
#
#   private
#
#   def invite_params
#     params
#       .require(:users)
#       .permit(
#         profile_attributes,
#         user_roles_attributes: [
#           :roleable_id,
#           :roleable_type,
#           :role
#         ]
#       )
#   end
#
#   def user_params
#     params
#       .require(:users)
#       .permit(
#         :invitation_token,
#         :password,
#         :password_confirmation
#       )
#   end
#
#   def set_user
#     @user = User.find(params[:id])
#   end
# end