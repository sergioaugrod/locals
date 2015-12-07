module Api
  class GroupUsersController < ApplicationController
    before_acion :verify_authentication

    def create
      @group_user = GroupUser::CreateService.new(create_group_user_params, @current_user)
      render :show, status: 201
    end

    private

    def create_group_user_params
      params.require(:group)
        .permit(:id)
    end
  end
end
