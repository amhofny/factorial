json.metrics do
  json.array! @metrics, partial: "metrics/metric", as: :metric
end

json.by_minute do
  json.labels @by_minute.labels
  json.data @by_minute.data
end

json.by_hour do
  json.labels @by_hour.labels
  json.data @by_hour.data
end

json.by_day do
  json.labels @by_day.labels
  json.data @by_day.data
end
