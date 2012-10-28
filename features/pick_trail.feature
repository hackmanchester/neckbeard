Feature: pick a trail

Scenario Outline: 
	Given I have registered
	And the following trails exist
	| Name     | 
	| Science  |
	| Industry |
	When I view the list of trails
	Then I should see <Name>

	Examples:
	| Name     | 
	| Science  |
	| Industry |
