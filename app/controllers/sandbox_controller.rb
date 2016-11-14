class SandboxController < ApplicationController
  def clients
      @clients = Client.order('name')
  end

  def projects
      @projects = Project.where('start_date > ?', Date.today.beginning_of_month)
  end

  def products
    @products = Product.all
	@products_by_category = Product.where('category = ?', "Music")
	@products_by_price = Product.where('price > ? AND price < ?', 0, 25)
	@products_by_brand = Product.where('brand = ?', "Upton Inc")
	@products_by_price_brand_size = Product.where('price > ? AND price < ? AND size = ? AND Brand = ?', 10, 200, 15, "Considine Group")
	@products_by_availability = Product.where('availability = ?', "t")
	@products_under_price = Product.where('price < ?', 499)
	@products_upto_price = Product.where('price < ?', 1200)
	@products_categories = Product.pluck('category').uniq
    @products_order_by_name = Product.order('name')
    @products_order_by_price = Product.order('price DESC')
    @products_prices = Product.pluck('price').uniq
    @products_worth = Product.pluck('price').inject(:+)
  end

  def get_jobs
    if params[:technology]
      technology = params[:technology]
      location = params[:location]
      @response = HTTParty.get("http://api.indeed.com/ads/apisearch?publisher=7277146494571922&q=#{technology}&l=#{location}&co=india&format=json&v=2")
    end
  end

end