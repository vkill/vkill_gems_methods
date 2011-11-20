module VkillGemsMethods
  module Rails
    module Generators
      module Base
        extend ActiveSupport::Concern

        module ClassMethods

        end

        module InstanceMethods
          def say_custom(type='warn', text) #example, type choise in FATAL,ERROR,WARN,INFO,DEBUG
            ansicolor = #more ansicolor => https://github.com/flori/term-ansicolor
              case type.downcase.to_s
              when 'fatal'; '31m'
              when 'error'; '31m'
              when 'warn'; '36m'
              when 'info'; '32m'
              when 'debug'; '34m'
              else; '0m'
              end
            say "\033[1m\033[#{ ansicolor }" + type.to_s.upcase.rjust(10) + "\033[0m" + "  #{text}"
          end
          def say_fatal(text); say_custom('fatal', text); exit; end
          def say_error(text); say_custom('error', text); exit; end
          def say_warn(text); say_custom('warn', text); end
          def say_info(text); say_custom('info', text); end
          def say_debug(text); say_custom('debug', text); end
        end
      end
    end
  end
end

