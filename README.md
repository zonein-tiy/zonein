## API Documentation for ZONE-IN

https://thawing-mountain-6062.herokuapp.com/  

[ACCESS METHODS](#access-methods)


* [Sign Up](#sign-up)
* [Sign In](#sign-in)


[CREATION METHODS](#creation-methods)


* [Create an Athlete](#create-an-athlete)
* [Create a Workout](#create-a-workout)
* [Create a Plan](#create-a-plan)


[UPDATE METHODS](#update-methods)


* [Add Workouts to a Plan](#add-workouts-to-a-plan)
* [Mark a Workout as completed and display workout metrics](#mark-a-workout-as-completed-and-display-workout-metrics)
* [Mark a Plan as completed](#mark-a-plan-as-completed)


[SEARCH METHODS](#search-methods)


* [Retrieve all Workouts](#retrieve-all-workouts)
* [Retrieve all Workouts created by signed in Athlete](#retrieve-all-workouts-created-by_signed-in-athlete)
* [Retrieve all Plans](#retrieve-all-plans)
* [Retrieve all Plans created by signed in Athlete](#retrieve-all-plans-created-by-signed-in-athlete)
* [Retrieve all Workouts that are in Plans adopted by the signed in Athlete](#retrieve-all-workouts-that-are-in-plans-adopted-by-the-signed-in-athlete)


[DELETE METHODS](#delete-methods)


* [Delete an Athlete](#delete-an-athlete)
* [Delete a Plan](#delete-a-plan)

#### ACCESS METHODS:

###### Sign Up:

```POST /athletes/signup```

Parameters:

* username(required)

* email (required)

* password(required - must be at least 8 characters)

Result:

```{"username":"jdoe","email":"jdoe@abc.com","password":"5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8","access_token":"xxxxx11111"}```

###### Sign In:

```POST /athletes/signin```

Parameters:


* email (required)


* password (required)

Result:
```
{
  "username": "jdoe",
  "email": "jdoe@abc.com",
  "password": "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8",
  "access_token": "xxxxx11111",
  "first_name": null,
  "last_name": null,
  "phone_number": null,
  "home_address": null,
  "city": null,
  "state": null,
  "zip": null,
  "interests": null,
  "image_url": null
}
```
#### CREATION METHODS:

###### Create an Athlete:

PATCH ```/athletes/register```

Parameters:


* first_name
* last_name
* phone_number
* home_address
* city
* state
* zip
* interests
* image_url

Result:

```
{"username":"jdoe","email":"jdoe@abc.com","password":"5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8","access_token":"xxxxx11111","first_name":"Jane","last_name":"Doe","phone_number":"4047706780","home_address":"1 Peachtree Street","city":null,"state":null,"zip":30303,"interests":"rugby, soccer","image_url":"http://i379.photobucket.com/albums/oo239/SyrjisEWR/Others/Randoms/Own%20Cuts/Girl383.jpg"}
```

###### Create a Workout:

POST ```/workouts```

Parameters:


* name
* steps
* description
* time (in minutes)
* image_url
* video_url
* running
* weightlifting
* swimming
* circuit_training
* cycling

###### Create a Plan:

POST ```/plans```

Parameters:


* name
* description
* creator_id
* plan_creator
* plan_id
* start_date
* end_date

#### UPDATE METHODS

###### Add Workouts to a Plan:

POST ```plans/workouts```

Parameters:


* plan_id
* workout_id
* do_date

###### Mark a Workout as completed and display workout metrics:

PATCH ```/plans/workout_completion```

Parameters:


* athlete_workout_id
* workout_completion (must be sent as 'true')

###### Mark a Plan as completed:

PATCH ```/plans/completion```

Parameters:


* plan_id
* completion: (must be sent as 'true')

#### SEARCH METHODS:

###### Retrieve all Workouts:

GET ```/workouts```

###### Retrieve all Workouts created by signed in Athlete:

GET ```/workouts/athlete```

###### Retrieve all Plans:

GET ```/plans```

###### Retrieve all Plans created by signed in Athlete:

GET ```plans/creator```

###### Retrieve all Workouts that are in Plans adopted by the signed in Athlete:

GET ```/plans/adopted```

#### DELETE METHODS:

###### Delete an Athlete:

DELETE ```/athletes/:id```

*:id is the athlete_id*

###### Delete a Plan:

DELETE ```/plans/:id```

*:id is the plan_id*