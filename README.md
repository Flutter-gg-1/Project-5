# Blog Nest

BlogNest is a Flutter-based application designed to provide users with a seamless blogging experience. It enables users to log in, create, update, delete, and view blogs while adhering to clean code principles. This project focuses on implementing core functionalities like user authentication, blog management, and local data storage using GetIt for dependency injection and GetStorage for managing the login process. BlogNest is a complete solution for managing blog content efficiently and serves as a foundation for future enhancements.

![App Clip](blogNest.gif)

## Table of Contents

- [App Overview](#app-overview)
- [Features](#features)
- [Data Models](#data-models)
- [Design Philosophy](#design-philosophy)
- [Getting Started](#getting-started)
- [Future Enhancements](#future-enhancements)
- [Created By](#created-by)

## App Overview

### Features

1. **User Authentication**
   - Implements a login system using GetStorage.
   - Redirects users to the Home page if already logged in; otherwise, prompts login.

2. **Home**
   - Displays a list of all blog posts, organized by category.
   - Users can view blog details, including the title, summary, content, and related information.

3. **Blog Management**
   - Allows logged-in users to create, update, and delete their blog posts.
   - Each blog post includes a category, author name, title, summary, content, date, minutes to read, and an image.

4. **Saved Blogs**
   - Users can save their favorite blogs for easy access later.

5. **Search Functionality**
   - Allows users to search for blogs based on keywords.

### Data Models

The app’s code includes data models for the following entities:

- **Blog:** Contains details like category, author name, title, summary, content, date, minutes to read, and an associated image.
- **User:** Details about the user, including login information and saved blogs.
- **Bookmark:** Saved blogs.

### Design Philosophy

- **OOP & Clean Code:** BlogNest is built using Object-Oriented Programming principles to ensure a maintainable and scalable codebase. Clean Code practices are followed to make the code easy to read, understand, and extend.
- **UI Design:** The app is designed with a focus on simplicity and user experience, ensuring that users can easily navigate and manage their blogs.

### Functionality

BlogNest is a fully functional blog management app, focusing on both UI design and backend functionality. The app supports full user interaction, including blog creation, management, and retrieval, with data stored locally.

## Getting Started

### Prerequisites

- Flutter SDK
- A code editor (such as VS Code or Android Studio)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/amer266030/Project-5/blog_nest.git
   ```

2. Navigate to the project directory:

    ```bash
   cd Project-5/blog_nest.git
   ```

3. Get the dependencies:

    ```bash
   flutter pub get
   ```

4. Run the app:
    ```bash
   flutter run
   ```

### Future Enhancements

* User Profiles: Implement additional user profile features and advanced authentication mechanisms.

* Content Delivery: Implement cloud storage and backend integration for scalable content management.

## Created By

- **Amer Alyusuf**
- [Personal Website](https://amer266030.github.io)
- [LinkedIn](https://www.linkedin.com/in/amer-alyusuf-77398587)