require 'term/ansicolor'

module VkillGemsMethods
  module STD
    class Display

      ANSI_COLOR = %w(black red green yellow blue magenta cyan white)

      attr_reader :header, :text, :color, :rjust_integer, :output

      def initialize(*options, &block)
        options = options.extract_options!
        header = options.delete(:header) || "info"
        text = options.delete(:text) || ""
        color = options.delete(:color) || 'green'
        rjust_integer = options.delete(:rjust_integer) || 12

        @header = header.to_s
        @text = text.to_s
        @color = ANSI_COLOR.include?(color.to_s) ? color.to_s : 'green'
        @rjust_integer = rjust_integer.to_i

        @c = Term::ANSIColor
        @output = ""

        @output << eval("#{@c}.#{@color}")
        @output << @header.capitalize.rjust(@rjust_integer)
        @output << @c.clear
        @output << "  #{ @text }"
      end
    end
  end
end

