require 'spec_helper'

describe Announcement do
	context "validations" do

		before(:each) do
			@announcement = Factory.build(:announcement)
    end

    it "starts out valid" do
      @announcement.should be_valid
      @announcement.save
    end

		it 'must have a topic' do
			@announcement.topic = nil
			@announcement.should_not be_valid
    end

    it 'must have well formatted topic' do
			@announcement.topic = '123456$%#'
			@announcement.should_not be_valid
    end

    it 'must have a topic with minimum four characters' do
			@announcement.topic = 'job'
			@announcement.should_not be_valid
		end

    it 'must have content' do
			@announcement.content = nil
			@announcement.should_not be_valid
    end

    it 'must have content with minimum 5 characters' do
			@announcement.content = 'word'
			@announcement.should_not be_valid
    end

		it 'must have a kind' do
			@announcement.kind = nil
			@announcement.should_not be_valid
    end

  end
end
