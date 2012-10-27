Feature: To enable me to participate in a mositrail, as a visitor, I want to follow a set of clues

Background: 

  Given the following exhibits exist within mosi:
  | Title     | Clue                                | PIN       |
  | Top Gears | This one will drive you up the wall | MOSI0001  |

@wip
Scenario: Starting an mositrail  
  When I start an mositrail
  Then the application will present the clue: This one will drive you up the wall
  And the ability to provide an exhibit code