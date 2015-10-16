class TeacherDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name} [#{academic_title}]"
  end
end
