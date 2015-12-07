class Group
  class CreateService
    def initialize(group)
      @group = group
    end

    def call
      create_group_and_first_user
    end

    private

    def create_group_and_first_user
      Group.create!(@group).tap do |group|
        GroupUser.create!(user: group.creator, group: group)
      end
    end
  end
end
