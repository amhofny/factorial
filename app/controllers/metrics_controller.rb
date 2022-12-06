class MetricsController < ApplicationController
  # GET /metrics
  # GET /metrics.json
  def index
    @metrics = Metric.all
    # TODO: not working in Sqllist switch to mysql
    # @by_minute = Metric.select("minute(created_at), avg(value)")
    #                    .group("minute(created_at)")
    #                    .order("minute(created_at)")
    service = CalculateService.new(@metrics)
    @by_minute = service.metrics_avg_by_minute
    @by_hour = service.metrics_avg_by_hour
    @by_day = service.metrics_avg_by_day
  end

  # POST /metrics
  # POST /metrics.json
  def create
    @metric = Metric.new(metric_params)

    if @metric.save
      ActionCable.server.broadcast 'metrics_channel', @metric
      render :show, status: :created
    else
      render json: @metric.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def metric_params
      params.require(:metric).permit(:name, :value, :created_at)
    end
end
