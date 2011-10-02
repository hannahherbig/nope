require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

context "Status model" do
  context 'new' do
    setup { Status.new }

    denies_topic.nil
  end
end
