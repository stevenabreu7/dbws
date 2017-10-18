# Queries for the Database

We need 12 queries in total.

### Aggregate (at least 1)

1) Return the number of users in C3

```
SELECT COUNT(U.uid)
FROM User U, Residence R
WHERE U.rid = R.rid AND R.name = 'C3'


MariaDB [dbws]> SELECT COUNT(U.uid)
    -> FROM User U, Residence R
    -> WHERE U.rid = R.rid AND R.name = 'C3';
+--------------+
| COUNT(U.uid) |
+--------------+
|            1 |
+--------------+
1 row in set (0.00 sec)

```


2) Return the number of events of today

```
SELECT COUNT(E.eid)
FROM Event E, OneTimeEvent OTE, RecurringSingle RS
WHERE RS.day = CURDATE() OR OTE.day = CURDATE()

MariaDB [dbws]> SELECT COUNT(E.eid) FROM Event E, OneTimeEvent OTE, RecurringSingle RS WHERE RS.day = CURDATE() OR OTE.day = CURDATE();
+--------------+
| COUNT(E.eid) |
+--------------+
|            0 |
+--------------+
1 row in set (0.00 sec)
```

### Group By (at least 1)
1) Return the number of users in each user group

```
SELECT UG.name, COUNT(U.uid)
FROM User U, UserGroup UG, UserGroupMembership UGM
WHERE U.uid = UGM.uid AND UGM.gid = UG.gid
GROUP BY UG.name

MariaDB [dbws]> SELECT UG.name, COUNT(U.uid)
    -> FROM User U, UserGroup UG, UserGroupMembership UGM
    -> WHERE U.uid = UGM.uid AND UGM.gid = UG.gid
    -> GROUP BY UG.name
    -> ;
+---------+--------------+
| name    | COUNT(U.uid) |
+---------+--------------+
| CS 2019 |            1 |
| FY 2017 |            1 |
+---------+--------------+
2 rows in set (0.00 sec)

```

3) Return the number of events in each category

```
SELECT C.name, COUNT(E.eid)
FROM Event E, Category C
WHERE E.catid = C.catid
GROUP BY C.name

MariaDB [dbws]> SELECT C.name, COUNT(E.eid)
    -> FROM Event E, Category C
    -> WHERE E.catid = C.catid
    -> GROUP BY C.name;
+-------------+--------------+
| name        | COUNT(E.eid) |
+-------------+--------------+
| Party       |            1 |
| Study Group |            1 |
+-------------+--------------+
2 rows in set (0.00 sec)
```

4.) Return the number of students living in each residence

```
SELECT R.name, COUNT(U.uid)
FROM User U, Residence R
WHERE U.rid = R.rid 
GROUP BY R.name

MariaDB [dbws]> SELECT R.name, COUNT(U.uid)
    -> FROM User U, Residence R
    -> WHERE U.rid = R.rid 
    -> GROUP BY R.name;
+-------+--------------+
| name  | COUNT(U.uid) |
+-------+--------------+
| C3    |            1 |
| Krupp |            1 |
+-------+--------------+
2 rows in set (0.00 sec)

```

### Join (at least 4)
1) Get a table of all students and their residences

```
SELECT *
FROM User U, Residence R
WHERE U.rid = R.rid

MariaDB [dbws]> SELECT *
    -> FROM User U, Residence R
    -> WHERE U.rid = R.rid;
+-----+-----------+-------------+---------------+-----------+------------+------+-----+-------+
| uid | firstname | lastname    | email         | activated | joined     | rid  | rid | name  |
+-----+-----------+-------------+---------------+-----------+------------+------+-----+-------+
|   1 | Freshie   | McFreshface | f.mcfreshface |         1 | 2016-09-01 |    1 |   1 | Krupp |
|   2 | Oldie     | McOldface   | o.mcoldface   |         1 | 2015-09-01 |    2 |   2 | C3    |
+-----+-----------+-------------+---------------+-----------+------------+------+-----+-------+
2 rows in set (0.00 sec)

```

2) Get a table of all users and the events names they're participating in

```
SELECT U.firstname, U.lastname, E.name
FROM User U, Event E, SingularAttendance SA, RecurringAttendance RA, RecurringEvent RE, RecurringSingle RS
WHERE (U.uid = SA.uid AND SA.eid = E.eid) OR (U.uid = RA.uid AND RA.rsid = RS.rsid AND RS.recid = RE.recid AND RE.eid = E.eid) 


MariaDB [dbws]> SELECT U.firstname, U.lastname, E.name
    -> FROM User U, Event E, SingularAttendance SA, RecurringAttendance RA, RecurringEvent RE, RecurringSingle RS
    -> WHERE (U.uid = SA.uid AND SA.eid = E.eid) OR (U.uid = RA.uid AND RA.rsid = RS.rsid AND RS.recid = RE.recid AND RE.eid = E.eid);
+-----------+-----------+---------------+
| firstname | lastname  | name          |
+-----------+-----------+---------------+
| Oldie     | McOldface | Midterm F2017 |
| Oldie     | McOldface | Midterm F2017 |
+-----------+-----------+---------------+
2 rows in set (0.00 sec)

```

3) Get a table of all users and the events names they're hosting in

