10.times do 
	client = Client.new
	client.name = Faker::Name.name
	client.email = Faker::Internet.email
	client.mobile = Faker::Number.number(10)
	client.company = Faker::Company.name
	client.website = "www.#{Faker::Internet.domain_name}"
	client.save
end

50.times do 
	project = Project.new
	project.name = Faker::App.name
	project.description = Faker::Lorem.paragraph
	project.start_date = Faker::Date.between(Date.today.beginning_of_year, Date.today)
	project.client_id = Client.all.sample.id 
	project.status = ["new", "on-going", "completed"].sample
	project.save
end

1000.times do 
	product = Product.new
	product.name = Faker::Commerce.product_name
	product.price = Faker::Commerce.price(50..10000)
	product.category = Faker::Commerce.department(1)
	product.brand = ["Nike","Canon","Samsung","Apple","Adidas","Sony","Puma","Alibaba"].sample
	product.size = ["M","S","L","XL","XLL","XS"].sample
	product.discount = ["10","20","30"].sample
	product.color = Faker::Commerce.colorzzf
	product.availability = [true,false].sample
	product.save
end


#ProjectCategory
project_ids = [59,60,61,62]
category_ids = [1,2,3,4]
25.times do 
	pro_cat = ProjectCategory.new
	pro_cat.project_id = project_ids.sample
	pro_cat.category_id = category_ids.sample
	pro_cat.save
end
