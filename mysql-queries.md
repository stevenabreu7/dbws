# Queries for the Database

We need 12 queries in total.

### Aggregate (at least 1)

1) Return the number of users in C3

```
SELECT COUNT(U)
FROM User U, Residence R
WHERE U.rid = R.rid AND R.name = 'C3'
```

2) Return the number of professors participating in at least one event

```
SELECT COUNT(P)
FROM Professor Pr, Participating Pa
WHERE Pr.id = Pa.pid
```

3) Return the minimum age of all professors

```
SELECT MIN(U.age)
FROM Professor P, User U
WHERE P.uid = U.uid
```


### Group By (at least 1)
1) Return the number of users in each user group

```
SELECT COUNT(U)
FROM User U, UserGroup UG
GROUP BY UG.name
```

2) Return the average age for each user group

```
SELECT AVG(U.age)
FROM User U, UserGroup UG
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

### Others
1) Get all users participating in a specific event

```
SELECT U
FROM User U, Participates P
WHERE P.uid = U.uid AND P.eid = 'eventId'
```

2) Get all students living in C3

```
SELECT S
FROM Student S, Residence R, LivesIn L
WHERE S.uid = L.uid AND R.rid = L.rid AND R.name = 'C3'
```

3) Get all users that host at least one event

```
SELECT U
FROM User U, Owns O
WHERE U.uid IN (SELECT )
```

4) Get the names of all users that participate in at least one event

```
SELECT DISTINCT U
FROM User U, Participating P
WHERE U.uid = P.uid
```

5) Get all events taking place in a specific location

```
SELECT Event
FROM Event E, Location L
WHERE E.lid = L.lid AND L.name = 'location'
```

6) Get all events taking place at a specific time
7) Get all events from one, multiple categories
