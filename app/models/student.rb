class Student < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :subject_item_notes, dependent: :destroy
  has_many :subject_items, through: :participations
  has_many :payments

  validates :first_name, :last_name, presence: true
  validate do |student|
    unless student.birthdate.nil?
      if student.birthdate > 20.years.ago
        errors.add(:birthdate, "Too young for being a student")
      end
    end
  end

  accepts_nested_attributes_for :subject_items
end
