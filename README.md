# random_numbers

## Overview:

This app generates a list of random integers up to a limit selcted by the user (defaults to 10000).

It is a single page app, but I went ahead and structured the app to separate the logic out of the view using a model for the number list.

There is also unit test for the app.

I've separated the flutter build files from the files I modified for this app to make it easier to see the code I wrote for this project.

## Approach:

##### lib/main.dart:

This file is the screen seen by the user. I've structured the code so that the build method is skinny and references methods outside the build for easier readability and maintenance.

##### \_numberPicker:

The specs called for a random list of integeres (1-10,000) to be created each time it is run, so I defaulted the number picker widget to run 10,000 but gave the user the option of selecting anything up to 20,000. And that upper limit can easily be adjusted.

##### \_resultsBox:

Displays the shuffled list in a scrollable widget (listview)

##### lib/models/number_list.dart:

Flutter and Dart have native/built in capabilities to build a list (array) of numbers and also to shuffle the values. I felt those functions were the most efficient means to accomplish the task and anything I built from scratch would not be as efficient and straight forward. The number_list file generates and returns the list.

##### test/number_list_test.dart:

This contains the 3 unit tests built for the app. One test counts the length of the returned list to make sure it is correct. One test creates 2 lists with the same upper limit and ensures they are identitical. The third test randomizes one of the lists and ensures it is not the same as the original list.
