Feature: To enable me to participate in a mositrail, as a visitor, I want to follow a set of clues and see my score

Background: 

  Given the following exhibits exist within mosi:
  | ID | Title            | Clue                                 | PIN       | Sequence |
  | 1  | Top Gears        | This one will drive you up the wall  | MOSI0001  | 0        |
  | 2  | Earthquake Table | This will make the earth move        | MOSI0002  | 1        |
  | 3  | Infinity well    | You can't see the bottom             | MOSI0003  | 2        |


Scenario: Starting an mositrail  
  When I start an mositrail
  Then the application will present the clue: This one will drive you up the wall
  And the ability to provide an exhibit code


Scenario Outline: Correct pins should increment the score and forward onto next exhibit
	Given I have been presented with: <Id>
	When I submit the PIN: <PIN>
	Then the application will present the clue: <Next Clue> 
	And the ability to provide an exhibit code
  And increments the score

  Examples:
  | Id | PIN      | Next Clue                     |
  | 1  | MOSI0001 | This will make the earth move |
  | 2  | MOSI0002 | You can't see the bottom      | 

Scenario: Incorrect pin
  Given I have been presented with: 1
  When I submit the PIN: sdfkljsf
  Then the application will inform me of incorrect pin
  Then the application will present the clue: This one will drive you up the wall
  And the ability to alter my exhibit code
  And does not increment the score

Scenario: Finished
  Given I have been presented with: 3
  When I submit the PIN: MOSI0003
  Then the application will end the mositrail.  

Scenario: Skip a exhibit
  Given I have been presented with: 1
  When I chooose to skip 
  Then the application will inform me that I skipped an exhibit
  And the application will present the clue: This will make the earth move 
  And the ability to provide an exhibit code  
  And does not increment the score

Scenario: Finished through a skip
  Given I have been presented with: 3
  When I chooose to skip 
  Then does not increment the score
  Then the application will end the mositrail.  



