class Event < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :attendances
  has_many :attendees, thorugh: :attendances, source: :user

  validates :title, presence: true
  validates :date, presence: true
  validates :location, presence: true
  
  scope :in_the_past, -> { where('date < ?', DateTime.now) }
  scope :upcoming, -> { where('date > ?', DateTime.now) }
end
