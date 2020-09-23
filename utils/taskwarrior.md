1. 创建子项目: 
   ~~~
   使用 task add something project:someProject.subProject 就可以创建一个属于 someProject.subProject 项目的任务(主项目与子项目使用.分割).
   ~~~
1. pri:H 或者priority:H, 高优先级(H,L,M)
1. due:eod, end of day.
1. task list, 输出所有未完成的任务, 不truncate.
1. task projects, 列出所有的项目
1. task edit taskId, 用编辑器编辑项目
1. task 2 start
1. task 2 delete
1. task 2 mod dep:3-5 #任务2依赖于3,4,5
1. task 2 info 


统计功能:

1. task timesheet
1. task calendar
1. task history  # 统计历史，数字表格显示
1. task ghistory # 竖着的统计图
1. task burndown
1. task burndown.daily
1. 