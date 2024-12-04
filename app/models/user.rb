class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  after_create :create_profile
  accepts_nested_attributes_for :profile
  
  has_many :feed_items, dependent: :destroy
  has_many :scrolls
  
  validates :username, presence: true
  validate :email_format

  def create_profile
    Profile.create!(user: self, active: false)
  end
  
  def email_format
      unless email =~ /\A[\w+\-.]+@msudenver\.edu\z/i
          errors.add(:email, "must be an @msudenver.edu email address")
      end
  end



end
