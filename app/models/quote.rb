class Quote < ApplicationRecord
  # assoications
  belongs_to :company
  has_many :comments, dependent: :destroy
  has_many :line_item_dates, dependent: :destroy
  has_many :line_items, through: :line_item_dates

  # validations
  validates :name, presence: true

  # scopes
  scope :ordered, -> { order(id: :desc) }

  # callbacks
  # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
  after_create_commit -> { broadcast_prepend_to [company, "quotes"] }
  after_update_commit -> { broadcast_replace_to [company, "quotes"], target: "main__quote_#{self.id}" }
  after_destroy_commit -> { broadcast_remove_to [company, "quotes"], target: "main__quote_#{self.id}" }

  def total_price
    line_items.sum(&:total_price)
  end
end
