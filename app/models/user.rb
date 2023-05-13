class User < ApplicationRecord
  has_many :hosted_Events, foreign_key: :host_id, class_name: 'Event'
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  validates :username, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
