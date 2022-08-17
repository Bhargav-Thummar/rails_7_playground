class Comment < ApplicationRecord
  # assoications
  belongs_to :quote

  # validations
  validates :body, presence: true

  # scopes
  scope :ordered, -> { order(id: :desc) }
end
