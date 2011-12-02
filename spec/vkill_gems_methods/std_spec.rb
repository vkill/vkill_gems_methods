#encoding: utf-8
require "spec_helper"

describe VkillGemsMethods::STD do
  describe VkillGemsMethods::STD::Display do
    def reset_subject(*options, &block)
      options = options.extract_options!
      header = options.delete(:header) || :header
      text = options.delete(:text) || :text
      color = options.delete(:color) || :green
      rjust_integer = options.delete(:rjust_integer) || 12
      VkillGemsMethods::STD::Display.new(
            :header => header, :text => text, :color => color, :rjust_integer => rjust_integer , &block)
    end

    it "instance var should default set" do
      subject = reset_subject()
      subject.header.should == 'header'
      subject.text.should == "text"
      subject.color.should == 'green'
      subject.rjust_integer.should == 12
    end
    it "output match" do
      subject = reset_subject()
      subject.output.should match(/^\e\[[0-9]{2}m[\w ]+\e\[0m /)
    end
    it "instance var should set" do
      subject = reset_subject(:header => :error, :text => 123, :color => :red, :rjust_integer => 10)
      subject.header.should == 'error'
      subject.text.should == "123"
      subject.color.should == 'red'
      subject.rjust_integer.should == 10
      subject.output.should == "\e[31m     Error\e[0m  123"
    end

  end
end

