class CalculateService
  Serie = Struct.new(:labels, :data)
  # TODO: move to background job and schedule
  def initialize(metrics)
    @metrics = metrics

    @by_minute = Serie.new((0..59).to_a, Array.new(60) { Array.new })
    @by_hour = Serie.new((0..23).to_a, Array.new(24) { Array.new })
    @by_day = Serie.new((1..31).to_a, Array.new(32) { Array.new })

    process
  end

  def process
    @metrics.each do |metric|
      minute = metric.created_at.min
      hour = metric.created_at.hour
      day = metric.created_at.day

      @by_minute.data[minute] << metric.value
      @by_hour.data[hour] << metric.value
      @by_day.data[day] << metric.value
    end
  end

  def metrics_avg_by_minute
    60.times.each do |m|
      @by_minute.data[m] = avg(@by_minute.data[m])
    end
    @by_minute
  end

  def metrics_avg_by_hour
    24.times.each do |h|
      @by_hour.data[h] = avg(@by_hour.data[h])
    end
    @by_hour
  end

  def metrics_avg_by_day
    32.times.each do |d|
      @by_day.data[d] = avg(@by_day.data[d])
    end
    @by_day
  end

  def avg(data)
    size = data.size
    sum = data.sum
    return 0 if size == 0

    (sum/size.to_f).round(2)
  end
end
