require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'roles bitmask' do
    it 'defaults to 0' do
      expect(User.new.roles).to eq(0)
    end

    it 'assigns an integer mask' do
      expect(User.new(roles: 2).roles).to eq(2)
    end

    it 'clears with an empty array' do
      user = User.new(roles: 2)
      user.roles = []
      expect(user.roles).to eq(0)
    end

    it 'adds roles by mask string and name' do
      user = User.new
      user.add_role('2')
      user.add_role('pesquisador')
      expect(user.roles).to eq(6)
    end

    it 'answers role predicates' do
      user = User.new(roles: 1)
      expect(user.is_admin?).to be(true)
      expect(user.is_supervisor?).to be(false)
      expect(user.is_pesquisador?).to be(false)
    end

    it 'labels roles like before' do
      expect(User.new(roles: 1).roleLabel).to eq('admin')
      expect(User.new(roles: 2).roleLabel).to eq('supervisor')
      expect(User.new(roles: 4).roleLabel).to eq('pesquisador')
    end
  end
end
