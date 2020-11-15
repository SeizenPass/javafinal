# APIs
### user-resource
* **[GET]** users/{id} - getUserById
* **[GET]** users/getAll - getAllUsers
* **[POST]** users/ - addUser
* **[GET]** users/{id}/getClubs - getUserClubs
* **[DELETE]** users/{id} - deleteUser
* **[GET]** users/club/{id} - getUsersByClubId

### club-resource
* **[GET]** clubs/{id} - getClubById
* **[DELETE]** clubs/{id} - deleteClub
* **[POST]** clubs/ - addClub
* **[GET]** clubs/getAll - getAllClubs
* **[PUT]** clubs/ - updateClub
* **[POST]** clubs/{id}/subscription/{userid} - addSubscriberToClub
* **[DELETE]** clubs/{id}/subscription/{userid} - deleteSubscriber
* **[PUT]** clubs/{id}/subscription/{userid} - changePrivilege

### news-resource
* **[GET]** news/{id} - getClubNewById
* **[DELETE]** news/{id} - deleteNew
* **[POST]** news/ - addNew
* **[GET]** news/getAll - getAllNews
* **[PUT]** news/{id} - updateNewById
* **[GET]** news/club/{id} - getClubNewsByClubId

### event-resource
* **[GET]** events/{id} - getClubEventById
* **[DELETE]** events/{id} - deleteEvent
* **[POST]** events/ - addEvent
* **[GET]** events/getAll - getAllEvents
* **[PUT]** events/{id} - updateEventById
* **[GET]** events/club/{id} - getClubEventsByClubId

### auth-resource
* **[POST]** auth/ - login
* **[GET]** auth/logout - logout