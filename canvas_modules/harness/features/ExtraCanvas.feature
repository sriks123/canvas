Feature: ExtraCanvas

	** Make sure the test harness is running and listening to http://localhost:3001 ***

	As a human
	I want test extra canvas operations
	So I can build a extra canvas and perform node operations

Scenario: Sanity test to perform extra canvas node operation
	Then I resize the window size to 1400 width and 800 height
	Given I am on the test harness
	Given I have toggled the app side panel
	Given I have selected the "Flyout" palette layout
	Given I have selected the "Ports" connection type

	Then I click on extra canvas toggle

	Given I have uploaded palette for extra canvas "/test_resources/palettes/modelerPalette.json"
	Given I have uploaded diagram for extra canvas "/test_resources/diagrams/modelerCanvas.json"
	Given I have toggled the app side panel

	Then I verify the number of nodes in extra canvas are 8

	Then I open the extra canvas palette
	Then I add node 7 a "Filler" node from the "Field Ops" category onto the extra canvas at 380, 480
	Then I close the palette
	Then I verify the number of nodes in extra canvas are 9

	Given I have toggled the app side panel
	Then I drag the Derive Node from side panel to extra canvas at 380, 480
	Given I have toggled the app side panel
	Then I verify the number of nodes in extra canvas are 10

	Then I delete node 1 the "Type" node from extra canvas
	Then I verify the number of nodes in extra canvas are 9

	Then I delete node 2 the "Derive" node from extra canvas
	Then I verify the number of nodes in extra canvas are 8

Scenario: Sanity test to perform extra canvas property edit operation
	Then I resize the window size to 1400 width and 800 height
	Given I am on the test harness
	Given I have toggled the app side panel
	Given I have selected the "Flyout" palette layout
	Given I have selected the "Ports" connection type

	Given I have uploaded diagram "/test_resources/diagrams/commentColorCanvas.json"

	Then I click on extra canvas toggle

	Given I have uploaded palette for extra canvas "/test_resources/palettes/modelerPalette.json"
	Given I have uploaded diagram for extra canvas "/test_resources/diagrams/modelerCanvas.json"
	Given I have toggled the app side panel

	Then I select node 3 the "C5.0" node
	Then I enter "10" in the "samplingRatio" field in "top" canvas
	Then I select node 1 the "Define Types" node from extra canvas
	Then I enter "25" in the "samplingRatio" field in "extra" canvas