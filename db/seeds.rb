puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')

3.times do
  Teacher.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
5.times do
  SubjectItem.create!(
      title: Faker::Lorem.sentence,
      teacher: teachers.sample
  )
end

25.times do
  Student.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birthdate: rand(365).days.ago(Date.today) - (rand(5)+20).years
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

Student.all.each do |student|
  student.payments << Payment.create(student: student,
                                     amount: 300.00,
                                     date: rand(31).days.ago(Date.today.beginning_of_month))
  student.payments << Payment.create(student: student,
                                     amount: 350.00,
                                     date: (rand(31)+31).days.ago(Date.today.beginning_of_month))
  student.payments << Payment.create(student: student,
                                     amount: 400.00,
                                     date: (rand(31)+62).days.ago(Date.today.beginning_of_month))
end

puts "Seeds: done"