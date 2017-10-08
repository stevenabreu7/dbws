DROP DATABASE IF EXISTS dbws;
CREATE DATABASE dbws;
USE dbws;

CREATE TABLE Residence (
rid INT AUTO_INCREMENT,
name VARCHAR(20) NOT NULL, -- College name
PRIMARY KEY (rid)
);

CREATE TABLE Category (
catid INT AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
PRIMARY KEY (catid)
);

CREATE TABLE Location (
	locid INT AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL,
	PRIMARY KEY (locid)
);

CREATE TABLE RecurringSingle (
	rsid INT AUTO_INCREMENT,
	recid INT,
	day DATE NOT NULL,
	starttime TIME NOT NULL,
	endtime TIME NOT NULL,
	PRIMARY KEY (rsid),
	FOREIGN KEY (recid) REFERENCES RecurringEvent(recid)
);

CREATE TABLE User (
	uid INT AUTO_INCREMENT,
	firstname VARCHAR(30) NOT NULL,
	lastname VARCHAR(30) NOT NULL,
	email VARCHAR(30) NOT NULL,
	activated BOOLEAN NOT NULL,
	joined DATE NOT NULL,
	rid INT,
	PRIMARY KEY (uid),
	FOREIGN KEY (rid) REFERENCES Residence(rid)
);

CREATE TABLE Admin (
	uid INT,
	PRIMARY KEY (uid),
	FOREIGN KEY (uid) REFERENCES User(uid)
);

CREATE TABLE Student (
	uid INT,
	major VARCHAR(30),
	rid VARCHAR (20),
	PRIMARY KEY (uid),
	FOREIGN KEY (uid) REFERENCES User(uid),
	FOREIGN KEY (rid) REFERENCES Residence(rid)
);

CREATE TABLE Staff (
	uid INT,
	department VARCHAR(30),
	PRIMARY KEY (uid),
	FOREIGN KEY (uid) REFERENCES User(uid)
);

CREATE TABLE Professor (
	uid INT,
	research_area VARCHAR(30),
	PRIMARY KEY (uid),
	FOREIGN KEY (uid) REFERENCES User(uid)
);

CREATE TABLE Notification (
	nid INT AUTO_INCREMENT,
	uid INT,
	Message VARCHAR(256),
	PRIMARY KEY (nid),
	FOREIGN KEY (uid) REFERENCES User(uid)
);

CREATE TABLE InviteNotification (
	nid INT,
	PRIMARY KEY (nid),
	FOREIGN KEY (nid) REFERENCES Notification(nid)
);

CREATE TABLE RequestNotification (
	nid INT,
	PRIMARY KEY (nid),
	FOREIGN KEY (nid) REFERENCES Notification(nid)
);

-- Groups can be official or unofficial groups i.e. "CS Club", "J-Capella", or a friend group, like "Squad"
CREATE TABLE UserGroup (
	gid INT AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL,
	max INT, -- Maximum number of members in a group
	description VARCHAR(256),
	PRIMARY KEY (gid)
);

CREATE TABLE UserGroupMembership (
	gid INT,
	uid INT,
	PRIMARY KEY (gid, uid),
	FOREIGN KEY (gid) REFERENCES UserGroup(gid),
	FOREIGN KEY (uid) REFERENCES User(uid)
);

CREATE TABLE UserGroupOwner (
	gid INT,
	uid INT,
	PRIMARY KEY (gid, uid),
	FOREIGN KEY (gid) REFERENCES UserGroup(gid),
	FOREIGN KEY (uid) REFERENCES User(uid)
);

CREATE TABLE Event (
	eid INT AUTO_INCREMENT,
	name VARCHAR(40) NOT NULL,
	public BOOLEAN,
	gid INT,
	locid INT,
	catid INT,
	max INT, -- Maximum number of people in an event, can be null (no limit)
	PRIMARY KEY (eid),
	FOREIGN KEY (gid) REFERENCES UserGroup(gid),
	FOREIGN KEY (lid) REFERENCES Location(lid),
	FOREIGN KEY (catid) REFERENCES Category(catid)
);

CREATE TABLE OneTimeEvent (
	eid INT,
	day DATE,
	starttime TIME NOT NULL,
	endtime TIME NOT NULL,
	PRIMARY KEY (eid),
	FOREIGN KEY (eid) REFERENCES Event(eid)
);

CREATE TABLE RecurringEvent (
	recid INT AUTO_INCREMENT,
	eid INT,
	occurrences INT NOT NULL,
	PRIMARY KEY(recid),
	FOREIGN KEY (eid) REFERENCES Event(eid)
);

CREATE TABLE Organizer (
	uid INT,
	eid INT,
	PRIMARY KEY (uid, eid),
	FOREIGN KEY (uid) REFERENCES User(uid),
	FOREIGN KEY (eid) REFERENCES Event(eid)
);

CREATE TABLE Invite (
	iid INT AUTO_INCREMENT,
	uid INT,
	message VARCHAR(256),
	decision BOOLEAN,
	PRIMARY KEY (iid),
	FOREIGN KEY (uid) REFERENCES User(uid)
);

CREATE TABLE EventInvite (
	iid INT,
	eid INT,
	PRIMARY KEY (iid),
	FOREIGN KEY (iid) REFERENCES Invite(iid),
	FOREIGN KEY (eid) REFERENCES Event(eid)
);

CREATE TABLE UserGroupInvite (
	iid INT,
	gid INT,
	PRIMARY KEY (iid),
	FOREIGN KEY (iid) REFERENCES Invite(iid),
	FOREIGN KEY (gid) REFERENCES User(gid)
);

CREATE TABLE EventAttendance (
	uid INT,
	eid INT,
	PRIMARY KEY (uid, eid),
	FOREIGN KEY (uid) REFERENCES User (uid),
	FOREIGN KEY (eid) REFERENCES Event (eid)
);

CREATE TABLE Request (
	reqid INT AUTO_INCREMENT,
	uid INT,
	message VARCHAR(256) NOT NULL,
	decision BOOL,
	PRIMARY KEY (reqid),
	FOREIGN KEY (uid) REFERENCES User(uid)
);

CREATE TABLE EventRequest (
	reqid INT,
	eid INT,
	PRIMARY KEY (reqid),
	FOREIGN KEY (reqid) REFERENCES Request(reqid),
	FOREIGN KEY (eid) REFERENCES Event(eid)
);

CREATE TABLE SingularAttendance (
	uid INT,
	eid INT,
	PRIMARY KEY (uid, eid),
	FOREIGN KEY (uid) REFERENCES User(uid),
	FOREIGN KEY (eid) REFERENCES Event(eid)
);

CREATE TABLE RecurringAttendance (
	uid INT,
	rsid INT,
	PRIMARY KEY (uid, rsid),
	FOREIGN KEY (uid) REFERENCES User(uid),
	FOREIGN KEY (rsid) REFERENCES RecurringSingle(rsid)
);