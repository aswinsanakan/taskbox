task :clear_data => :environment do
  Project.delete_all
  Client.delete_all
  User.delete_all
end
