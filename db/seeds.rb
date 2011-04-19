PaperTrail.whodunnit = 'Seed Data Script'

# Seed the roles.
Role.create!(:name => 'developer', :description => 'The system developer. There is no higher access level.')
Role.create!(:name => 'administrator', :description => 'A system administrator. Full access to all features.')
Role.create!(:name => 'member', :description => 'A typical application user.')


# Seed developer users.
r = Role.find_by_name('developer')

team_member_1 = User.new(:first_name => 'Ben',
                         :last_name => 'Makuh',
                         :email => 'bmakuh@mines.edu',
                         :password => 'changeme',
                         :password_confirmation => 'changeme',
                         :role => r)
team_member_1.save_without_session_maintenance

team_member_2 = User.new(:first_name => 'Chad',
                         :last_name => 'McKenna',
                         :email => 'cmckenna@mines.edu',
                         :password => 'changeme',
                         :password_confirmation => 'changeme',
                         :role => r)
team_member_2.save_without_session_maintenance

yong = User.new(:first_name => 'Yong',
                :last_name => 'Bakos',
                :email => 'ybakos@mines.edu',
                :password => 'changeme',
                :password_confirmation => 'changeme',
                :role => r)
yong.save_without_session_maintenance

# Seed components.
Component.create(:name => 'Steven',
                 :age => 16, 
                 :attack => '200',
                 :gender => 'male',
                 :cost => '200',
                 :creator_id => team_member_1.id,
                 :description => 'Steven was genetically engineered on Isla Sorna and was later shipped to Isla Nora where he was placed on display at Jurrasic Park.')

Component.create(:name => 'Patrick',
                :age => 7, 
                :attack => '900',
                :gender => 'male',
                :cost => '200',
                :creator_id => team_member_2.id,
                :description => "Patrick likes to parrty. With two 'R's.")
