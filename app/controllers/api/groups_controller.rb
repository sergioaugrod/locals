module Api
  class GroupsController < ApplicationController
    before_action :verify_authentication

    def index
      @groups = Group::FinderService.new.call
    end

    def create
      @group = Group::CreateService.new(create_group_params).call
      render :show, status: 201
    end

    def near
      @groups = Group::FinderNearService.new(near_groups_params).call
    end

    private

    def create_group_params
      params.require(:group)
        .permit(:name, :latitude, :longitude, :active, :private, :password, :logo)
        .merge(creator: @current_user)
    end

    def near_groups_params
      params.require(:group).permit(:latitude, :longitude)
    end
  end
end
