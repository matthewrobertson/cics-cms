# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Project.delete_all
Announcement.delete_all
Resource.delete_all

100.times do
	u  = User.create(	
			:full_name 	=> Faker::Name.name,
			:pref_name 	=> Faker::Name.first_name,
			:email		=> Faker::Internet.email,
			:admin		=> false,
			:password	=> "password",
			:password_confirmation => "password"
		)

	if u
		p = Project.new(
				:name 		=> Faker::Company.name,
				:description	=> Faker::Company.bs,
				:started_at	=> Time.now,
				:ending_at	=> 1.year.from_now
			)
		p.owner = u
		p.save

		
		c=Contribution.new(
			:status		=>0

		)
		c.user=u
		c.project=p
		c.save
			
	
		a = Announcement.new
		a.topic = Faker::Company.name
		a.content = Faker::Company.bs
		a.kind = "project announcement"
		a.user = u
		a.save
		
		if p		
			5.times do			
			r= Resource.new(
				:name		=> Faker::Company.name,
				:version	=> 1..5,
				:description	=> Faker::Company.bs,
				:location	=> "resource",
				:mime		=> "pdf"
			)
			r.user = u
    			r.project = p
			r.save
			end
		end		

	end
end


	
