DROP DATABASE IF EXISTS dbws;
CREATE DATABASE dbws;
USE dbws;

CREATE TABLE Residence (
  rid INTEGER PRIMARY KEY,
  name VARCHAR(20)
);

CREATE TABLE Category (
  catid INTEGER PRIMARY KEY,
  name VARCHAR(30)
);
CREATE TABLE Location (
  lid INTEGER PRIMARY KEY,
  name VARCHAR(30)
);
CREATE TABLE EventDate (
  -- rethink this one! multiple with same primary key!
  recid INTEGER
);

CREATE TABLE User (
  uid INTEGER PRIMARY KEY,
  firstname VARCHAR(20),
  lastname VARCHAR(30),
  email VARCHAR(30),
  activated BOOLEAN,
  joined DATE,
  rid INTEGER,
  FOREIGN KEY (rid) REFERENCES Residence(rid)
);
CREATE TABLE Admin (
  uid INTEGER PRIMARY KEY,
  FOREIGN KEY (uid) REFERENCES User(uid)
);
CREATE TABLE Student (
  uid INTEGER PRIMARY KEY,
  FOREIGN KEY (uid) REFERENCES User(uid)
);
CREATE TABLE Staff (
  uid INTEGER PRIMARY KEY,
  FOREIGN KEY (uid) REFERENCES User(uid)
);
CREATE TABLE Professor (
  uid INTEGER PRIMARY KEY,
  FOREIGN KEY (uid) REFERENCES User(uid)
);

CREATE TABLE Notification (
  nid INTEGER PRIMARY KEY,
  uid INTEGER,
  FOREIGN KEY (uid) REFERENCES User(uid)
);
CREATE TABLE InviteNotification (
  nid INTEGER PRIMARY KEY
);
CREATE TABLE RequestNotification (
  nid INTEGER PRIMARY KEY
);

CREATE TABLE UserGroup (
  gid INTEGER PRIMARY KEY,
  name VARCHAR(30),
  max INTEGER
);
CREATE TABLE UserGroupMembership (
  gid INTEGER PRIMARY KEY,
  uid INTEGER UNIQUE,
  FOREIGN KEY (gid) REFERENCES UserGroup(gid),
  FOREIGN KEY (uid) REFERENCES User(uid)
);
CREATE TABLE UserGroupOwner (
  gid INTEGER PRIMARY KEY,
  uid INTEGER UNIQUE,
  FOREIGN KEY (gid) REFERENCES UserGroup(gid),
  FOREIGN KEY (uid) REFERENCES User(uid)
);

CREATE TABLE Event (
  eid INTEGER PRIMARY KEY,
  name VARCHAR(40),
  public BOOLEAN,
  gid INTEGER,
  lid INTEGER,
  catid INTEGER,
  FOREIGN KEY (gid) REFERENCES UserGroup(gid),
  FOREIGN KEY (lid) REFERENCES Location(lid),
  FOREIGN KEY (catid) REFERENCES Category(catid)
);
CREATE TABLE OneTimeEvent (
  eid INTEGER PRIMARY KEY,
  day INTEGER,
  starttime DATE,
  endtime DATE,
  FOREIGN KEY (eid) REFERENCES Event(eid)
);
CREATE TABLE RecurringEvent (
  reid INTEGER PRIMARY KEY,
  eid INTEGER UNIQUE,
  times INTEGER,
  FOREIGN KEY (eid) REFERENCES Event(eid)
);

CREATE TABLE Organizer (
  uid INTEGER PRIMARY KEY,
  eid INTEGER UNIQUE,
  FOREIGN KEY (uid) REFERENCES User(uid),
  FOREIGN KEY (eid) REFERENCES Event(eid)
);

CREATE TABLE Invite (
  iid INTEGER PRIMARY KEY,
  uid INTEGER,
  FOREIGN KEY (uid) REFERENCES User(uid)
);
CREATE TABLE EventInvite (
  iid INTEGER PRIMARY KEY,
  eid INTEGER,
  FOREIGN KEY (iid) REFERENCES Invite(iid),
  FOREIGN KEY (eid) REFERENCES Event(eid)
);
CREATE TABLE UserGroupInvite (
  iid INTEGER PRIMARY KEY,
  uid INTEGER,
  FOREIGN KEY (iid) REFERENCES Invite(iid),
  FOREIGN KEY (uid) REFERENCES User(uid)
);
