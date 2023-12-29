-- Creating the Faculty table
CREATE TABLE Faculty (
    FacultyID CHAR(4) NOT NULL,
    Program VARCHAR2(255) NOT NULL,
    PRIMARY KEY (FacultyID)
);

-- Creating the City table
CREATE TABLE City (
    CityID CHAR(4) NOT NULL,
    City VARCHAR2(50) NOT NULL,
    Province VARCHAR2(20) NOT NULL,
    PRIMARY KEY (CityID)
);

-- Creating the userProfile table
CREATE TABLE userProfile (
    ProfileID CHAR(13) NOT NULL,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    ProfilePicture BLOB,
    Bio VARCHAR2(255),
    Faculty CHAR(4),
    Major VARCHAR2(30),
    PRIMARY KEY (ProfileID),
    FOREIGN KEY (Faculty) REFERENCES Faculty(FacultyID)
);

-- Creating the userAccount table
CREATE TABLE userAccount (
    UserID CHAR(13) NOT NULL,
    Email VARCHAR2(100) NOT NULL UNIQUE,
    ProfileID CHAR(13) NOT NULL,
    Password VARCHAR2(255) NOT NULL,
    PRIMARY KEY (UserID, Email, ProfileID),
    FOREIGN KEY (ProfileID) REFERENCES userProfile(ProfileID) ON DELETE CASCADE
);

-- Creating the Post table
CREATE TABLE Post (
    PostID CHAR(13) NOT NULL,
    Title VARCHAR2(255) NOT NULL,
    Rating NUMBER(5),
    TextReview VARCHAR2(255),
    City CHAR(4) NOT NULL,
    PostTime VARCHAR2(28),
    ProfileID CHAR(13) NOT NULL,
    PostPhoto BLOB,
    PRIMARY KEY (PostID),
    FOREIGN KEY (City) REFERENCES City(CityID),
    FOREIGN KEY (ProfileID) REFERENCES userProfile(ProfileID) ON DELETE CASCADE
);

-- Creating the Media table
CREATE TABLE Media (
    MediaID CHAR(13) NOT NULL,
    PostID CHAR(13) NOT NULL,
    PRIMARY KEY (MediaID, PostID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID) ON DELETE CASCADE
);

-- Creating the Photo table
CREATE TABLE Photo (
    PhotoID CHAR(13) NOT NULL,
    MediaID CHAR(13) NOT NULL,
    MediaPostID CHAR(13) NOT NULL,
    ReviewPhoto BLOB,
    PRIMARY KEY (PhotoID),
    FOREIGN KEY (MediaID, MediaPostID) REFERENCES Media(MediaID, PostID) ON DELETE CASCADE
);

-- Creating the Video table
CREATE TABLE Video (
    VideoID CHAR(13) NOT NULL,
    MediaID CHAR(13) NOT NULL,
    MediaPostID CHAR(13) NOT NULL,
    Video1 BLOB,
    Video2 BLOB,
    Video3 BLOB,
    PRIMARY KEY (VideoID),
    FOREIGN KEY (MediaID, MediaPostID) REFERENCES Media(MediaID, PostID) ON DELETE CASCADE
);

-- Creating the Likes table
CREATE TABLE Likes (
    LikeID CHAR(13) NOT NULL,
    PostID CHAR(13) UNIQUE,
    Likes NUMBER(10),
    PRIMARY KEY (LikeID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID) ON DELETE CASCADE
);

