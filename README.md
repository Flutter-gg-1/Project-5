# Blog App Application 🎥

<p align="center">
  <a href="#goal">Goal</a> •
  <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#output">Output</a> •
</p>

## Goal 
Welcome to **Blog App Application 🎥** We’re here to help you exploring the world of bloging 
- Whether you want to watch and read or create your own with the ability to edit,save them and also delete all in one application


## Key Features 
I implemented a flutter application to represent the idea 📱by fully functional Blog App where users can log in, create, update, delete, and view blogs using GetIt for dependency injection and GetStorage for managing the login process.

1. **User Authentication**:
   - I implemented a login system using GetStorage and if the user is already logged in, a **Splach screen** will displayed and then will navigate to the home screen 
     otherwise, they should be prompted to log in and also can enter as guest 

2. **Blog Management**:
   only the loged in user can
   - **Add Blog** by filing the informations:
     - **Category**: The category of the blog post.
     - **Author Name**: The name of the author.
     - **Title**: The title of the blog post.
     - **Summary**: A brief summary of the blog.
     - **Content**: The full content of the blog.
     - **Date**: The date the blog was posted.
     - **Minutes to Read**: The estimated time required to read the blog.
     - **Post Image**: An image associated with the blog, selected via an image picker and if the user did not upload any a placeholder will be displayed

   - **Update/Delete Blog**: Allow users to update or delete their existing blog posts.

4. **Data Storage**: in the data storage i used GetStorage

6. **Saved Blogs**:
   - Also the loged in users can save their favorite blogs for easy access later.


## How To Use
- To clone and run this application, you'll need [Git](https://git-scm.com) and [Visual Studio Code] 
- to loged in use **username:** najwa   **password:** aldahri

```bash
# Clone this repository
$ git clone https: url

# Go into the repository
$ cd repo-name

# Open project in vs
$ code .

# Run the project 
$ dart run
```

## Contributing
#### I would be happy to have your ideas to improving the project. Please feel free to do so.
```bash
# Fork the project

# Create your feature branch
$ git checkout -b branch-name

# Commit your changes
$ git commit -m 'Add some commit'

# Push to the branch
$ git push

# Open a Pull Request

```

## Output 
To understand the project more here is a screenshot for two diffrent user flow 

1-User

![image](https://github.com/user-attachments/assets/3a6c679f-9746-4b8f-ba41-e40a8265b9c6)

2-Guest
![image](https://github.com/user-attachments/assets/cb1cfdd6-c848-48da-a443-9d4fa4101a1a)


You have reached the end of the project article.
Thank you for your reading ❤️




