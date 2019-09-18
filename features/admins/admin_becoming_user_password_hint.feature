Feature: Admin sees password hint when they become a user

  As an admin
  So that I am prompted to enter the admin password instead of the user password
  Show a hint reminding me to use the admin password

  PT:  https://www.pivotaltracker.com/story/show/168385051

  Background:
    Given the App Configuration is not mocked and is seeded

    Given the following users exists
      | email                           | admin | first_name | last_name   | id |
      | lars-member@happymutts.com      | true  | Laurence   | Andreasson  | 1  |
      | admin@shf.se                    | true  | sample     | user        | 2  |

    And I am logged in as "admin@shf.se"

  @selenium
  Scenario: Show admin password hint
    Given I am on the "edit a user profile as the admin" for "lars-member@happymutts.com"
    And I click on t("admin_only.user_profile.edit.become_this_user")

    # The following step fails with Pundit::NotDefinedError, occurring
    # in _navigation_edit_my_application.html.haml.  This is not unique
    # to the following step - any step that looks for something on the page
    # (and forces a render of the page) results in that error:
    # I assumed both users were admins in order to work around the Pundit::NotDefinedError

    Then I should navigate to "admin become user"
    And I click "Edit your profile"
    Then I should see "edit registration for a user" page
    And I focus on "Current password" field
    Then I should see the text t("devise.registrations.edit.modalTitle")
