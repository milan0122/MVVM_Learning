# Flutter: MVVM(Model-View-ViewModel) Architecture Learning Series




## 🛠️ Features

- **Structured Folder Organization:** Organized project folders according to MVVM principles.

- **Exception Handling:** Implemented handling for various exceptions:
    - Bad Request Exception
    - Fetch Data Exception
    - Unauthorized Exception
    - Invalid Input Exception

- **API Response Management:** Managed different API response states:
    - Loading
    - Completed
    - Error

- **Base API Service:** Created `BaseApiService` to streamline GET and POST requests with error handling for status codes like 404 and 400.

- **Error Notifications:** Developed methods in a Utils class to display errors in the login screen.

- **2nd work**
- **Authentication and component:** Round button component is created and a simple authentication is applied on login button.

- **Login and Signup using API:**  successfully login and signup when api hits with the help of fake api and handle regarding exceptions

- **User Token Model**: Handles user tokens for authentication.

- **Splash Screen**: Checks for a user token saved in Shared Preferences and redirects users accordingly.
  - Redirects to the home screen if the token exists.
  - Directs to the login screen if the token is null.
- - **MoviesList Model**:
- Developed a structured model to efficiently represent movie data.

- **API Fetching**:
  - Integrated a `getApi` function for seamless retrieval of movie data from an external source.

- **Home Screen Design**:
  - Built a Home Screen to display the fetched movie data using `HomeViewViewModel`, leveraging the Provider package for state management.

  

## 📚 Getting Started

### Prerequisites

- Flutter SDK
- Dart

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/milan0122/MVVM_Learning.git
   cd flutter-authentication-app
   
2. Install the dependencies:
    ```bash
    flutter pub get
3. Run the app:
  ```bash
    flutter run 

