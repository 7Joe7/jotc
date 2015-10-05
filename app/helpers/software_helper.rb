module SoftwareHelper

  ASANA_FUNCTIONALITY_USE_CASES = [
      { :title => 'Create New Task',
        :link_name => 'create_new_task',
        :keyboard_shortcut => 'alt+N',
        :description =>
          ['Creates a new task in Asana.',
           'At the start it creates the task without project. If you set up your GTD project it will create it into the "Inbox" project or you may specify other GTD project by writing as a project one of: "Next", "Scheduled", "Someday".',
           'You may also specify a section in that particular project by inserting name of the section as a third parameter.'],
        :keyword => 'asana',
        :input_format => '<task name>:<project(Inbox|Next|Scheduled|Someday)>:<section name>'},
      { :title => 'Delete Task',
        :link_name => 'delete_task',
        :pick_from => 'log',
        :show_from_shortcut => 'alt+`',
        :keyboard_modifier => 'ctrl',
        :description => [
            'Deletes the selected task in local cache and in Asana.'
        ]},
      { :title => 'Put Task In Progress',
        :link_name => 'put_task_in_progress',
        :pick_from => 'log',
        :show_from_shortcut => 'alt+`',
        :description => [
            "Sets task as 'In Progress' locally.",
            "Task has to NOT be 'In Progress' already, otherwise it is put to completed instead. See use case 'Complete Task'",
            'Basically it locally tags the task as working on and counts time while it is being worked on.',
            "With AnyBar support you may see all tasks which are 'In Progress' in the menubar as blue dots."
        ]},
      { :title => 'Complete Task',
        :link_name => 'complete_task',
        :pick_from => 'log',
        :show_from_shortcut => 'alt+`',
        :description => [
            "Sets task which is 'In Progress' to completed.",
            "Logs time for which the task was 'In Progress' into Asana (you may see the logs in task description) and locally into cache. Puts it to completed in Asana.",
            'With AnyBar support blue dot for this task is turned off.'
        ]},
      { :title => 'Pause Task',
        :link_name => 'pause_task',
        :pick_from => 'log',
        :show_from_shortcut => 'alt+`',
        :keyboard_modifier => 'cmd',
        :description => [
            "Sets task which is 'In Progress' to paused (basically state before putting to 'In Progress'). And logs time spent on it.",
            "If the task was not 'In Progress' then it will just show a message about it.",
            'With AnyBar support blue dot for this task is turned off.'
        ]},
      { :title => 'Say All Subtasks in a Given Task',
        :link_name => 'say_all_subtasks_in_a_given_task',
        :pick_from => 'log',
        :show_from_shortcut => 'alt+`',
        :keyboard_modifier => 'fn',
        :description => [
            'Sends command to your Mac to say aloud all subtasks on a specified task.'
        ]},
      { :title => 'Show Logged Work since/on Day',
        :link_name => 'show_logged_work_since_on_day',
        :keyboard_shortcut => 'alt+L',
        :keyword => 'logs',
        :input_format => 'YYYY-MM-DD',
        :description => [
            'Shows logged time on tasks in specified time range, or on a specified day, or since a specified day.'
        ]},
      { :title => 'Say All Tasks with a Given Tag',
        :link_name => 'say_all_tasks_with_a_given_tag',
        :keyword => 'say:asana:tag',
        :input_format => '<tag_name>',
        :description => [
            'Sends command to your Mac to say aloud all tasks with a specified tag.'
        ]},
      { :title => 'Say All Tasks in a Given Project',
        :link_name => 'say_all_tasks_in_a_given_project',
        :keyword => 'say:asana:project',
        :input_format => '<project_name',
        :description => [
            'Sends command to your Mac to say aloud all tasks in a specified project.'
        ]}
  ]

  ASANA_STARTUP_USE_CASES = [
      { :title => 'Synchronise Asana with Local Cache',
        :link_name => 'synchronise_asana_with_local_cache',
        :call_by => 'tell application "Alfred 2" to run trigger "syncAsanaCache" in workflow "com.herokuapp.jotc.asana"',
        :description => [
            "For logging time, keeping track of tasks 'In Progress' the application stores local cache of tasks in the Next project. This use case synchronises this cache with actual data in Asana.",
            "It is strongly recommended to make this use case run automatically along with 'Synchronise All Active' by keeping it active - it is active by default."
        ]},
      { :title => 'Synchronise Asana and Jira',
        :link_name => 'synchronise_asana_and_jira',
        :call_by => 'tell application "Alfred 2" to run trigger "syncAsanaAndJira" in workflow "com.herokuapp.jotc.asana"',
        :description => [
            "Synchronisation of Jira and Asana will try to get all issues assigned to your username by JQL and create tasks into your Next project, or project you have specified in use case 'Set Project and Sections for Jira Tasks', for each of them.",
            'The task names will begin with the issue key. The rest of the names are made of names of the issues and in description will be put link to the issue in Jira.',
            "It uses status of the issue to create it in the right project - if the status is 'To Test', 'Testing in Progress', 'Prereleased' or 'Closed' it will close them in Asana (based on the beginning of name of the tasks), otherwise it will check sprint and create it in scheduled with due on date being the first date of sprint the issue has set, yet otherwise if the status is 'In Progress' or 'Waiting for Feedback' or sprint is the actual sprint then it creates the task in the project specified for it by you in use case 'Set Project and Sections for Jira Tasks'.",
            "It also checks what time is remaining on the task in Jira and puts a tag on the newly created task in Asana based on simple calculation: remaining time in minutes from Jira / Pomodoro time set by use case 'Set Pomodoro Length'.",
            "If it is activated it will run along with 'Synchronise All Active' use case. It is not active by default."
        ]},
      { :title => 'Synchronise Due on Today Tasks',
        :link_name => 'synchronise_due_on_today_tasks',
        :call_by => 'tell application "Alfred 2" to run trigger "syncAsanaDueOnToday" in workflow "com.herokuapp.jotc.asana"',
        :description => [
            "It will take all tasks in Asana which are due on today and put them into Next project or wherever you specify by use case 'Set Sections for Tasks Due on Today'. If the task begins with Jira issue key and you have specified another section for work tasks by use case 'Set Project and Section for Work Tasks Due on Today' and if you have activated Jira synchronisation by use case 'De/Activate Asana and Jira Synchronisation' it will put it there.",
            "If it is activated it will run along with 'Synchronise All Active' use case. It is not active by default."
        ]},
      { :title => 'Refresh Asana Settings',
        :link_name => 'refresh_asana_settings',
        :call_by => 'tell application "Alfred 2" to run trigger "refreshAsanaSettings" in workflow "com.herokuapp.jotc.asana"',
        :description => [
            'Synchronises local config of this workflow with the actual state of Asana.',
            "It is active by default. While it is active it will run along with use case 'Synchronise All Active'."
        ]},
      { :title => 'Synchronise All Active',
        :link_name => 'synchronise_all_active',
        :keyboard_shortcut => 'alt+S',
        :call_by => 'tell application "Alfred 2" to run trigger "syncAsana" in workflow "com.herokuapp.jotc.asana"',
        :description => [
            'Runs all synchronisation which is set to be active.',
            'It is recommended to run it on wake up of the computer for example with help of <a href="http://www.bernhard-baehr.de/">sleepwatcher</a>.'
        ]},
      { :title => 'Wake Up',
        :link_name => 'wake_up',
        :call_by => 'tell application "Alfred 2" to run trigger "wakeUp" in workflow "com.herokuapp.jotc.asana"',
        :description => [
            'Picks randomly from a list of in script specified YouTube urls and opens one.',
            'Usable as an alarm if you set it up in your Calendar (event which starts this through Automator), also relies on automatic startup of computer set up through System Preferences -> Energy Saver -> Schedule'
        ]},
      { :title => 'Start AnyBar ports',
        :link_name => 'start_anybar_ports',
        :call_by => 'tell application "Alfred 2" to run trigger "startAnybarPorts" in workflow "com.herokuapp.jotc.asana"',
        :description => [
            'Starts all AnyBar instances with their proper colour.',
            "Good to start automatically on wake up. For this purpose there is an application (basically an AppleScript packed as an app) 'start_anybar_ports.app' inside this workflow. So if you 'Open workflow folder', by going to your Alfred workflows -> Asana -> open any script -> push 'Open workflow folder' button, you will find there this app and you may add it into your startup apps by going to 'System Preferences' -> 'Users & Groups' -> 'Login Items' -> add the app there and the ports will be renewed after each restart."
        ]},
      { :title => 'Pause All Tasks',
        :link_name => 'pause_all_tasks',
        :keyword => 'pause:asana',
        :call_by => 'tell application "Alfred 2" to run trigger "pauseAllAsana" in workflow "com.herokuapp.jotc.asana"',
        :description => [
            "Pauses all tasks which are 'In Progress' and logs time of work into cache and Asana.",
            'You may find it useful to run this use case automatically when your computer goes to sleep.'
        ]}
  ]

  ASANA_SETUP_USE_CASES = [
      { :title => 'Set Asana Credentials',
        :link_name => 'set_asana_credentials',
        :keyword => 'set:asana:credentials',
        :input_format => '<personal_access_token>:<workspace_name>',
        :description => [
            'Sets Asana credentials for access to your Asana data.',
            "To allow Asana Workflow access to work with your Asana data you need to create a <a href='https://app.asana.com/-/account_api'>personal access token</a>, specifically for it."
        ]},
      { :title => 'Set Asana GTD projects',
        :link_name => 'set_asana_gtd_projects',
        :keyword => 'set:asana:projects',
        :input_format => '<inbox>:<next>:<someday>:<scheduled>',
        :description => [
            'Sets projects each representing one of the GTD basic projects.',
            "Insert names of your existing projects in Asana which in principle represent the given GTD project. Check what GTD is and what those projects mean <a href='https://en.wikipedia.org/wiki/Getting_Things_Done'>here</a>."
        ]},
      { :title => 'De/Activate Asana Cache Synchronisation',
        :link_name => 'de_activate_asana_cache_synchronisation',
        :keyword => 'set:asana:activation:cache_synchronisation',
        :description => [
            'Activates or deactivates local cache synchronisation.',
            "This means that use case 'Synchronise Asana with Local Cache' will run along with overall synchronisation - use case 'Synchronise All Active'."
        ]},
      { :title => 'Set Jira Credentials',
        :link_name => 'set_jira_credentials',
        :keyword => 'set:asana:jira:credentials',
        :input_format => '<username>:<password>:<hostname>',
        :description => [
            'Sets Jira credentials for Jira synchronisation.',
            "See more about what it does in description of use case 'Synchronise Asana and Jira'."
        ]},
      { :title => 'De/Activate Asana and Jira Synchronisation',
        :link_name => 'de_activate_asana_and_jira_synchronisation',
        :keyword => 'set:asana:activation:jira_synchronisation',
        :description => [
            'Activates or deactivates Jira synchronisation.',
            "This means that use case 'Synchronise Asana and Jira' will run along with overall synchronisation - use case 'Synchronise All Active'."
        ]},
      { :title => 'Set Project and Sections for Jira Tasks',
        :link_name => 'set_project_and_sections_for_jira_tasks',
        :keyword => 'set:asana:next:work:section',
        :input_format => '<next_jira_project>:<section_in_next>:<section_in_scheduled>',
        :description => [
            "Set project which will act as Next project regarding Jira issues created by 'Synchronise Asana and Jira' use case and set section in it. Also you may set section in your Scheduled project where due on tasks from 'Synchronise Asana and Jira' use case will be put.",
            "See more information in description of use case 'Synchronise Asana and Jira'"
        ]},
      { :title => 'Set Pomodoro Length',
        :link_name => 'set_pomodoro_length',
        :keyword => 'set:asana:pomodoro_length',
        :input_format => '<pomodoro_length_in_minutes>',
        :description => [
            'Sets length of pomodoro for Jira synchronisation.',
            "See use case 'Synchronise Asana and Jira'."
        ]},
      { :title => 'Set Project and Section for Work Tasks Due on Today',
        :link_name => 'set_project_and_section_for_work_tasks_due_on_today',
        :keyword => 'set:asana:work:today_section',
        :input_format => '<project_name>:<section_name>',
        :description => [
            'Sets section for due on today tasks for tasks beginning with Jira issue key.',
            "If you want to keep personal tasks and work tasks in separate projects set section for due on today tasks in that project and use case 'Synchronise Due on Today Tasks' will put there the tasks due on today which match issue key pattern (it has Jira issue key at the beginning)."
        ]},
      { :title => 'Set Sections for Tasks Due on Today',
        :link_name => 'set_sections_for_tasks_due_on_today',
        :keyword => 'set:asana:today_section_name',
        :input_format => '<project_name>:<section_name>',
        :description => [
            "Sets section where tasks due on today will be put (use case 'Synchronise Due on Today Tasks')"
        ]},
      { :title => 'De/Activate Due on Today Synchronisation',
        :link_name => 'de_activate_due_on_today_synchronisation',
        :keyword => 'set:asana:activation:due_on_today_synchronisation',
        :description => [
            'Activates or deactivates due on today synchronisation.',
            "This means that use case 'Synchronise Due on Today Tasks' will run along with overall synchronisation - use case 'Synchronise All Active'."
        ]},
      { :title => 'De/Activate AnyBar Support',
        :link_name => 'de_activate_anybar_support',
        :keyword => 'set:asana:activation:anybar',
        :description => [
            'Activates or deactivates AnyBar support.',
            "Activates cool features for several use cases where AnyBar is used. It relies on AnyBar.app to be present in /Applications folder. Use modified AnyBar from <a href='https://github.com/7Joe7/AnyBar'>here</a>.",
            "It shows red dots for tasks which are due on today or before today and blue dots for tasks 'In Progress' and it shows yellow dot for running use case 'Synchronise All Active'."
        ]},
      { :title => 'Set Port Range for AnyBar Support',
        :link_name => 'set_port_range_for_anybar_support',
        :keyword => 'set:anybar:port',
        :input_format => '<port lowest>:<port highest>',
        :description => [
            'Sets range of ports which will be used for AnyBar.',
            'Recommendation is to specify at least a hundred long range.'
        ]},
      { :title => 'De/Activate Basic Synchronisation',
        :link_name => 'de_activate_basic_synchronisation',
        :keyword => 'set:asana:activation:basic_synchronisation',
        :description => [
            'Activates or deactivates basic synchronisation.',
            "This means that use case 'Refresh Asana Settings' will run along with overall synchronisation - use case 'Synchronise All Active'."
        ]}
  ]

  def all_use_cases
    ASANA_FUNCTIONALITY_USE_CASES + ASANA_STARTUP_USE_CASES + ASANA_SETUP_USE_CASES
  end
end
