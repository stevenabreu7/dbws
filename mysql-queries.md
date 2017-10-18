# Queries for the Database

We need 12 queries in total.

### Aggregate (at least 1)

1) Return the number of users in C3

```
SELECT COUNT(U)
FROM User U, Residence R
WHERE U.rid = R.rid AND R.name = 'C3'
```

2) Return the number of notifications for a user

```
SELECT COUNT(M)
FROM User U, Notification N
WHERE U.uid = N.uid
```

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
