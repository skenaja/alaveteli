require File.dirname(__FILE__) + '/../../spec_helper'

describe 'when viewing the request game' do 
    
    before do 
        @mock_body = mock_model(PublicBody, :name => 'test body',
                                            :url_name => 'test_body',
                                            :is_school? => false)
        @mock_user = mock_model(User, :name => 'test user',
                                      :url_name => 'test_user',
                                      :profile_photo => nil)
        @mock_request = mock_model(InfoRequest, :title => 'test request',
                                                :awaiting_description => false, 
                                                :law_used_with_a => 'A Freedom of Information request',
                                                :law_used_full => 'Freedom of Information',
                                                :public_body => @mock_body,
                                                :url_title => 'a_test_request',
                                                :user => @mock_user, 
                                                :calculate_status => 'waiting_response', 
                                                :date_response_required_by => Date.today,
                                                :prominence => 'normal',
                                                :initial_request_text => 'hi there',
                                                :display_status => 'Awaiting categorisation',
                                                :created_at => Time.now)
        assigns[:league_table_28_days] = []
        assigns[:league_table_all_time] = []
        assigns[:requests] = [@mock_request]
        assigns[:play_urls] = true
    end
    
    it 'should show the correct url for a request' do
        render "request_game/play"
        response.should include_text("/categorise/request/a_test_request")
    end


end
