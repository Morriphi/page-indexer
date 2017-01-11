require 'test_helper'
require 'webmock/minitest'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should list pages" do
    get '/pages', as: :json
    assert_response :success
  end

  test "should create page" do
    url = 'http://someurl.com'
    stub_request(:get, url).to_return(:status => 200, 
                                      :body => '<html><h1>Heading</h1><h2>Subheading</h2><h3>Sub-subheading</h3><a href="/somewhere">Link</a>')
    
    assert_difference('Page.count') do
      post '/pages', params: { 'url': url }, as: :json
    end

    assert_response :created
    assert_equal ["Heading"], response.parsed_body['h1']
    assert_equal ["Subheading"], response.parsed_body['h2']
    assert_equal ["Sub-subheading"], response.parsed_body['h3']
    assert_equal ["/somewhere"], response.parsed_body['links']
  end
end
