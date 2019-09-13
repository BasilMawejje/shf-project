Feature: Admin sees password hint when they become a user

  As an admin
  So that I am prompted to enter the admin password instead of the user password
  Show a hint reminding me to use the admin password

  PT:  https://www.pivotaltracker.com/story/show/168385051

  Background:
    Given the App Configuration is not mocked and is seeded

    Given the following users exists
      | email                           | admin | membership_number | member |
      | emma-new-app@bowsers.com        |       |                   |        |
      | lars-member@happymutts.com      |       | 101               | true   |
      | hannah-member@happymutts.com    |       | 102               | true   |
      | rejected@happymutts.com         |       |                   |        |
      | user-never-logged-in@example.se |       |                   |        |
      | user-anna@personal.se           |       |                   |        |
      | user-sam@personal.se            |       |                   |        |
      | admin@shf.se                    | true  |                   |        |
      | yesterday_admin@shf.se          | true  |                   |        |
      | lazy_admin@shf.se               | true  |                   |        |


    And the following regions exist:
      | name         |
      | Stockholm    |
      | Västerbotten |

    And the following companies exist:
      | name        | company_number | email               | region       |
      | Happy Mutts | 5560360793     | woof@happymutts.com | Stockholm    |
      | Bowsers     | 2120000142     | bark@bowsers.com    | Västerbotten |


    And the following applications exist:
      | user_email                   | contact_email           | company_number | state    |
      | lars-member@happymutts.com   | lars@happymutts.com     | 5560360793     | accepted |
      | hannah-member@happymutts.com | hannah@happymutts.com   | 5560360793     | accepted |
      | emma-new-app@bowsers.com     | emma@bowsers.com        | 2120000142     | new      |
      | rejected@happymutts.com      | rejected@happymutts.com | 5560360793     | rejected |


    And the following membership packets have been sent:
      | user_email                 | date_sent  |
      | lars-member@happymutts.com | 2019-03-01 |


    And I am logged in as "admin@shf.se"


  # -----------------------------------
  # Login info - when, how many times

  @selenium
  Scenario: Show admin password hint
    Given I am on the "edit a user profile as the admin" for "lars-member@happymutts.com"
    And I click on t("admin_only.user_profile.edit.become_this_user")
    Then I should navigate to "admin become user"
    And I click "Edit your profile"
    Then I should see "edit registration for a user" page
    And I focus on "Current password" field
    Then I should see the text t(".modalTitle")