```
SELECT U.firstname, U.lastname, E.name
FROM User U, Event E, Organizer O
WHERE U.uid = O.uid AND O.eid = E.eid

MariaDB [dbws]> SELECT U.firstname, U.lastname, E.name
    -> FROM User U, Event E, Organizer O
    -> WHERE U.uid = O.uid AND O.eid = E.eid;
Empty set (0.00 sec)
```
4) Get a table of all user groups and their member names

```
SELECT UG.name, UG.name
FROM User U, UserGroup UG, UserGroupMembership UGM
WHERE U.uid = UGM.uid AND UGM.gid = UG.gid

MariaDB [dbws]> SELECT UG.name, UG.name
    -> FROM User U, UserGroup UG, UserGroupMembership UGM
    -> WHERE U.uid = UGM.uid AND UGM.gid = UG.gid;
+---------+---------+
| name    | name    |
+---------+---------+
| FY 2017 | FY 2017 |
| CS 2019 | CS 2019 |
+---------+---------+
2 rows in set (0.00 sec)

```
5) Get a table of all recurring events and their dates

```
SELECT E.name, RS.day
FROM Event E, RecurringSingle RS, RecurringEvent RE
WHERE E.eid = RE.eid AND RS.recid = RE.recid

MariaDB [dbws]> SELECT E.name, RS.day
    -> FROM Event E, RecurringSingle RS, RecurringEvent RE
    -> WHERE E.eid = RE.eid AND RS.recid = RE.recid;
+---------------+------------+
| name          | day        |
+---------------+------------+
| Midterm F2017 | 2017-10-20 |
| Midterm F2017 | 2017-10-21 |
+---------------+------------+
2 rows in set (0.00 sec)

```
### Others
1) Get all users participating in a specific singular event

```
SELECT U.*
FROM User U, SingularAttendance SA
WHERE SA.uid = U.uid AND SA.eid = 'eventId'


MariaDB [dbws]> SELECT U.*
    -> FROM User U, SingularAttendance SA
    -> WHERE SA.uid = U.uid AND SA.eid = '3'
    -> ;
+-----+-----------+-----------+-------------+-----------+------------+------+
| uid | firstname | lastname  | email       | activated | joined     | rid  |
+-----+-----------+-----------+-------------+-----------+------------+------+
|   2 | Oldie     | McOldface | o.mcoldface |         1 | 2015-09-01 |    2 |
+-----+-----------+-----------+-------------+-----------+------------+------+
1 row in set (0.00 sec)

```

2) Get all students living in C3

```
SELECT U.*
FROM User U, Residence R
WHERE U.rid = R.rid AND R.name = 'C3'

MariaDB [dbws]> SELECT U.*
    -> FROM User U, Residence R
    -> WHERE U.rid = R.rid AND R.name = 'C3';
+-----+-----------+-----------+-------------+-----------+------------+------+
| uid | firstname | lastname  | email       | activated | joined     | rid  |
+-----+-----------+-----------+-------------+-----------+------------+------+
|   2 | Oldie     | McOldface | o.mcoldface |         1 | 2015-09-01 |    2 |
+-----+-----------+-----------+-------------+-----------+------------+------+
1 row in set (0.00 sec)

```

3) Get all users that host at least one event

```
SELECT DISTINCT U.*
FROM User U, Organizer O

MariaDB [dbws]> SELECT DISTINCT U.*
    -> FROM User U, Organizer O
    -> WHERE U.uid IN (SELECT O.uid FROM Organizer O);
Empty set (0.00 sec)
WHERE U.uid IN (SELECT O.uid FROM Organizer O)
```

4) Get the names of all users that participate in at least one event

```
SELECT DISTINCT U.*
FROM User U, SingularAttendance SA, RecurringAttendance RA
WHERE U.uid = SA.uid OR U.uid = RA.uid

MariaDB [dbws]> SELECT DISTINCT U.*
    -> FROM User U, SingularAttendance SA, RecurringAttendance RA
    -> WHERE U.uid = SA.uid OR U.uid = RA.uid;
+-----+-----------+-----------+-------------+-----------+------------+------+
| uid | firstname | lastname  | email       | activated | joined     | rid  |
+-----+-----------+-----------+-------------+-----------+------------+------+
|   2 | Oldie     | McOldface | o.mcoldface |         1 | 2015-09-01 |    2 |
+-----+-----------+-----------+-------------+-----------+------------+------+
1 row in set (0.00 sec)

```

5) Get all events taking place in a specific location

```
SELECT E.*
FROM Event E, Location L
WHERE E.locid = L.locid AND L.name = 'location'

MariaDB [dbws]> SELECT E.*
    -> FROM Event E, Location L
    -> WHERE E.locid = L.locid AND L.name = 'The Other Side';
+-----+---------------+--------+------+-------+-------+------+
| eid | name          | public | gid  | locid | catid | max  |
+-----+---------------+--------+------+-------+-------+------+
|   3 | Midterm F2017 |      1 |    1 |     1 |     2 |  300 |
|   4 | Diwali 2017   |      1 |    1 |     1 |     1 |  300 |
+-----+---------------+--------+------+-------+-------+------+
2 rows in set (0.00 sec)

```
