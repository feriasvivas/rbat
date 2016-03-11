class User < ActiveRecord::Base
  before_create :skip_confirmation_notification!
  has_many :Incident
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def generate_confirmation_token
    super
    self.confirmation_sent_at = nil
  end

  def send_confirmation_instructions
    self.confirmation_sent_at = Time.now
    self.save!
    super
  end

end
