class Quote < ApplicationRecord
  # assoications
  has_many :comments, dependent: :destroy

  # validations
  validates :name, presence: true

  # scopes
  scope :ordered, -> { order(id: :desc) }
end
