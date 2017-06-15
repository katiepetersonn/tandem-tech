User.destroy_all

    u1 = User.create({
    name: "Joe Bloggs",
    email: "joe@email.com",
    skills: "JavaScript, Swift, Assembly, Lua",
    learning: "HTML, Elixir, R, Go, Lua",
    localtime: "7",
    bio: "Currently learning JavaScript.",
    image:  Faker::Avatar.image,
    location: "Sydney",
    password: "chicken",
    password_confirmation: "chicken",
    price: 20
    })

    u2 = User.create({
    name: "Hannah Grey",
    email: "hannah@email.com",
    skills: "HTML, CSS, JavaScript, Ruby",
    learning: "C",
    localtime: "7",
    bio: "Currently learning JavaScript.",
    image:  Faker::Avatar.image,
    location: "Sydney",
    password: "chicken",
    password_confirmation: "chicken",
    price: 20
    })

    u3 = User.create({
    name: "Sarah Gill",
    email: "sarah@email.com",
    skills: "Python, Java",
    learning: "CSS, HTML",
    localtime: "7",
    bio: "Currently learning JavaScript.",
    image:  Faker::Avatar.image,
    location: "Sydney",
    password: "chicken",
    password_confirmation: "chicken",
    price: 20
    })

    u4 = User.create({
    name: "Bob Bloom",
    email: "bob@email.com",
    skills: "Ruby, Ruby on Rails, Groovy",
    learning: "PHP",
    localtime: "7",
    bio: "Currently learning JavaScript.",
    image:  Faker::Avatar.image,
    location: "Sydney",
    password: "chicken",
    password_confirmation: "chicken",
    price: 20
    })

    u5 = User.create({
    name: "Bill Murray",
    email: "bill@email.com",
    skills: "JavaScript",
    learning: "Python, PHP, TypeScript",
    localtime: "7",
    bio: "Currently learning JavaScript.",
    image:  Faker::Avatar.image,
    location: "Sydney",
    password: "chicken",
    password_confirmation: "chicken",
    price: 20
    })

    5.times do
      User.create({
        name: Faker::HarryPotter.character,
        email: Faker::Internet.email,
        skills: "JavaScript, Ruby, SQL ",
        learning: "PHP, C++",
        localtime: "7",
        bio: Faker::Hacker.say_something_smart,
        image: Faker::Avatar.image,
        location: Faker::Address.city,
        password: "chicken",
        password_confirmation: "chicken",
        price: 20
      })
    end

    3.times do
      User.create({
        name: Faker::Name.name,
        email: Faker::Internet.email,
        skills: "C#, Java",
        learning: "HTML, CSS, Ruby",
        localtime: "7",
        bio: Faker::Hacker.say_something_smart,
        image:  Faker::Avatar.image,
        location: Faker::Avatar.image,
        password: "chicken",
        password_confirmation: "chicken",
        price: 20
      })
    end

    5.times do
      User.create({
        name: Faker::Name.name,
        email: Faker::Internet.email,
        skills: "Python",
        learning: "Ruby, Objective-C",
        localtime: "7",
        bio: Faker::Hacker.say_something_smart,
        image: Faker::Avatar.image,
        location: Faker::Address.city,
        password: "chicken",
        password_confirmation: "chicken",
        price: 20
      })
    end

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

  b1 = Booking.create(date:"11-Aug-2017", available: false, start_time: Time.now + 2.days, end_time: Time.now + 3.days, teacher_id: u1.id, student_id: u2.id, price: 2000)

  b2 = Booking.create(date:"20-Jul-2017", available: false, start_time: Time.now + 2.days, end_time: Time.now + 3.days, teacher_id: u3.id, student_id: u4.id, price: 2000)

  b3 = Booking.create(date:"19-Jul-2017", available: true, start_time: Time.now + 2.days, end_time: Time.now + 3.days, teacher_id: u1.id, price: 2000)

  b4 = Booking.create(date:"19-Jul-2017", available: true, start_time: Time.now + 2.days, end_time: Time.now + 3.days, teacher_id: u2.id, price: 2000)

  b5 = Booking.create(date:"11-Aug-2017", available: false, start_time: Time.now + 2.days, end_time: Time.now + 3.days, teacher_id: u4.id, student_id: u2.id, price: 2000)

  b6 = Booking.create(date:"19-Jul-2017", available: false, start_time: Time.now + 2.days, end_time: Time.now + 3.days, teacher_id: u5.id, student_id: u4.id, price: 2000)

puts "Booking Count: #{ Booking.all.count }"

Comment.destroy_all

  c1 = Comment.create ({
        body: "Awesome tutor, thanks!",
        teacher_id: u1.id,
        user_id: u2.id
      })
  c2 = Comment.create ({
        body: "Really good at explaining things!",
        teacher_id: u3.id,
        user_id: u4.id
      })
puts "Comment Count: #{Comment.all.count }"
