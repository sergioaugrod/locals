module Errors
  class Mapping
    def self.config(exception)
      config = Rails.application.config.errors['exceptions']

      if config[exception.to_s]
        config[exception.to_s]
      else
        config['Default']
      end
    end
  end
end
