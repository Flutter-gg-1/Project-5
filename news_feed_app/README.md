# Blog App README

## Overview

This Blog App is designed to provide users with a platform for reading and writing blogs. It features user authentication, blog management, data storage, and the ability to save favorite blogs for easy access. The application utilizes Flutter for the front end and GetStorage for local data storage.

## Features

### User Authentication
![Simulator Screenshot - iPhone 15 - 2024-09-01 at 09 43 17](https://github.com/user-attachments/assets/8dbc03a8-99b3-4c1e-84b6-9ced41301822)

- **Login System**: Implement a login system using `GetStorage`.
- **Redirection**: If the user is already logged in, they are redirected to the Home page; otherwise, they are prompted to log in.

### Blog Management

- **Add Blog**: 
  - Logged-in users can create new blog posts.
  - Each blog post includes:
    - **Category**: The category of the blog post.
    - **Author Name**: The name of the author.
    - **Title**: The title of the blog post.
    - **Summary**: A brief summary of the blog.
    - **Content**: The full content of the blog.
    - **Date**: The date the blog was posted.
    - **Minutes to Read**: The estimated time required to read the blog.
    - **Post Image**: An image associated with the blog, selected via an image picker.
    -
    ![Simulator Screenshot - iPhone 15 - 2024-09-01 at 09 46 05](https://github.com/user-attachments/assets/43dae7fb-d8b3-4dea-8c6c-0fcc03ea75c8)

    ![Simulator Screenshot - iPhone 15 - 2024-09-01 at 09 45 39](https://github.com/user-attachments/assets/9718868f-916f-4e1a-aee6-1238479e62a7)

![Simulator Screenshot - iPhone 15 - 2024-09-01 at 09 46 37](https://github.com/user-attachments/assets/ce0a8aa5-d82f-4fa4-b7aa-e8c04f14d184)
![Simulator Screenshot - iPhone 15 - 2024-09-01 at 09 46 54](https://github.com/user-attachments/assets/ed97672c-f389-46c0-bf40-3c00ec1a3a31)

- **Update/Delete Blog**: Users can update or delete their existing blog posts.

![Simulator Screenshot - iPhone 15 - 2024-09-01 at 09 47 44](https://github.com/user-attachments/assets/25be9108-37d0-4a9c-8ed9-848e26b593cf)


### Data Storage
![Simulator Screenshot - iPhone 15 - 2024-09-01 at 09 47 11](https://github.com/user-attachments/assets/314d75d1-ec28-45c2-bd1a-072e81371ef0)


- **Local Storage**: All blogs are stored using a local storage solution (e.g., GetStorage).
- **Structured Database**: The app ensures a well-structured database to handle blog data efficiently.

### Blog Retrieval

- **Display Blogs**: Implement functionality to retrieve and display all blogs from local storage.

### Saved Blogs
![Simulator Screenshot - iPhone 15 - 2024-09-01 at 09 47 30](https://github.com/user-attachments/assets/a0da9c14-e5e7-4ea7-a0c5-32a0dd8421d8)


- **Favorite Blogs**: Users can save their favorite blogs for easy access later.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart
- GetStorage package

### Installation

1. Clone the repository:
2. flutter pub get
3. Run the app
