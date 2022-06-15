class Plan < ApplicationRecord
    validates :title, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :valid_eligiblity_range?

  def valid_eligiblity_range?
    return unless end_date? && start_date?

    if !end_date.after?(start_date)
      errors.add(:start_date, "は終了日時よりも前の日時にしてください")
    end
  end
end
