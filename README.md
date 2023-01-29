# BMSMarvelVsDC
Book My Show - Mobile Assignment

Project is built using:
- Xcode 14
- Swift 5
- Cocoapods version : 1.11.3 (please update cocoapods to this version to be able to install pods for the project)

Execute the following steps to run the application in XCode:
1. Clone the repository to get the project.
2. Open project folder(BMS-MarvelVsDC) in the terminal.
3. type the command 'pod deintegrate' (This will remove the pods, if any exists).
4. Delete the '.xcworkspace' file from the project(if any).
5. In the terminal -> type 'pod install' (for M1 Macbook the command is 'arch -x86_64 pod install') .
6. After installation, open the '.xcworkspace' in Xcode and build/run the project.

=========================================================
# Pods 
Added pod SDWebImage for async download of movie posters images

=======================================================

Architecture: MVVM (with delegate)

Project Structure
- Utilities : Contains utility files for the project Like Network Service Manager, APIs, Extensions and Common View to be used in the Application
    => ErrorView: A common error view that has an error label and retry button
        
- Modules : Helps in segregating the MVVM based approach on modules rather than entire project. 
            Currently it includes MoviesList Module with the MVVM folder structure
            
            The folder structure of Modules is as follows: 
            1. Model: Models in the module
            2. View: Cells and view controller files and the storyboard file
            3. ViewModel: ViewModels for fetching data for the ViewControllers
            
        
* VIEWCONTROLLERS: 
    1. MarvelDCMoviesListViewController: Displays list of Movies after API call.
       Table view is used to show Marvel and DC sections.

=======================================================
# TestCases

* MovieAPIManagerTestCase: 
It includes test cases to test API calls for valid and invalid URLs and Responses.

* MoviesListViewModelTestCases: 
It includes test cases to check API success and failure and to check Viewmodel data in both cases.

* MarvelDCMoviesListViewControllerTestCase: 
It includes test case to check tableview datasource and delegates and correct number of sections and rows in tableview based on API data

