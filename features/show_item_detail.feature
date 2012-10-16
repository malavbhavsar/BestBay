Feature: Details of the item are provided
  In order to view finer details of the item that I am interested in
  Buyer
  So that I can decide whether I want to buy/rent/auction for the item or not

  Background: Items have been added to database
    Given the following items exist:
      |name      |picture                                                                                           |description       |opening_bid|highest_bid|
      |snow whit |https://ssl.gstatic.com/movies/tbn_a7d75269b295f037.jpg?size=80x107&web                           |it about snow whit|10         |20         |
      |dredd     |http://ia.media-imdb.com/images/M/MV5BODkyNDQzMzUzOF5BMl5BanBnXkFtZTcwODYyMDEyOA@@._V1._SY317_.jpg|it about dredd    |15         |30         |

  Scenario: Going to the item details page from items page

    Given I am logged in
    Given I am on the items page
    And I follow "Show" for "snow whit"
    Then I am on the item page for "snow whit"
    Then I should see "snow whit"
    And I should see "it about snow whit"
    And I should see "10"
    And I should see "20"