CREATE TABLE Users
(
	user_id 		SERIAL	 		NOT NULL -- Do not specify when inserting
		PRIMARY KEY,
	first_name		VARCHAR(20),
	last_name		VARCHAR(20),
	username		VARCHAR(20)		NOT NULL,
	password		VARCHAR(72)		NOT NULL,
	email			VARCHAR(320)	NOT NULL,
	skype_address	VARCHAR(50),
	created			TIMESTAMP		NOT NULL -- Do not specify when inserting
		DEFAULT NOW()
);

CREATE TABLE Languages
(
	user_id		INTEGER	NOT NULL	REFERENCES Users (user_id),
	language	CHAR(3)	NOT NULL -- Three character code according to ISO 631-1
);

CREATE TABLE GradeLevel
(
	grade_level_id	SERIAL	NOT NULL -- Do not specify when inserting
		PRIMARY KEY,
	name			TEXT	NOT NULL
);

CREATE TABLE Students
(
	student_id		INTEGER	NOT NULL	REFERENCES Users (user_id)
		PRIMARY KEY,
	grade_level_id	INTEGER	NOT NULL	REFERENCES GradeLevel (grade_level_id)
);

CREATE TABLE Teachers
(
	teacher_id		INTEGER	NOT NULL	REFERENCES Users (user_id)
		PRIMARY KEY
);

/*
 * Teachers may be available for help via Skype
 * for multiple intervals on any given day, so
 * we use this table to keep track.
 */
CREATE TABLE TeacherAvailability
(
	teacher_id	INTEGER		NOT NULL	REFERENCES Teachers (teacher_id),
	dow			INTEGER		NOT NULL	CHECK (dow >=0 and dow <=6), -- Day of week
	start_time	TIMESTAMP	NOT NULL,
	end_time	TIMESTAMP	NOT NULL
		CHECK (end_time-start_time >= TIME '0:00:00')
);

CREATE TABLE Category
(
	category_id	SERIAL		NOT NULL -- Do not specify when inserting
		PRIMARY KEY,
	name		TEXT		NOT NULL,
	created		TIMESTAMP	NOT NULL -- Do not specify when inserting
		DEFAULT NOW()
);

CREATE TABLE Worksheets
(
	worksheet_id	SERIAL		NOT NULL -- Do not specify when inserting
		PRIMARY KEY,
	creator_id		INTEGER		NOT NULL	REFERENCES Users (user_id),
	grade_level_id	INTEGER		NOT NULL
		REFERENCES GradeLevel (grade_level_id),
	category_id		INTEGER		NOT NULL	REFERENCES Category (category_id),
	content			TEXT		NOT NULL, -- Link to CDN
	created			TIMESTAMP	NOT NULL -- Do not specify when inserting
		DEFAULT NOW()
);

CREATE TABLE Submitted
(
	submission_id	SERIAL	NOT NULl -- Do not specify when inserting
		PRIMARY KEY,
	worksheet_id	INTEGER	NOT NULL	REFERENCES Worksheets (worksheet_id),
	student_id		INTEGER NOT NULL	REFERENCES Students (student_id),
	content			TEXT	NOT NULL -- Link to CDN
);

CREATE TABLE SubmissionModifyDate
(
	submission_id	INTEGER	NOT NULL	REFERENCES Submitted (submission_id),
	modified		TIMESTAMP	NOT NULL -- Do not specify when inserting
		DEFAULT NOW()
);

CREATE TABLE Returned
(
	submission_id	INTEGER	NOT NULL	REFERENCES Submitted (submission_id),
	teacher_id		INTEGER	NOT NULL	REFERENCES Teachers (teacher_id),
	feedback		TEXT	NOT NULL, -- Link to CDN
	grade			INTEGER	NOT NULL	CHECK (grade >= 0 and grade <= 100)
);
