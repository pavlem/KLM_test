# KLM_t

First checkout the project and start the **KLM_2_t.xcodeproj** file, there are no third party dependencies so no CocoaPods and similar and so it’s pretty simple. In case you want to build on a real device, add your bundle ID project settings. 

Based on the project request:

1. Universal app (iPhone/iPad)
2. Create a vertical flow collection view with 4 cells in one row for iPhone and 8 cells for iPad
3. You are allowed to use CocoaPods/SPM
4. For the data for collection view - you can choose any API from here https://github.com/public-apis/public-apis It can be any data you want 
5. After you get the models - save models in core data so it would be possible to retrieve them without internet connection.
6. Once item is clicked - show detail view page - design wise - doesn't matter 

The following has been done:

# User Interface:
* Just build the app and you will see the loading screen while the movies collections data (most popular and now playing) is being fetched from the API. 
* There are two tabs (Most Viewed and Favorites).
* After the successful data retrieval, movies are shown in vertical scrolling fashion where there are 4 items per row for iPhones and 8 items per row for iPads
* In case of any error an alert is presented (turn the internet off and restart the app or try to tap a destination to try it out). Of course, this can be done in much more detail if Reachability class is used, but it would go outside of scope of this test project and it was mentioned to avoid 3rd party libs or other solutions. 
* Everything you see in this project is custom made, so nothing has been copied or used from some other source. 
* To see the movie details tap on the cell and Details Screen will appear. There you can SAVE or REMOVE the movie from favorites, but in this case I have used NSUserDefaults for the permanent storage and not CoreData due to the lack of time. Core Data, Realm or any othe persistance solution can be implemented without too much trouble. There is a search feature as well. 
* When tapping on the SAVE button, that movie is persisted and can bee seen in Favorites tab
* Turn the internet off, the app will still function.
* On the Favorites screen you can filter the list of movies based on any of the 4 labels (their text)
* https://www.themoviedb.org/ has been chosen for the API and since there is a max number of movies fetched per one request (limitation / feature of the API) I have just tripled the movies results to illustrate more populated grid, especially for iPad, so do not get confused with this. 

# Architecture:
* MMVM is used as an app design pattern since it complements Apple's native, out of the box, MVC for UIKit and its new MVVM in SwiftUI.
* Networking module is independent and can be implemented anywhere. It is based on Apple's “URLSession” and generics so no third party libs have been used.
* There is a custom loading screen and alert for the user feedback. 
* Unit tests are made for view models and moc JSON of products list and details, they are just examples and many more tests can be done
* Reusable components have been made (like MovieImageView) for illustration purposes. 
* File organisation: 
    * App - App related data 
    * Models
    * Views
    * ViewControllers
    * ViewModels
    * Lib - all custom made libraries with the main one being the networking module under “Networking” 
    * Resources - storyboards, strings, images
