@ignore @broadcast @follow-us
Feature: Follow Us module exists in home front for all Broadcast sites.

Background: 
	Given I am on the Home front in Broadcast site
		And The Follow Us module exists

Scenario Outline:
	Given The "<media_name>" button exists
	When I click the "<media_name>" button
	Then The target site loads in a new window

Examples:
| media_name |
| Facebook |
| Twitter |
| Pinterest |
| Four Square |
