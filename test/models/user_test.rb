require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

context "User model" do
  context 'new' do
    setup { User.new }

    denies_topic.nil
  end
end
