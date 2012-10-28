Feature: register

Scenario: Register
When I register as Williams
Then I will be presented with the list of trails
And I will be registered

When I register as [Blank]
Then I will not be presented with the list of trails
And I will be given an error
