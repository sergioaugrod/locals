module Session
  class DestroyService
    def initialize(session)
      @session = session
    end

    def call
      delete_session
    end

    private

    def delete_session
      @session.tap do |session|
        session.delete(:user_id)
      end
    end
  end
end
