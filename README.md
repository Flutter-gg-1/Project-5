# Project Description: Blog App

#### Overview
In this project, you will create a fully functional Blog App where users can log in, create, update, delete, and view blogs. The app should follow clean code principles and utilize GetIt for dependency injection and GetStorage for managing the login process. You will store all blog data locally, ensuring a well-structured database to manage the content effectively.

#### Features and Requirements

1. **User Authentication**:
   - Implement a login system using GetStorage. 
   - If the user is already logged in, they should be redirected to the Home page; otherwise, they should be prompted to log in.

2. **Blog Management**:
   - **Add Blog**: Allow logged-in users to create new blog posts. Each blog should include the following content:
     - **Category**: The category of the blog post.
     - **Author Name**: The name of the author.
     - **Title**: The title of the blog post.
     - **Summary**: A brief summary of the blog.
     - **Content**: The full content of the blog.
     - **Date**: The date the blog was posted.
     - **Minutes to Read**: The estimated time required to read the blog.
     - **Post Image**: An image associated with the blog, selected via an image picker.

   - **Update/Delete Blog**: Allow users to update or delete their existing blog posts.

3. **Data Storage**:
   - Store all blogs using a local storage solution (e.g., GetStorage).
   - Ensure a well-structured database to handle blog data efficiently.

4. **Blog Retrieval**:
   - Implement functionality to retrieve and display all blogs from local storage.

5. **Saved Blogs**:
   - Allow users to save their favorite blogs for easy access later.

6. **Search Functionality**:
   - Implement a search feature that enables users to search for blogs based on keywords (extra functionality, not required).

7. **Figma Design**:
   - [Figm Design Link](https://www.figma.com/design/08HSoZqTxjTsHhHNR06qgd/News-Feed-App-%E2%80%93-UI-Design-(Community)?node-id=1-2&t=GV2ndX0cQAo4YDuf-1)

#### Technical Requirements
- **Clean Code**: Ensure that your code follows best practices in terms of readability, maintainability, and organization.
- **GetIt**: Use GetIt for dependency injection to manage your app's dependencies efficiently.
- **GetStorage**: Implement GetStorage for storing user login data and blog posts.

#### Extra Points
- Implement additional UI elements like bottom sheets, TabBarView, TabBar, and PageView.
- Enhance the app with smooth navigation and animations to improve user experience.

### Submission
- **Deadline**: The project must be submitted before September 1, 9:59 AM.
- Ensure that your project is well-documented, with a README file explaining the features, setup instructions, and any additional notes on the implementation. Show your creativity in both the design and functionality of your Blog App!
