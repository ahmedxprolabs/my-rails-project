#retrieving single objects
Client.take
Client.take(2)
Client.take!

Client.first
Client.first(3)
Client.order(:first_name).first

Client.find_by(first_name: 'Lifo')
Client.find_by!(first_name: 'Sara')  # Raises if not found
Client.find_by(id: 1)

#retrieving multiple objects
Client.find_each do |customer|
  puts customer.first_name
end

Client.find_each(batch_size: 2, start: 2, finish: 5) do |customer|
  puts "Batching: #{customer.id} - #{customer.first_name}"
end

Customer.find_in_batches(batch_size: 2, start: 2, finish: 5) do |customers|
  puts "Batch up to 5:"
  customers.each { |c| puts c.id }
end


#Array Conditions
Client.where("first_name = ? AND email = ?", "Ahmed", "ahmed@example.com")

#Range conditions
Client.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)

#AND OR NOT
Client.where.not(first_name: nil)
Client.where(last_name: "Smith").or(Client.where(id: [1, 3, 5]))
Client.where(last_name: "Smith").where(id: [1, 3, 5])

#ordering
Client.order("LOWER(title) ASC")
Client.order(last_name: :asc, created_at: :desc)

#limit ,select and ofset
Client.select(:last_name).distinct
Client.limit(2).offset(2)

#grouping
Client.group("DATE(created_at)").count
Client.select("store_id, COUNT(*) as client_count")
      .group(:store_id)
      .having("COUNT(*) > ?", 5)


#overriding conditions
Client.where(store_id: 5, email: "a@x.com").unscope(where: :store_id)
Client.where(store_id: 3).limit(10).order(:created_at).only(:where, :order)
Client.select(:first_name, :last_name).reselect(:email)
Client.order(:created_at).reverse_order
Client.group(:store_id).regroup(:email)


#joins
Reel.joins(:influencer).select('reels.*, influencers.name AS influencer_name')
Reel.joins(:likes).distinct
Reel.joins(:influencer, :likes)

Influencer.left_outer_joins(:reels).select("influencers.*, COUNT(reels.id) AS reels_count")
Influencer.where.associated(:reels) #posted only one reel


#eager_loading
influencers = Influencer.includes(:reels).limit(5)
influencers.each do |influencer|
  puts influencer.reels.count
end

influencers = Influencer.preload(:reels).limit(5)
influencers.each do |influencer|
  puts influencer.reels.map(&:title)
end
