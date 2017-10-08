DROP DATABASE IF EXISTS dbws;
CREATE DATABASE dbws;
USE dbws;

CREATE TABLE Residence (
	rid INT,
	name VARCHAR(20), -- College name
	PRIMARY KEY (rid)
);

CREATE TABLE Category (
	catid INT,
	name VARCHAR(30),
	PRIMARY KEY (catid)
);

CREATE TABLE Location (
	locid INT,
	name VARCHAR(30),
	PRIMARY KEY (locid)
);

CREATE TABLE RecurringSingle (
	rsid INT,
	recid INT,
	day DATE,
	starttime TIME,
	endtime TIME,
	PRIMARY KEY (rsid),
	FOREIGN KEY (recid) REFERENCES RecurringEvent(recid)
);

CREATE TABLE User (
	uid INT,
	firstname VARCHAR(30),
	lastname VARCHAR(30),
	email VARCHAR(30),
	activated BOOLEAN,
	joined DATE,
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
	FOREIGN KEY (uid) REFERENCES User(uid)
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
	nid INT,
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

-- Groups can be official or unofficial groups i.e. CS Club, J-Capella, or Squad
	CREATE TABLE UserGroup (
	gid INT,
	name VARCHAR(30),
	max INT, -- Maximum number of members in a group
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
	eid INT,
	name VARCHAR(40),
	public BOOLEAN,
	gid INT,
	locid INT,
	catid INT,
	max INT, -- Maximum number of people in an event
	PRIMARY KEY (eid),
	FOREIGN KEY (gid) REFERENCES UserGroup(gid),
	FOREIGN KEY (lid) REFERENCES Location(lid),
	FOREIGN KEY (catid) REFERENCES Category(catid)
);

CREATE TABLE OneTimeEvent (
	eid INT,
	day DATE,
	starttime TIME,
	endtime TIME,
	PRIMARY KEY (eid),
	FOREIGN KEY (eid) REFERENCES Event(eid)
);

CREATE TABLE RecurringEvent (
	recid INT,
	eid INT UNIQUE,
	occurrences INT,
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
	iid INT,
	uid INT,
	message VARCHAR(100),
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
	reqid INT,
	uid INT,
	message VARCHAR(256),
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
