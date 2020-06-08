# Scenario
Universal math-education (or a free math-enrichment program on the web)
A non-profit organization interested in universal math-education (or a math-enrichment program) wants to develop a website which allows any child in the world who has access to the internet to do math home-work practice using their math worksheets. Initially, they want to start with math material related to K1-12 and later expand to cover practice material for college level as well. The students will be able to learn math in this manner because at the beginning of each math worksheet there would be a brief introduction to the math concepts covered in the particular sheet or links to sections of text books freely available on the internet where the relevant concepts are explained. What is only required from the learner is the motivation for self-learning.
This organization has a pool of voluntary teachers who are willing to mark the work sheets done by the students and provide feedback. Initially it will be only available in English, but later they want to translate the math work sheets to other world languages as they find volunteers to do the work. What a student will do?
A student who access this website for the first time needs to register herself. Then she can start at a level which is appropriate for her (as she thinks). Download the worksheet, attempt questions, make a scan or take a clear picture of the finished work with a mobile phone and upload her work for marking. Within a specified time, a volunteer teacher will mark her work and upload the marked assignment with the teacher’s comments. Then the student has either the option of redoing it (or attempting a similar math worksheet) or go to the previous/next math work-sheet as suggested by the teacher. So, the process will continue that way as the student progresses with her learning.
The organization wants to store contact details, the level at which the student is studying in her home country and keep track of the progress of all students registered with the website (i.e. the level of the math worksheet, marks allocated, teacher’s comments, etc.) because they want the best students to be trained for Math Olympiads (using the same process as for home-work training), keep details of volunteer teachers (their contact details, availability, languages in which they could provide feedback and expertise), details of all math worksheets (level, created by whom categorized by the field; geometry, algebra, etc.) and to store math worksheets.
Further, depending on the available resources they hope to have Skype (or similar video conferencing) sessions between a student and a teacher in the student’s native language or in English (as required).

## DB Setup
- Create user 370admin
- Set password to 'password'
- Create postgres server
- Add role '370admin' to server
- Add db 'db' to server
## To connect manually
`su 370admin`
Enter password

`psql -h localhost -p 5432 -d db`
Enter password

## Webpage Setup (command line)
- Download repository above
- Switch into directory where 'main.py' is
- run '%python main.py' or '%python3 main.py'
- go to browser, and type 'localhost:8080' or '0.0.0.0:8080' into the URL
- type 'localhost:8080/data' to look at stored data