-- Creating the Tags table
CREATE TABLE Tags (
    TagsID CHAR(13) NOT NULL,
    PostID CHAR(13),
    UserID CHAR(13) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    ProfileID CHAR(13) NOT NULL,
    TagContent VARCHAR2(255),
    PRIMARY KEY (TagsID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (UserID, Email, ProfileID) REFERENCES userAccount(UserID, Email, ProfileID)
);

-- Creating Comments table
CREATE TABLE Comments (
    CommentsID CHAR(13) NOT NULL,
    PostID CHAR(13),
    UserID CHAR(13) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    ProfileID CHAR(13) NOT NULL,
    CommentContent VARCHAR2(500),
    CommentTime VARCHAR2(35),
    PRIMARY KEY (CommentsID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID) ON DELETE CASCADE,
    FOREIGN KEY (UserID, Email, ProfileID) REFERENCES userAccount(UserID, Email, ProfileID) ON DELETE CASCADE
);

-- Creating the Friends table
CREATE TABLE Friends (
    UserID CHAR(13) NOT NULL,
    UserEmail VARCHAR2(100) NOT NULL,
    UserProfileID CHAR(13) NOT NULL,
    FriendUserID CHAR(13) NOT NULL,
    FriendUserEmail VARCHAR2(100) NOT NULL,
    FriendUserProfileID CHAR(13) NOT NULL,
    PRIMARY KEY (UserID, UserEmail, UserProfileID, FriendUserID, FriendUserEmail, FriendUserProfileID),
    FOREIGN KEY (UserID, UserEmail, UserProfileID) REFERENCES userAccount(UserID, Email, ProfileID),
    FOREIGN KEY (FriendUserID, FriendUserEmail, FriendUserProfileID) REFERENCES userAccount(UserID, Email, ProfileID)
);

-- Insert Faculty Information
INSERT INTO Faculty (FacultyID, Program) VALUES ('APSC', 'Applied Science');
INSERT INTO Faculty (FacultyID, Program) VALUES ('ARCH', 'Architecture and Landscape Architecture');
INSERT INTO Faculty (FacultyID, Program) VALUES ('ARTS', 'Arts');
INSERT INTO Faculty (FacultyID, Program) VALUES ('AUDI', 'Audiology and Speech Sciences');
INSERT INTO Faculty (FacultyID, Program) VALUES ('SAUD', 'Business Sauder');
INSERT INTO Faculty (FacultyID, Program) VALUES ('CRPL', 'Community and Regional Planning');
INSERT INTO Faculty (FacultyID, Program) VALUES ('DENT', 'Dentistry');
INSERT INTO Faculty (FacultyID, Program) VALUES ('EDUC', 'Education');
INSERT INTO Faculty (FacultyID, Program) VALUES ('EXTL', 'Extended Learning');
INSERT INTO Faculty (FacultyID, Program) VALUES ('FRST', 'Forestry');
INSERT INTO Faculty (FacultyID, Program) VALUES ('GRAD', 'Graduate and Postdoctoral Studies');
INSERT INTO Faculty (FacultyID, Program) VALUES ('JRNL', 'Journalism');
INSERT INTO Faculty (FacultyID, Program) VALUES ('KINE', 'Kinesiology');
INSERT INTO Faculty (FacultyID, Program) VALUES ('LFS', 'Land and Food Systems');
INSERT INTO Faculty (FacultyID, Program) VALUES ('LAW', 'Law, Peter A');
INSERT INTO Faculty (FacultyID, Program) VALUES ('LIBR', 'Library, Archival and Information Studies');
INSERT INTO Faculty (FacultyID, Program) VALUES ('MED', 'Medicine');
INSERT INTO Faculty (FacultyID, Program) VALUES ('MUSC', 'Music');
INSERT INTO Faculty (FacultyID, Program) VALUES ('NURS', 'Nursing');
INSERT INTO Faculty (FacultyID, Program) VALUES ('PHAR', 'Pharmaceutical Sciences');
INSERT INTO Faculty (FacultyID, Program) VALUES ('POPH', 'Population and Public Health');
INSERT INTO Faculty (FacultyID, Program) VALUES ('PPGA', 'Public Policy and Global Affairs');
INSERT INTO Faculty (FacultyID, Program) VALUES ('SCIE', 'Science');
INSERT INTO Faculty (FacultyID, Program) VALUES ('SOWK', 'Social Work');
INSERT INTO Faculty (FacultyID, Program) VALUES ('VANT', 'UBC Vantage College');
INSERT INTO Faculty (FacultyID, Program) VALUES ('VSE', 'Vancouver School of Economics');

-- Insert City Information
INSERT INTO City (CityID, City, Province) VALUES ('0001', 'Vancouver', 'BC');
INSERT INTO City (CityID, City, Province) VALUES ('0002', 'Surrey', 'BC');
INSERT INTO City (CityID, City, Province) VALUES ('0003', 'Richmond', 'BC');
INSERT INTO City (CityID, City, Province) VALUES ('0004', 'Burnaby', 'BC');
INSERT INTO City (CityID, City, Province) VALUES ('0005', 'New Westminster', 'BC');
INSERT INTO City (CityID, City, Province) VALUES ('0006', 'Langley', 'BC');
INSERT INTO City (CityID, City, Province) VALUES ('0007', 'Coquitlam', 'BC');
INSERT INTO City (CityID, City, Province) VALUES ('0008', 'Delta', 'BC');