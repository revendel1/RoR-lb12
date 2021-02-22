require 'application_system_test_case'

class SessionsTest < ApplicationSystemTestCase

	test 'truth' do
		:email
		assert true
	end

	test 'should not login user with invalid credentials' do
		visit login_url

		fill_in 'Email', with: "ugiy"
		fill_in 'Password', with: "gygyuu"
		click_on 'Login'
		assert_text 'Email or password is invalid'
	end


    test 'array and count' do
        email = "test11@main.ru"
        login = "admin"
        password = "1234"

        visit signup_url

        fill_in 'Email', with: email
        fill_in 'Login', with: login
        fill_in 'Password', with: password
        fill_in 'Password confirmation', with: password
        click_on 'Create User'

        assert_text 'Sessions#new'

        fill_in 'Email', with: email
        fill_in 'Login', with: login
        fill_in 'Password', with: password
        click_on 'Login'

        assert_text 'array'

        fill_in 'page_count', with: "5"
        fill_in 'page_array', with: "10000"
        click_on 'Save Page'

        assert_text 'Max'
    end

    test 'register login and logout' do
        email = "test12@main.ru"
        login = "admin2"
        password = "1234"

        visit signup_url

        fill_in 'Email', with: email
        fill_in 'Login', with: login
        fill_in 'Password', with: password
        fill_in 'Password confirmation', with: password
        click_on 'Create User'

        assert_text 'Sessions#new'

        fill_in 'Email', with: email
        fill_in 'Login', with: login
        click_on 'Login'

        assert_text 'index'
        click_on 'Log Out'
        assert_text 'Login'
    end
end