# Primary Documentation

### Basic Functionality

* Scheduling application, used to schedule meetings and events on campus
* Users can create new meetings and events, or join existing ones
* Public and Private events

### User Interaction

User input will be checked on backend and frontend

* Login & signup
  * Create user accounts using a @jacobs-university.de e-mail address.
  * Logging into an existing account
* User Dashboard \(List of upcoming events\)
  * View upcoming events
  * View event invites
  * Filter upcoming events by categories, participants, tag, venue, etc
  * Sort upcoming events in ascending, descending order \(alphabetical, date, etc\)
  * View past events \(archive\)
* Event Dashboard \(Details for one specific event\)
  * View details of an event \(participant number, venue, host, participants, etc\)
  * Join / decline an event
* Creating a new event
  * Input all information that describes a future event
  * Exclusive events invite filtering _\(maybe only to a certain group of people - only C3, only CS majors, etc\)_
* Managing hosted events
  * View details of an event hosted by this user
  * Change informations of this event
  * Check who signed up _\(maybe admit or reject participants\)_
* Account Management
  * View and change account details \(password, username, _maybe image_, etc\)
  * Delete account \(and thus deactivate all hosted events of this user\)
* Group Management
  * View all groups this user belongs to
  * Create a new group that this user can administrate
  * The administrator of a group can invite, remove, accept and reject users to/from that group

### Stored Information

We will retrieve data by user input ie. registering, creating events and joining events

* User Account
  * Name, E-Mail, username, password
  * Each user creates their own account with their information
* Groups
  * Name, Users in this group
  * Some of them are fixed \(colleges, majors, years, faculty, etc\) - probably owned by "Jacobs University" or "Admin"
* Events
  * Name, time, venue, description, categories, etc
  * Created and managed entirely by users

