class User < ActiveRecord::Base
  #before_create :skip_confirmation_notification!
  has_many :Incident
  belongs_to :institution
  belongs_to :supervisor, class_name: "User"
  has_many :subordinates, class_name: "User", foreign_key: "supervisor_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  easy_roles :roles, method: :bitmask

  ROLES = %w[admin supervisor pesquisador]

  def roleLabel
    ROLES[self.roles/2]
  end

end
