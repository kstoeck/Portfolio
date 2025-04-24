# SpeakEasy (Team 4)
This application is a company discussion board where an admin can create discussion topics for employees to discuss while remaining anonymous. The employees can vote for suggestions they prefer which will highlight the feedback which is considered most important to them. The company can then use this information at its discretion. The admins can create, edit and delete discussion boards. They can raise new admin accounts, deactivate and reactivate user accounts, and delete reported posts along with all standard user abilities. A user can create an account, comment on a topic, reply to another users comment, vote for a comment, and report a comment to the admins.

## Required Libraries & Extensions
tkinter (for the GUI)
pillow (for the images)
mysql.connector (to connect to the database)

## To Run the Program
Make sure you have the following files and folders:
main.py (run the app from this file)
login.py
create_account.py
admin_review.py
edit_delete_board.py
speakEasyApp.py
SpeakEasy1.png
SpeakEasy3.png
README.md
read_me_screenshots (images used in the readme file)

Follow these steps to run the Application
1. Open your IDE of choice.
2. Install required Libraries & Extensions.
3. Open SpeakEasyApp folder in IDE.
4. Open main.py file from folder.
5. Run and Debug from main.py.

## Functionality

### Login

![login.png](read_me_screenshots\login.png)

From here you can enter a pre-exsisting user ID and password then click Login to enter the main functionality, the primary admin login is ID: 1 and Password: password. You can click the Create Account password to find the account creation functionality. Or you can click Exit to end the app.

### Create Account

![create_account.png](read_me_screenshots\create_account.png)

From here, you can create a new account. The user ID is a randomly generated list of 10 integers that you must save. You must enter a password that is 5 characters or more and then re-enter the password as a confirmation. You have the option to request admin access for your account at this stage. The Create Account button will check if all requirements have been met, then save the new account to the database.

### App Home

![speak_easy_main.png](read_me_screenshots\speak_easy_main.png)

This is the app home page, on the left side of the screen you will find pre-existing topic categories that if selected will lead to a list of topics in that category.

Example: (Selecting the General Discussions category)
![select_category.png](read_me_screenshots\select_category.png)

From here you can select one of the newly populated topic in the center which will lead to the discussion board on that topic.

Example: (Selecting the Company News topic)
![select_topic.png](read_me_screenshots\select_topic.png)

From here you can create a new thread by selecting the Create New Thread button just under the topic titla at the top middle of the screen. This will lead to the following screen pop-up.

Example: (Select Create New Thread)
![new_thread.png](read_me_screenshots\new_thread.png)

At this point you will be required to enter a title for your new thread and enter the content of your message. Once you select the Save Thread button. You will return to the discussion board that will refresh with your new thread added.

Example: (Select Save Thread)
![save_thread.png](read_me_screenshots\save_thread.png)

Under each thread there is 3 buttons that can be used. The first is the vote button. Users have the ability to vote for any thread or reply they choose. When the vote button is selected, the board will refresh and the number of votes shown on the button will increase. The next button is the Report button. Selecting this button will send the thread to the admins Review Reported Posts page. The final button is the reply button which will bring up replies to that thread and allow the user to discuss the thread with others.

Example: (Vote for the Previously Created Thread)
![prevote.png](read_me_screenshots\prevote.png)
![post_vote.png](read_me_screenshots\post_vote.png)

Example: (Select Reply Button)
![reply.png](read_me_screenshots\reply.png)

Example: (Select Post Reply)
![post_reply.png](read_me_screenshots\post_reply.png)

Example: (Select Save Reply)
![posted_reply.png](read_me_screenshots\posted_reply.png)

Example: (Select Back)
![back.png](read_me_screenshots\back.png)

At this point you will see that the Vote and Reply numbers has increased by 1. I have also chosen to report the new Thread and the reply to the new thread.

On the top right of the screen, you will see current users ID and their Kudo Points which is the number of times others have voted for their contributions.

Example: (User ID and Kudo Points)
![top_right.png](read_me_screenshots\top_right.png)

Under those, you will find the admin buttons which will only appear when an admin is logged in.

Example: (Is an Admin)
![back.png](read_me_screenshots\back.png)

Example: (Is Not an Admin)
![not_admin.png](read_me_screenshots\not_admin.png)

The first admin button found is Create Board. This will allow an admin to create a new topic in one of the categories.

Example: (Select Create Board)
![create_board.png](read_me_screenshots\create_board.png)

You will click the drop down menu at the top to select what category to put the new topic, then fill in the topic title and initial topic thread. Finally you click submit to enter the new discussion board.

Example: (New Discussion Board 'New General Topic' Created)
![new_topic.png](read_me_screenshots\new_topic.png)

Next there is the Edit button which allows an admin to edit one of the previously created topics.

Example: (Select Edit)
![edit_topic.png](read_me_screenshots\edit_topic.png)

By selecting one of the topics and clicking the Edit button you will find a pop-up that allows you to edit the title of a topic board.

Example: (Edit Pop-up)
![edit.png](read_me_screenshots\edit.png)

Next on the list is the Delete button which similar to the Edit button brings up a list of topics that you can select and delete by clicking the delete button.

Example: (Select Delete)
![delete.png](read_me_screenshots\delete.png)

When you choose to delete a topic you will have to verify that you want to delete it. You can either exit out of the pop-up to refuse or select COnfirm Delete to delet the topic.

Example: (Delete Verification)
![delete_verify.png](read_me_screenshots\delete_verify.png)

Next, we have the Review Admin Requests. This is where an admin can either approve or deny new admin accounts.

Example: (Select Review Admin Requests)
![review_admin.png](read_me_screenshots\review_admin.png)

Here an admin can select one of the user accounts that requested admin status and either select the Approve or Deny buttons at the bottom of the screen.

Then we have the Review Reported Posts button, where an admin can see thread posts and replies that users have reported. They can review the thread content, title and see what user account made it. They can then decide to remove or ignore the post. If the screen is blank, nothing has been reported or all reports have already been resolved.

Example: (Select Review Reported Posts)
![reported_posts.png](read_me_screenshots\reported_posts.png)

The final admin button is the Manage Members button. This functionality allows an admin to deactivate and reactivate user and admin accounts. It does not delete these accounts from the database. To make changes, you click the checkboxes. If a box is checked the account is active and if it is not checked it is not active. You then click the Update Members button which will save your changes. Never change Member ID: 1 to inactive, that account is the root admin.

Example: (Select Manage Members)
![manage_members.png](read_me_screenshots\manage_members.png)

And lastly the logout button which will bring you back to the login screen and reset the user ID to none.

## Database
Our database is formated with 4 tables. main, member, votes, and board. The main table tracks the individual thread posts and replies along with votes for that post and if that post was reported. The member table track account information such as user ID, password, admin status, and votes. The votes table makes sure no account votes for the same thread or reply more than once. And finaly the board table tracks the topics.

Example: (main Table)
![main.png](read_me_screenshots\main.png)

Example: (member Table)
![member.png](read_me_screenshots\member.png)

Example: (votes Table)
![votes.png](read_me_screenshots\votes.png)

Example: (board Table)
![board.png](read_me_screenshots\board.png)


# END