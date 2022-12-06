class Metric < ApplicationRecord
  default_scope {order(created_at: :desc)}

  validates :name, presence: true
  validates :value, presence: true
end
