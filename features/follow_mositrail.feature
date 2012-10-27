Feature: To enable me to participate in a mositrail, as a visitor, I want to follow a set of clues

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


Scenario Outline: Correct pins should forward onto next exhibit
	Given I have been presented with: <Id>
	When I submit the PIN: <PIN>
	Then the application will present the clue: <Next Clue> 
	And the ability to provide an exhibit code

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


