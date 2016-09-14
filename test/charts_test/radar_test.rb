require 'minitest/autorun'
require 'chart/my_chart_type'
require 'mock_data'

class TestRadar < MiniTest::Unit::TestCase

  def test_tojs    
    json = @ch.json
    assert_match /"type":"radar"."data":/, json
  end

  def setup
    MyChartType.load_concrete_charts
    @ch = MyChartType::Radar.new mock_xyz
  end
end
