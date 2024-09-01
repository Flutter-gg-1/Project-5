
<p align="center">
<img src="./assets/logo-h.png" alt="Tuwaiq" width="400"/>

# Blog App 
Blog App is designed to help you explore, save, and manage news articles effortlessly. With options to log in or enter as a guest, you can enjoy a range of features tailored to your needs. While logged-in users have access to all functionalities, guest access provides a streamlined experience with some limitations. Whether you’re saving articles for later or diving into the latest news, our app has you covered.

## Getting started

 ### Dependencies
You need to install the Dart programming language and Flutter framework.

### Executing program
1- Copy url then go to terminal and write: 
```
git clone ‹url›
```
2- Go to the cloned project using:
```
 cd < PROJECT-NAME> 
 ``` 

3- To create and start flutter project: 
```
flutter create project_name
cd project_name
code .
```

4- The program is now ready to run.
you can use this command to run the program:
```
flutter run
```


### installing  packege as a library 

#### get_it
 for  accessing an object from anywhere in an App Run this Command:
```
 $ flutter pub add get_it
```
#### get_storage
 for storage space Run this Command:
```
 $ flutter pub add get_storage
```
#### Google Fonts
for diffrents fonts Run this Command:
```
 $ flutter pub add google_fonts
```

#### image_picker
for add image from gallery Run this Command:
```
 $ flutter pub add image_picker
```

#### font_awesome_flutter for icons
for icons Run this Command:
```
 $ flutter pub add  font_awesome_flutter
```

## App Overview

 This Blog App is a comprehensive platform allowing users to manage and interact with blogs seamlessly. Here's a detailed overview of its features:

1. `Login Screen:`
   * `User Login:` Users can log in by entering a **username** and a **password** (minimum of 8 characters). Data is stored securely using local storage.
   * `Guest Access:` Users can choose to **enter as a guest**, which provides limited functionality compared to logged-in access.

2. `Feed Screen:`
   * `View Blogs:` Users can browse blogs categorized by various topics.
   * `Save Blogs:` Users can save blogs to their `SavedScreen` for easy access later.
   * `Add New Blog:` Logged-in users can create new blogs by entering details such as an `image`(optional), `title`, `subtitle`, estimated `read time`, `summary`, `content`, and select `category`. Once `posted`, the blog appears in the `feed` and can be accessed and modified later.

3. `Saved Screen:`
    * `View Saved Blogs`: Users can view all blogs they have saved.
    * `Remove Saved Blogs`: Users can remove blogs from their saved list if desired.
    * `Access Blogs`: Saved blogs can be accessed directly from this screen.

4. `Profile Screen`:
    * `User Information`: Displays a card with user details including an image, major, and name.
    * `Created Blogs:` Lists blogs created by the user, where user can remove it and edit it.
    * `Logout:` Users can log out from this screen. 
   * Guests will see a message prompting them to log in with a button to do so.
`Blog Details Screen:`
Content: Each blog post includes an **image**, **category**, **title**, **subtitle**, **writer’s name** and **image**, **creation date**, r**ead time**, **social media sharing icons**, *summary*, and full **content**.

This app ensures a user-friendly experience whether you’re logged in or browsing as a guest, offering robust features for managing and enjoying blogs.

## Resourses
For shape code you can use this website :

Packeges: https://pub.dev/


Figma design: [Figma](https://www.figma.com/design/08HSoZqTxjTsHhHNR06qgd/News-Feed-App-–-UI-Design-(Community)?node-id=1-2&node-type=CANVAS&t=U3Bl9r2d4XXbCO9t-0)

## OutPut
The outcome of Lavender App:

login screens requird at less 8 char password:


<p align="center">
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.18.14.png" width="200"/>
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.18.19.png" width="200"/>


gust feed & saved & profile &news Screens:


<p align="center">
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.18.34.png" width="200"/>
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.19.05.png" width="200"/>

<p align="center">
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.19.08.png" width="200"/>
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.19.24.png" width="200"/>

User feed Screen and add news screen:

<p align="center">
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.18.27.png" width="200"/>
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.20.19.png" width="200"/>
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.21.40.png" width="200"/>

feed screen after add news and seve news , the new nes screen where user can modify:

<p align="center">
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.22.18.png" width="200"/>
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.22.46.png" width="200"/>

In news of othere writer user can not modify:

<p align="center">
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.19.24.png" width="200"/>

In news of othere writer user can not modify:

<p align="center">
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.23.33.png" width="200"/>
<img src="assets/Simulator Screenshot - iPhone 15 Pro Max - 2024-09-01 at 06.23.39.png" width="200"/>

## Language and freameWorkes
- Dart programming language
- Flutter framework

## Created by
**Yara Albouq**