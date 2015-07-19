## API Documentation for ZONE-IN

https://thawing-mountain-6062.herokuapp.com/

[Sign Up](#sign-up)
[Create an Athlete](#create-an-athlete)
[Retrieve all Workouts created by signed in Athlete](#retrieve-all-workouts-created-by-signed-in-athlete)
[Delete a Plan](#delete-a-plan)

#### INITIAL ACCESS:

###### To Sign Up:

```POST /athletes/signup```

Parameters:

 
* username (required)


* email (required)

###### To Sign In:

```POST /athletes/signin```

Parameters:


* email (required)


* password (required)

#### CREATION METHODS:

###### Create an Athlete:

POST ```/athletes```

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

###### To Create a Workout:

POST ```/workouts```

Parameters:


* name
* steps
* description
* time
* image_url
* video_url
* running
* weightlifting
* swimming
* circuit_training
* cycling

###### To Create a Plan:

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

###### To Add Workouts to a Plan:

POST ```plans/workouts```

Parameters:


* plan_id
* workout_id
* do_date

###### To Mark a Workout as completed:

PATCH ```/plans/workout_completion```

Parameters:


* athlete_workout_id
* workout_completion (must be sent as 'true')

###### To Mark a Plan as completed:

PATCH ```/plans/completion```

Parameters:


* plan_id
* completion: (must be sent as 'true')

#### SEARCH METHODS:

###### To Retrieve all Workouts:

GET ```/workouts```

###### Retrieve all Workouts created by signed in Athlete:

GET ```/workouts/athlete```

###### Retrieve all Plans:

GET ```/plans```

###### To Retrieve all Plans created by signed-in Athlete:

GET ```plans/creator```

###### To Retrieve all Workouts that are in Plans adopted by the signed-in Athlete:

GET ```/plans/adopted```

#### DELETE METHODS:

###### To Delete an Athlete:

DELETE ```/athletes/:id```

*:id is the athlete_id*

###### Delete a Plan:

DELETE ```/plans/:id```

*:id is the plan_id*