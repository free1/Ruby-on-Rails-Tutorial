FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		password "111111"
		password_confirmation "111111"

		factory :admin do
			admin true
		end
	end

	factory :micropost do
		content "aaaa"
		user
	end
end