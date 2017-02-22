task :setup_clients => :environment do
  guest = User.create(email: "guest@gmail.com", password: "guest123")

  Client.create([{name: "Elon Musk", email: "elon@spacex.com", mobile: "0956743267", company: "SpaceX", website: "https://www.spacex.com", user: guest},{name: "Steve Jobs", email: "steve@apple.com", mobile: "1234567890", company: "Apple Inc.", website: "https://www.apple.com", user: guest},{name: "Bill Gates", email: "bill@microsoft.com", mobile: "0987654321", company: "Microsoft", website: "https://www.microsoft.com", user: guest}])
end
