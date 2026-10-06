class User < ApplicationRecord
  #before_create :skip_confirmation_notification!
  has_many :Incident
  belongs_to :institution, optional: true
  belongs_to :supervisor, class_name: "User", optional: true
  has_many :subordinates, class_name: "User", foreign_key: "supervisor_id"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  # ponytail: inline bitmask replaces slow_your_roles gem; add a roles table if per-role data is ever needed
  ROLES = %w[admin supervisor pesquisador]

  def roles
    self[:roles] || 0
  end

  def roles=(value)
    mask = value.is_a?(Array) ? value.sum { |r| role_bit(r) } : value.to_i
    self[:roles] = mask
  end

  def add_role(role)
    self[:roles] = roles | role_bit(role)
  end

  def is_admin?
    (roles & 1) != 0
  end

  def is_supervisor?
    (roles & 2) != 0
  end

  def is_pesquisador?
    (roles & 4) != 0
  end

  def roleLabel
    ROLES[roles / 2]
  end

  private

  def role_bit(role)
    return role.to_i if role.to_s =~ /\A\d+\z/
    1 << ROLES.index(role.to_s)
  end

end
