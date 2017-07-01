class Wiki < ApplicationRecord
  belongs_to :user, optional: true

  default_scope { order("created_at DESC") }

  has_many :collaborators
  has_many :collaborator_users, through: :collaborators, :source => :user
end
