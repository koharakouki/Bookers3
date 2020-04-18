# namespace :greeting do
# 	desc '挨拶メール'
# 	task say_hello: environment do
# 		users = User.all

# 		users.each do |user|
# 			DailyMailer.everyday_mail(user).deliver
# 		end
# 	end
# end
