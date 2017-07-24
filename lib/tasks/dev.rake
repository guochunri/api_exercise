namespace :dev do
  task :fetch_city => :environment do
    puts "Fetch city data..."
    response = RestClient.get "http://v.juhe.cn/weather/citys", :params => { :key => JUHE_CONFIG["api_key"] }
    data = JSON.parse(response.body)

    data["result"].each do |c|
      existing_city = City.find_by_juhe_id( c["id"] )
      if existing_city.nil?
        City.create!( :juhe_id => c["id"], :province => c["province"],
                      :city => c["city"], :district => c["district"] )
      end
    end

    puts "Total: #{City.count} cities"
  end

  task :fetch_topnews => :environment do
    puts "Fetch topnews data..."
    response = RestClient.get "http://v.juhe.cn/toutiao/index", :params => { :key => JUHE_TOPNEWS_CONFIG["api_key"] }
    data = JSON.parse(response.body)

    data["result"]["data"].each do |c|
      existing_topnews = Topnews.find_by_uniquekey( c["uniquekey"] )
      if existing_topnews.nil?
        Topnews.create!( :uniquekey => c["uniquekey"],
                          :title => c["title"],
                          :category => c["category"],
                          :date => c["date"],
                          :author_name => c["author_name"],
                          :url => c["url"],
                          :thumbnail_pic_s => c["thumbnail_pic_s"],
                          :thumbnail_pic_s02 => c["thumbnail_pic_s02"],
                          :thumbnail_pic_s03 => c["thumbnail_pic_s03"] )
      end
    end

    puts "Total: #{Topnews.count} topnews"
  end

end
