#VkillGemsMethods

VkillGemsMethods is my'gems public methods.

* https://github.com/vkill/vkill_gems_methods


##Supported versions

* Ruby 1.8.7, 1.9.2, 1.9.3

* Rails 3.0.x, 3.1.x


##Usage Example

Use in rails generators

    class MyGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      include VkillGemsMethods::Rails::Generators::Base
      ActiveRecord::Base.send :include, VkillGemsMethods::ActiveRecord::Base #can use ActiveRecord::Base.models
      def create_file_test
        say_info "test say_info method, method from VkillGemsMethods::Rails::Generators::Base"
        ActiveRecord::Base.models do |model|
        end
      end
    end

Use in bin output

    STDOUT.puts VkillGemsMethods::STD::Display.new(
                  :header => :error, :text => 123, :color => :red, :rjust_integer => 10
                ).output

##Copyright

Copyright (c) 2011 vkill.net .

