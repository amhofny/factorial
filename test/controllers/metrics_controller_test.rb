require "test_helper"

class MetricsControllerTest < ActionDispatch::IntegrationTest
  include ActionCable::TestHelper

  setup do
    @metric = metrics(:one)
  end

  test "should get index" do
    get metrics_url, as: :json
    assert_response :success
  end

  test "should create metric" do
    channel_name = 'metrics_channel'
    assert_broadcasts channel_name, 0

    assert_difference('Metric.count') do
      post metrics_url, params: { metric: { name: @metric.name, value: @metric.value } }, as: :json
    end

    assert_broadcasts channel_name, 1
    assert_response 201
  end
end
