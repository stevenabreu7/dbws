-- don't do foreign key checks
SET FOREIGN_KEY_CHECKS = 0;
-- Residence
drop table if exists Residence;
-- Users
drop table if exists User;
drop table if exists Admin;
drop table if exists Student;
drop table if exists Staff;
drop table if exists Professor;
-- Invites
drop table if exists Invite;
drop table if exists EventInvite;
drop table if exists UserGroupInvite;
-- Groups
drop table if exists UserGroup;
drop table if exists UserGroupMembership;
drop table if exists UserGroupOwner;
-- Notifications
drop table if exists Notification;
drop table if exists RequestNotification;
drop table if exists InviteNotification;
-- Organizers
drop table if exists Organizer;
-- Events
drop table if exists Event;
drop table if exists RecurringEvent;
drop table if exists OneTimeEvent;
drop table if exists Category;
drop table if exists Location;
drop table if exists EventDate;
-- Reset foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
