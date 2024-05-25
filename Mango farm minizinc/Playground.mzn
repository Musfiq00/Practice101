include "alldifferent.mzn";
% Inputs
int: Num_Workers; % Number of workers
int: Num_Tasks; % Number of tasks
int: Num_Slots; % Number of time slots
% Tasks are: 1 = Picking, 2 = Washing Mangoes, 3 = Packin, 4 = Delivering
array[1..Num_Workers, 1..Num_Slots] of var 1..Num_Tasks: task;
constraint
forall(w in 1..Num_Workers)(
alldifferent([task[w, p] | p in 1..Num_Slots]));
% One worker at each time period
constraint
forall(p in 1..Num_Slots)(
alldifferent([task[w, p] | w in 1..Num_Workers])
);
solve satisfy;
output[
if Num_Slots > 1 then "Time Slots>\t| " ++ concat([show(w) ++ "\t| " | w in 1..Num_Slots]) ++
"\n"
else "Worker\t| " ++ concat([show(w) ++ "\t| " | w in 1..Num_Slots]) ++ "\n"
endif,
""
] ++
[
show(w) ++ "\t| " ++
concat([if fix(task[w, p]) == 1 then "Picking" elseif fix(task[w, p]) == 2 then "Washing" elseif
fix(task[w, p]) == 3 then "Packing" else "Delivering" endif ++ "\t| " | p in 1..Num_Slots]) ++ "\n"
| w in 1..Num_Workers
];