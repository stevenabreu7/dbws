# Queries for the Database

We need 12 queries in total.

### Aggregate (at least 1)

1) Return the number of users in C3

```
SELECT COUNT(U)
FROM User U, Residence R
WHERE U.rid = R.rid AND R.name = 'C3'
```

2) Return the number of events of today

```
SELECT COUNT(E)
FROM Event E, OneTimeEvent OTE, RecurringSingle RS
WHERE RS.day = CURDATE() OR OTE.day = CURDATE()
```

### Group By (at least 1)
1) Return the number of users in each user group

```
SELECT COUNT(U)
FROM User U, UserGroup UG, UserGroupMembership UGM
WHERE U.uid = UGM.uid AND UGM.gid = UG.gid
GROUP BY UG.name
```

3) Return the number of events in each category

```
SELECT COUNT(E.eid)
FROM Event E, Category C
WHERE E.eid = C.eid
GROUP BY C.name
```

4.) Return the number of students living in each residence

```
SELECT COUNT(S.sid)
FROM Student S, Residence R
WHERE S.rid = R.rid 
GROUP BY R.name
```

### Join (at least 4)
1) Get a table of all students and their residences

```
SELECT *
FROM Student S, Residence R
WHERE S.rid = R.rid
```

2) Get a table of all users and the events names they're participating in

```
SELECT U.name, E.name
FROM User U, Event E, SingularAttendance SA, RecurringAttendance RA
WHERE (U.uid = SA.uid AND SA.eid = E.eid) OR (U.uid = RA.uid AND RA.eid = E.eid) 
```

3) Get a table of all users and the events names they're hosting in

```
SELECT U.name, E.name
FROM User U, Event E, Organizer O
WHERE U.uid = O.uid AND O.eid = E.eid
```
4) Get a table of all user groups and their member names

```
SELECT UG.name, UG.uid
FROM User U, UserGroup UG, UserGroupMembership UGM
WHERE U.uid = UGM.uid AND UGM.gid = UG.gid
```
5) Get a table of all recurring events and their dates

```
SELECT E.name, RS.day
FROM Event E, RecurringSingle RS, RecurringEvent RE
WHERE E.eid = RE.eid AND RS.recid = RE.recid
```
### Others
1) Get all users participating in a specific singular event

```
SELECT U
FROM User U, SingularAttendance SA
WHERE SA.uid = U.uid AND SA.eid = 'eventId'
```

2) Get all students living in C3

```
SELECT S
FROM Student S, Residence R, LivesIn L
WHERE S.uid = L.uid AND R.rid = L.rid AND R.name = 'C3'
```

3) Get all users that host at least one event

```
SELECT DISTINCT U
FROM User U, Organizer O
WHERE U.uid IN (SELECT O.uid FROM Organizer O)
```

4) Get the names of all users that participate in at least one event

```
SELECT DISTINCT U
FROM User U, SingularAttendance SA, RecurringAttendance RA
WHERE U.uid = SA.uid OR U.uid = RA.uid
```

5) Get all events taking place in a specific location

```
SELECT Event
FROM Event E, Location L
WHERE E.lid = L.lid AND L.name = 'location'
```

6) Get all events taking place at a specific time
7) Get all events from one, multiple categories
