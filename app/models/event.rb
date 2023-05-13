class Event < ApplicationRecord
  belongs_to :host, class_name: 'User'

  validates :title, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
