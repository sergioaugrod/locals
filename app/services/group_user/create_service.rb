class GroupUser
  class CreateService
    def initialize(group, user)
      @group = group
      @user = user
    end

    def call
      create_group_user
    end

    private

    def create_group_user
      GroupUser.create!(user: @user, group: @group)
    end
  end
end
