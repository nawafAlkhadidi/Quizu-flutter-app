

<p align="center">
    <a href="">
        <img src="./example/poster.png" height="500px">
    </a>
</p>

# Quiz U App :

In this project, I developed an application using the Dart language (Flutter), a simple app that displays many questions and the user has to answer in 2 minutes only.


# Technical Requirements

NOTE: [Here is the API documentation] (https://documenter.getpostman.com/view/22492456/2s7YfU5r7h)

- Token

The app checks if the token is valid on app launch. If so, home screen is shown
GET https://quizu.okoul.com/Token
if token is invalid or non-existent, login screen is shown.

- Login

When the user clicks “Start” there is no call to the server, the call is done after “Check” is clicked on next screen
correct OTP is always 0000 but should still be checked at server using the call below
POST https://quizu.okoul.com/Login
Returns:
1- Bearer token
2- Status, either new or returning, if returning also returns Name, Mobile
*Please use this library to validate the mobile number:
https://pub.dev/packages/phone_number
*Client-side validation should be done to check if mobile or OTP is empty and an error message is shown accordingly

- Name

If the user is new, the name input screen is shown, when done is clicked the name is updated in the server
POST https://quizu.okoul.com/Name
Returns:
1- Name
2- Mobile
*Client-side validation should be done to check if Name is empty and an error message is shown accordingly

- Leaderboard

Top 10 scores (names and count of correct answers are retrieved from server) and displayed sorted descending by count of correct answers
GET https://quizu.okoul.com/TopScores

- Profile

Name and mobile are displayed
previous scores for the logged-in users is shown from local storage, sorted by date descending
If the logout button is clicked the token is deleted form local storage, no server call is made
If at anytime, you would like to get the user’s info, please call GET https://quizu.okoul.com/UserInfo (make sure your token is valid)
Returns:
1-Name
2-Mobile

-Quiz

When the quiz is started, GET https://quizu.okoul.com/Questions is called returns 30 questions with their answers Returns:
{question, option 1, option 2, option 3, options 4, correct option: X}

- Score

When the quiz is completed correctly the score is saved to server
POST https://quizu.okoul.com/Score
Also save the score locally on local storage to be used in Profile tab



# dependencies :
  - dio: ^4.0.6

  - pinput: ^2.2.12

  - loading_indicator: ^3.1.0

  - shared_preferences: ^2.0.15

  - flutter_svg: ^1.1.5

  - get: ^4.6.5

  - intl_phone_number_input: ^0.7.1

  - persian_number_utility: ^1.1.2

  - share_plus: ^4.4.0

  - intl: ^0.17.0



