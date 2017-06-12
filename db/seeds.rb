User.destroy_all

    u1 = User.create({
    name: "Joe Bloggs",
    email: "joe@email.com",
    skills: "JavaScript",
    learning: "HTML",
    localtime: "7",
    bio: "Currently learning JavaScript.",
    image: "http://fillmurray.com/200/200",
    location: "Sydney",
    password: "chicken",
    password_confirmation: "chicken"
    })

    u2 = User.create({
    name: "Hannah Grey",
    email: "hannah@email.com",
    skills: "HTML, CSS",
    learning: "JavaScript",
    localtime: "7",
    bio: "Currently learning JavaScript.",
    image: "http://fillmurray.com/200/200",
    location: "Sydney",
    password: "chicken",
    password_confirmation: "chicken"
    })

    u3 = User.create({
    name: "Sarah Gill",
    email: "sarah@email.com",
    skills: "Python, Java",
    learning: "CSS, HTML",
    localtime: "7",
    bio: "Currently learning JavaScript.",
    image: "http://fillmurray.com/200/200",
    location: "Sydney",
    password: "chicken",
    password_confirmation: "chicken"
    })

    u4 = User.create({
    name: "Bob Bloom",
    email: "bob@email.com",
    skills: "Ruby, Ruby on Rails",
    learning: "PHP",
    localtime: "7",
    bio: "Currently learning JavaScript.",
    image: "http://fillmurray.com/200/200",
    location: "Sydney",
    password: "chicken",
    password_confirmation: "chicken"
    })

    u5 = User.create({
    name: "Bill Murray",
    email: "bill@email.com",
    skills: "JavaScript",
    learning: "Wordpress, PHP",
    localtime: "7",
    bio: "Currently learning JavaScript.",
    image: "http://fillmurray.com/200/200",
    location: "Sydney",
    password: "chicken",
    password_confirmation: "chicken"
    })

  puts "User Count: #{User.all.count }"

  Skill.destroy_all

  s1 = Skill.create({
    skill: "JavaScript",
    user_id: u1.id
  })
  s2 = Skill.create({
    skill: "HTML",
    user_id: u2.id
  })
  s3 = Skill.create({
    skill: "CSS",
    user_id: u3.id
  })
  s4 = Skill.create({
    skill: "Java",
    user_id: u5.id
  })
  s5 = Skill.create({
    skill: "PHP",
    user_id: u5.id
  })

  puts "Skill Count: #{ Skill.all.count }"

# Append skills to users
#
# u2.skills << s1
#
# puts "u2 skills: #{ u2.skills.count }"

Booking.destroy_all

  b1 = Booking.create(date:"11-Jul-2017", available: false, start_time: Time.now + 2.days, end_time: Time.now + 3.days, teacher_id: u1.id, student_id: u2.id)

  b2 = Booking.create(date:"14-Jul-2017", available: false, start_time: Time.now + 2.days, end_time: Time.now + 3.days, teacher_id: u3.id, student_id: u4.id)

puts "Booking Count: #{ Booking.all.count }"

Comment.destroy_all

  c1 = Comment.create ({
        body: "Awesome tutor, thanks!",
        teacher_id: u1.id,
        student_id: u2.id
      })
  c2 = Comment.create ({
        body: "Really good at explaining things!",
        teacher_id: u3.id,
        student_id: u4.id
      })
puts "Comment Count: #{Comment.all.count }"
