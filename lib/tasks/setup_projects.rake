task :setup_projects => :environment do
  Client.all.each do |client|
    2.times do
      start_date = Faker::Date.between(2.days.ago, 1.week.from_now)
      Project.create(name: Faker::App.name, description: Faker::Lorem.sentence(3), start_date: start_date, client: client, status: ["new", "on-going", "completed"].sample, user: client.user, end_date: Faker::Date.between(start_date, start_date + 2.weeks))
    end
  end
end
