Feature: Tips

	** Make sure the test harness is running and listening to http://localhost:3001 ***

	As a human
	I want to test tips for nodes, ports, links and the palette
	So I can get information when hovering over elements

Scenario: Sanity test to check if tips show up for the palette, nodes, ports and links
	Then I resize the window size to 1400 width and 800 height
	Given I am on the test harness
	Given I have toggled the app side panel
	Given I have selected the "Ports" connection type
	Given I have selected the "Flyout" palette layout
	Given I have uploaded palette "/test_resources/palettes/modelerPalette.json"
	Given I have uploaded diagram "/test_resources/diagrams/multiPortsCanvas.json"
  Given I have toggled the app side panel

	Then I open the palette
	Then I hover over node type "Var. File" in category "Import"
	Then I verify the tip shows next to the node type "Var. File" in category "Import"

	Then I move the mouse to coordinates 300, 100
	Then I verify the tip doesn't show for node type "Var. File"

	Then I hover over the node "Define Types"
	Then I verify the tip shows "below" the node "Define Types"

	Then I move the mouse to coordinates 300, 100
	Then I verify the tip doesn't show for node "Define Types"

	Then I hover over the input port "inPort2" of node "Define Types"
	Then I verify the port name "Input Port 2" shows below the input port id "inPort2" of node "Define Types"

	Then I move the mouse to coordinates 300, 100
	Then I verify the tip doesn't show for input port id "inPort2"

	Then I hover over the link at 420, 260
	Then I verify the tip shows below 260 for link between node "Discard Fields", port "Output Port Two" and node "Define Types", port "Input Port 2"

	Then I move the mouse to coordinates 300, 100
	Then I verify the tip shows doesn't show for link


Scenario: Sanity test to check if tips don't show up for the palette, nodes, ports and links after disabling tips
	Then I resize the window size to 1400 width and 800 height
	Given I am on the test harness
	Given I have toggled the app side panel
	Given I have selected the "Ports" connection type
	Given I have selected the "Flyout" palette layout
	Given I have uploaded palette "/test_resources/palettes/modelerPalette.json"
	Given I have uploaded diagram "/test_resources/diagrams/multiPortsCanvas.json"

	Then I have toggled the "Palette" tip type
	And I have toggled the "Nodes" tip type
	And I have toggled the "Ports" tip type
	And I have toggled the "Links" tip type

	Then I open the palette
	Then I hover over node type "Var. File" in category "Import"
	Then I verify the tip doesn't show for node type "Var. File"

	Then I hover over the node "Define Types"
	Then I verify the tip doesn't show for node "Define Types"

	Then I hover over the input port "inPort2" of node "Define Types"
	Then I verify the tip doesn't show for input port id "inPort2"

	Then I hover over the link at 420, 260
	Then I verify the tip shows doesn't show for link

Scenario: Sanity test changing node name to update node tip
	Then I resize the window size to 1400 width and 800 height
	Given I am on the test harness
	Given I have toggled the app side panel
	Given I have selected the "Ports" connection type
	Given I have selected the "Flyout" palette layout
	Given I have uploaded diagram "/test_resources/diagrams/multiPortsCanvas.json"
	Given I have toggled the app side api panel
	Given I have selected the "Set Node Label" API

	When I select node "Na_to_K" in the node drop-down list
	And I enter "New Node Label" into the new label field
	And I call the API by clicking on the Submit button
	Then I hover over the node "New Node Label"
	And I verify the tip shows "below" the node "New Node Label"

Scenario: Sanity test changing input port name to update port tip
	Then I resize the window size to 1400 width and 800 height
	Given I am on the test harness
	Given I have toggled the app side panel
	Given I have selected the "Ports" connection type
	Given I have selected the "Flyout" palette layout
	Given I have uploaded diagram "/test_resources/diagrams/multiPortsCanvas.json"
	Given I have toggled the app side api panel
	Given I have selected the "Set Input Port Label" API

	When I select node "Na_to_K" in the node drop-down list
	When I select port "Input Port2" in the port drop-down list
	And I enter "New Port Label" into the new label field
	And I call the API by clicking on the Submit button
	Then I hover over the input port "inPort2" of node "Na_to_K"
	And I verify the port name "New Port Label" shows below the input port id "inPort2" of node "Na_to_K"

Scenario: Sanity test changing output port name to update port tip
	Then I resize the window size to 1400 width and 800 height
	Given I am on the test harness
	Given I have toggled the app side panel
	Given I have selected the "Ports" connection type
	Given I have selected the "Flyout" palette layout
	Given I have uploaded diagram "/test_resources/diagrams/multiPortsCanvas.json"
	Given I have toggled the app side api panel
	Given I have selected the "Set Output Port Label" API

	When I select node "Discard Fields" in the node drop-down list
	When I select port "Output Port Two" in the port drop-down list
	And I enter "New Port Label" into the new label field
	And I call the API by clicking on the Submit button
	Then I hover over the output port "outPort2" of node "Discard Fields"
	And I verify the port name "New Port Label" shows below the output port id "outPort2" of node "Discard Fields"

Scenario: Sanity test tip location adjusted based on boundaries of canvas
	Then I resize the window size to 1400 width and 800 height
	Given I am on the test harness
	Given I have toggled the app side panel
	Given I have selected the "Ports" connection type
	Given I have selected the "Flyout" palette layout
	Given I have uploaded diagram "/test_resources/diagrams/allNodes.json"
	Given I have toggled the app side panel

	Then I click zoom to fit
	When I hover over the node "Random Forest Classifier"
	Then I verify the tip shows "above" the node "Random Forest Classifier"

Scenario: Sanity test tip location adjusted based on boundaries of browser
	Then I resize the window size to 1400 width and 800 height
	Given I am on the test harness
	Given I have toggled the app side common-properties panel
	Given I have uploaded JSON for common-properties "CLEM_FilterRows_paramDef.json"

	Then I move the mouse to coordinates 40, 120 in common-properties
	And I verify the tip for label "Mode" is visible on the "right"

	Then I move the mouse to coordinates 100, 170 in common-properties
	And I verify the tip for label "Modeler CLEM Condition Expression" is visible on the "left"