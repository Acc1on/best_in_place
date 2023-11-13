require 'rails/railtie'
require 'action_view/base'

module BestInPlace
  class Railtie < ::Rails::Railtie #:nodoc:
    def rails_version
      Gem::Version.new(Rails::VERSION::STRING)
    end

    def rails_6_1?
      Gem::Requirement.new('~> 6.1.0').satisfied_by?(rails_version)
    end

    config.after_initialize do
      BestInPlace::ViewHelpers = if rails_6_1?
                                    ActionView::Base.new(ActionView::LookupContext.new([]), {}, {})
                                  else
                                    ActionView::Base.new
                                  end
    end
  end
end
