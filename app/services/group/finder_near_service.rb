class Group
  class FinderNearService
    def initialize(attributes, distance = 6)
      @distance = distance
      @latitude = attributes[:latitude]
      @longitude = attributes[:longitude]
    end

    def call
      find_near_groups
    end

    private

    def find_near_groups
      Group.within(@distance, origin: [@latitude, @longitude])
    end
  end
end
