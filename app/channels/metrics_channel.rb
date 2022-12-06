class MetricsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "metrics_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
