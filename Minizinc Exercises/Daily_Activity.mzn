include "alldifferent.mzn";

% Input parameters
int: num_days;   % Number of days in a week, provided by the user
int: num_hours = 24; % Number of hours in a day

% Activities
enum Activity = {Sleeping, Exercising, Eating, Working, Practicing, Entertainment};

% Variables: activity[d, h] represents the activity of the worker on day d at hour h
array[1..num_days, 1..num_hours] of var Activity: activity;

% Constraints

% Worker sleeps for 8 hours
constraint
  forall(d in 1..num_days)(
    sum([activity[d, h] == Sleeping | h in 1..num_hours]) == 8
  );

% Worker exercises for 2 hours
constraint
  forall(d in 1..num_days)(
    sum([activity[d, h] == Exercising | h in 1..num_hours]) == 2
  );

% Worker eats for 1 hour
constraint
  forall(d in 1..num_days)(
    sum([activity[d, h] == Eating | h in 1..num_hours]) == 1
  );

% Worker works for 8 hours
constraint
  forall(d in 1..num_days)(
    sum([activity[d, h] == Working | h in 1..num_hours]) == 8
  );

% Worker practices work for 1 hour
constraint
  forall(d in 1..num_days)(
    sum([activity[d, h] == Practicing | h in 1..num_hours]) == 1
  );

% Worker watches movies/entertainment for 4 hours
constraint
  forall(d in 1..num_days)(
    sum([activity[d, h] == Entertainment | h in 1..num_hours]) == 4
  );

% Solve
solve satisfy;

% Output
output [
    "Worker's Weekly Schedule:\n",
    "----------------------------\n",
    "Day\t| Hour\t| Activity\n",
    "----------------------------\n"
] ++
[
    show(d) ++ "\t| " ++ show(h) ++ "\t| " ++
    (if fix(activity[d, h]) == Sleeping then "Sleeping"
     elseif fix(activity[d, h]) == Exercising then "Exercising"
     elseif fix(activity[d, h]) == Eating then "Eating"
     elseif fix(activity[d, h]) == Working then "Working"
     elseif fix(activity[d, h]) == Practicing then "Practicing"
     else "Entertainment"
     endif) ++ "\n"
    | d in 1..num_days, h in 1..num_hours
];
