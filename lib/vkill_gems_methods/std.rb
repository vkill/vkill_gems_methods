module VkillGemsMethods
  module STD
    class Display
      ANSI_COLOR = { :black => 30, :red => 31, :green => 32, :yellow => 33, :blue => 34,
                      :magenta => 35, :cyan => 36, :white => 37 }

      attr_reader :header, :text, :color, :output

      def initialize(*options, &block)
        options = options.extract_options!
        header = options.delete(:header) || "header"
        text = options.delete(:text) || "text"
        color = options.delete(:color) || :green
        rjust_integer = options.delete(:rjust_integer) || 20

        @header = header.to_s
        @text = text.to_s
        @color = color.to_sym
        @rjust_integer = rjust_integer.to_i

        @output = ""
        @ansi_color = ANSI_COLOR[@color] || ANSI_COLOR[:green]

        @output << "\033[1m\033[#{ @ansi_color }"
        @output << @header.capitalize.rjust(@rjust_integer)
        @output << "\033[0m"
        @output << "  #{ @text }"
      end
    end
  end
end

