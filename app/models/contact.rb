class Contact < ApplicationRecord
  has_paper_trail versions: {scope: -> { order("id desc") }},
                  on: [:update],
                  only: [:email, :first_name, :last_name, :phone_number]

  default_scope {order(created_at: :desc)}

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
end
