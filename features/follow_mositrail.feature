Feature: To enable me to participate in a mositrail, as a visitor, I want to follow a set of clues

Background: 

  Given the following exhibits exist within mosi:
  | ID | Title            | Clue                                 | PIN       |
  | 1  | Top Gears        | This one will drive you up the wall  | MOSI0001  |
  | 2  | Earthquake Table | This will make the earth move        | MOSI0002  |
  | 3  | Infinity well    | You can't see the bottom             | MOSI0003  |


Scenario: Starting an mositrail  
  When I start an mositrail
  Then the application will present the clue: This one will drive you up the wall
  And the ability to provide an exhibit code

@wip
Scenario: Submitting a correct PIN
	Given I have been presented with: 1
	When I submit the PIN: MOSI0001
	Then the application will present the clue: This will make the earth move 
	And the ability to provide an exhibit code

@wip
Scenario: Submitting a correct PIN
  Given I have been presented with: 2
  When I submit the PIN: MOSI0002
  Then the application will present the clue: You can't see the bottom
  And the ability to provide an exhibit code



