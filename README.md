![Tuwaiq](./assets/TuwaiqAcademy.png)

# Project 5

## Overview

Project 5 is a Flutter application that showcases a blog management system with user authentication. Users can create, edit, and delete blog posts, The app includes a login system and a detailed account page where users can view and manage their blogs.

## Features

- **Login System**: Allows users to log in and manage their account.
- **Account Page**: Displays user information and a list of their blogs with options to view, edit, or delete.
- **Page Transitions**: Smooth animations for transitions between pages in the bottom navigation bar.
- **Category Selection**: Use of `ChoiceChip` for selecting categories.
- **Edit Confirmation**: A "save" button is added to confirm edits when modifying blog posts.
- **Blog Management**: Users can create, edit, and delete blog posts.
- **Data Storage**: Uses `GetStorage` for local data storage.

## Widgets Used

### BlogData

- **GetStorage**: Handles local storage of blog data.
- **addNewBlog**: Adds a new blog to the list and updates local storage.
- **deleteBlog**: Removes a blog from the list and updates local storage.
- **toggleFavorite**: Toggles the favorite status of a blog post and updates local storage.
- **loadBlogs**: Loads existing blogs from local storage upon initialization.

### LoginData

- **GetStorage**: Manages user login status and information.
- **addUser**: Adds a new user to the login data and sets the login status.
- **checkLogin**: Checks if a user is logged in by inspecting local storage.
- **getName**: Retrieves the name of the logged-in user from local storage.
- **logOut**: Logs out the user by removing login data from local storage.

## Dependencies

- `animations: ^2.0.11`: Provides smooth animations for transitions and other effects.
- `flutter`: The Flutter SDK for building cross-platform applications.
- `font_awesome_flutter: ^10.7.0`: FontAwesome icons for enhanced UI elements.
- `get_it: ^7.7.0`: Service locator for dependency management.
- `get_storage: ^2.1.1`: Local storage solution for persisting data.
- `google_fonts: ^6.2.1`: Custom fonts to style text elements.
- `intl: ^0.19.0`: Internationalization and localization support.

# Here is how it looks.

## Login Screen

![Login](./assets/screenshots/login%20screen.gif)
![Login](./assets/screenshots/login_screen%20guest.gif)

used status stays logged in even after leaving the app , untill they logout from the account page.

## Home Page

![Home](./assets/screenshots/home_page%20sliders%20saves.gif)

Save/Favorite buttons works well and the bar ontop of the image is made with Containers/Rows/Columns and PageView onPageChanged function.

## Add Blog

![Blog](./assets/screenshots/add%20blog.gif)

In the category part I used ChoiceChip widgets with SingleChildScrollView horizontily.

## Edit Blog

![Edit Blog](./assets/screenshots/blog_page%20edit.gif)
![Edit Blog](./assets/screenshots/blog_page%20save%20confirmation.gif)

For better User experience , I added Save button to confirm the changes after everychange made , And TextField controllers keep their value when wanting to edit the blog.

## Explorer Page

![Explorer](./assets/screenshots/explorer%20page.gif)

Searches are based on Blog's title.

## Saved Page

![Saved](./assets/screenshots/saved%20page.gif)

In this app the saves are stored in the users pc instead of users log.

## Account page

![Account](./assets/screenshots/account_page%20delete.gif)
![Account](./assets/screenshots/account_page%20edit.gif)

A confirmation message before deleting a blog .

## Restarting app

![Restart](./assets/screenshots/restarted%20app.gif)

Restarting the app will keep the blogs saved and login status.

## Transitions

![Transition](./assets/screenshots/page%20transition.gif)

A nice FadeScaleTransition in compination with an animation package.

Feel free to test the app yourself :)
