class StudentDecorator < BaseDecorator
  include ActionView::Helpers::NumberHelper

  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = subject_item.subject_item_notes.where(student: self)

    if notes.count == 0
      number_with_precision(0, precision: 2)
    else
      sum = 0
      notes.each do |i|
        sum += i.value
      end

      avg = sum.to_f/notes.count
      number_with_precision(avg, precision: 2)
    end
  end

  def formatted_date
    if !self.birthdate.nil?
      self.birthdate.strftime("%Y-%m_%d")
    else
      return "-"
    end
  end
end