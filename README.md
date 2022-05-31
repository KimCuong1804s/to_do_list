### How to run app

3 main screens that display list task to do:  All task, Incomplete, Completed.

Press "+" floating button to add new task into local stored.

Press checkBox at each task for changing state.

Swipe left list view item, "edit" and "delete" buttons will appear.

You can update task content when edit.

List task data will be saved as a json file that named "listTask.json".

### How to run test

There are 4 test files:

- task_action_test: 2 test cases for updating task and deleting task.

- task_page_test: 3 test cases will show 3 types of state from TaskPage Widget, depend on filter input.

- task_validator_test: check content validator when update a task.

- update_task_page: 5 test cases for 2 type of UpdateTaskPage Widget (add new / update). Depend on passedContent input, the UI will change. 

