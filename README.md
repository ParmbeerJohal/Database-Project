# Setup

## DB Setup
- Create user 370admin
- Set password to 'password'
- Create postgres server
- Add role '370admin' to server
- Add db 'db' to server
### To connect manually
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
