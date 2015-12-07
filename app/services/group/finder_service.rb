class Group
  class FinderService
    def initialize(attributes = nil)
      @attributes = attributes
    end

    def call
      if @attributes
        find_groups_by_attributes
      else
        find_all_groups
      end
    end

    private

    def find_all_groups
      Group.all
    end

    def find_groups_by_attributes
      Group.where(@attributes)
    end
  end
end
