class User < ApplicationRecord
  after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  has_many :events_hosted, foreign_key: 'admin_id', class_name: "Event", dependent: :destroy
  has_many :attendances
  has_many :events, through: :attendances
  
  has_one_attached :avatar

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
end
