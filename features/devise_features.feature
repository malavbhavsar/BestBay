Feature: Devise integration
  In order to keep my data safe
  User
  I want to have sign in, sign out and sign up mechanism

@allow-rescue
Scenario: Creating a new account
Given I am not authenticated
When I go to new_user_registration_path
And I fill in "user_email" with "testing@man.net"
And I fill in "user_password" with "secretpass"
And I fill in "user_password_confirmation" with "secretpass"
And I press "Sign up"
Then I should be on items page
Then I should see "Welcome! You have signed up successfully."

# To check the sign in

# To check the forget password

#Examples:
#| email           | password   |
#| testing@man.net | secretpass |
#| foo@bar.com     | fr33z3     |

#Scenario: Willing to edit my account
#Given I am a new, authenticated user # beyond this step, your work!
#When I want to edit my account
#Then I should see the account initialization form
#And I should see "Your account has not been initialized yet. Do it now!"
# And more view checking stuff