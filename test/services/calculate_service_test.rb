class CalculateServiceTest < ActiveSupport::TestCase
  test "should get metrics_avg_by_minute" do
    service = CalculateService.new([])
    result = service.metrics_avg_by_minute
    assert_equal result[0].size, 60
    assert_equal result[1].sum, 0
  end

  test "should get metrics_avg_by_hour" do
    service = CalculateService.new([])
    result = service.metrics_avg_by_hour
    assert_equal result[0].size, 24
    assert_equal result[1].sum, 0
  end

  test "should get metrics_avg_by_day" do
    service = CalculateService.new([])
    result = service.metrics_avg_by_day
    assert_equal result[0].size, 31
    assert_equal result[1].sum, 0
  end

  test "should get avg" do
    service = CalculateService.new([])
    result = service.avg([1])
    assert_equal result, 1
  end
end
