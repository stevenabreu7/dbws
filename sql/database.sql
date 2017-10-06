CREATE TABLE Residence (
  rid INTEGER PRIMARY KEY,
  name VARCHAR(20)
);

CREATE TABLE Category (
  placeholder INTEGER
);
CREATE TABLE Location (
  placeholder INTEGER
);
CREATE TABLE EventDate (
  placeholder INTEGER
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
  placeholder INTEGER
);
CREATE TABLE Staff (
  placeholder INTEGER
);
CREATE TABLE Professor (
  placeholder INTEGER
);

CREATE TABLE Notification (
  placeholder INTEGER
);
CREATE TABLE InviteNotification (
  placeholder INTEGER
);
CREATE TABLE RequestNotification (
  placeholder INTEGER
);

CREATE TABLE UserGroup (
  placeholder INTEGER
);
CREATE TABLE UserGroupMembership (
  placeholder INTEGER
);
CREATE TABLE UserGroupOwner (
  placeholder INTEGER
);

CREATE TABLE Event (
  eid INTEGER PRIMARY KEY,
  name VARCHAR(40),
  public BOOLEAN,
  gid INTEGER,
  locid INTEGER,
  catid INTEGER
  -- FOREIGN KEY (gid) REFERENCES Group(gid),
  -- FOREIGN KEY (lid) REFERENCES Location(lid),
  -- FOREIGN KEY (catid) REFERENCES Category(catid)
);
CREATE TABLE OneTimeEvent (
  placeholder INTEGER
);
CREATE TABLE RecurringEvent (
  placeholder INTEGER
);

CREATE TABLE Organizer (
  placeholder INTEGER
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
  placeholder INTEGER
);
