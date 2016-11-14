class UsersDatatable < BaseDatatable
  delegate :lock_url, :unlock_url, :edit_user_path, to: :@controller

  def columns
    %w[name email institutions.name roleLabel locked_at created_at]
  end

  def search_string
    "users.name ilike :search or users.email ilike :search or institutions.name ilike :search or to_char(users.created_at, 'DD/MM/YYYY') like :search or ('admin' ilike :search and roles = 1) or ('supervisor' ilike :search and roles = 2 ) or ('pesquisador' ilike :search and roles = 3)"
  end

  def joins(items)
    items.joins("LEFT JOIN institutions ON users.institution_id = institutions.id")
  end

  def data
    items.map do |user|
      institution = user.institution.name if user.institution
      is_locked = user.access_locked? ? 'Não' : 'Sim'
      created_at = user.created_at.strftime("%d/%m/%Y") if user.created_at
      actions = user.access_locked? ? link_to('Ativar', unlock_url(user)) : link_to('Desativar', lock_url(user))
      [
        link_to(user.name, edit_user_path(user)),
        user.email,
        institution,
        user.roleLabel,
        is_locked,
        created_at,
        actions
      ]
    end
  end
end
