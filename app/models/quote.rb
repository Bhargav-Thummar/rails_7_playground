class Quote < ApplicationRecord
  # assoications
  has_many :comments, dependent: :destroy

  # validations
  validates :name, presence: true

  # scopes
  scope :ordered, -> { order(id: :desc) }

  # callbacks
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
  after_create_commit -> { broadcast_prepend_to "quotes" }
  after_update_commit -> { broadcast_replace_to "quotes", target: "main__quote_#{self.id}" }
  after_destroy_commit -> { broadcast_remove_to "quotes", target: "main__quote_#{self.id}" }
end
