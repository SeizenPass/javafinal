# APIs
### user-resource
* **[GET]** users/{id} - getUserById
* **[GET]** users/getAll - getAllUsers
* **[POST]** users/ - addUser
* **[GET]** users/{id}/getClubs - getUserClubs
* **[DELETE]** users/{id} - deleteUser
* **[GET]** users/club/{id} - getUsersByClubId
* **[GET]** users/find - findUsers

### club-resource
* **[GET]** clubs/{id} - getClubById
* **[DELETE]** clubs/{id} - deleteClub
* **[POST]** clubs/ - addClub
* **[GET]** clubs/getAll - getAllClubs
* **[PUT]** clubs/ - updateClub
* **[POST]** clubs/{id}/subscription/{userid}/{privid} - addSubscriberToClub
* **[DELETE]** clubs/{id}/subscription/{userid} - deleteSubscriber
* **[PUT]** clubs/{id}/subscription/{userid}/{privid} - changePrivilege

### news-resource
* **[GET]** news/{id} - getNewsById
* **[DELETE]** news/{id} - deleteNews
* **[POST]** news/ - addNews
* **[GET]** news/getAll - getAllNews
* **[PUT]** news/ - updateNews
* **[GET]** news/club/{id} - getClubNewsByClubId

### event-resource
* **[GET]** events/{id} - getClubEventById
* **[DELETE]** events/{id} - deleteEvent
* **[POST]** events/ - addEvent
* **[GET]** events/getAll - getAllEvents
* **[PUT]** events/ - updateEvent
* **[GET]** events/club/{id} - getClubEventsByClubId

### auth-resource
* **[POST]** auth/ - login
* **[GET]** auth/logout - logout

### dictionary-resource
* **[GET]** dictionary/content/getAll - getAllContentPrivileges
* **[GET]** dictionary/content/{id} - getContentPrivilegeById
* **[GET]** dictionary/user/getAll - getAllUserPrivileges
* **[GET]** dictionary/user/{id} - getUserPrivilegeById

### group-resource
* **[GET]** groups/ - getAllGroups
* **[GET]** groups/{id} - getGroupById

### major-resource
* **[GET]** majors/ - getAllMajors
* **[GET]** majors/{id} - getMajorById