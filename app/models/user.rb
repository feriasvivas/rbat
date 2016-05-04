class User < ActiveRecord::Base
  has_many :Incident
  belongs_to :institution
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  easy_roles :roles, method: :bitmask

  ROLES = %w[admin supervisor pesquisador]

  def roleLabel
    ROLES[self.roles/2]
  end

end
