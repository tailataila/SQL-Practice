-- 1. Find all OPEN tasks owned by 'PETR S'. Show task id,  and status
-- 2. All from 1. + Display all description per task (SD_LIVE.TMS_PROBLEM_FULL_TEXT)
-- 3. 2 + display all actions per task (SD_LIVE.TMS_ACTION_V, SD_LIVE.TMS_ACTION_FULL_TEXT_V)
-- 4. Find all tasks that ever was assigned to PETR S at certain moment

SELECT *
FROM SD_LIVE.TMS_PROBLEM_V
WHERE owner = 'PETR S' AND status12 NOT LIKE 'C%';
     
SELECT *
FROM SD_LIVE.TMS_PROBLEM_FULL_TEXT;
     
SELECT *
FROM SD_LIVE.TMS_ACTION_V;

SELECT *
FROM SD_LIVE.TMS_ACTION_FULL_TEXT_V;

               --aa_id
               --task_aa_id
               -- problemfulltext

               -- SD_LIVE.TMS_ACTION_V
               -- pr_ac
               -- aa_id
               -- assignedto

               -- SD_LIVE.TMS_ACTION_FULL_TEXT_V
               -- action_aa_id
               -- actionfulltext

-- Task 1 Find all OPEN tasks owned by 'PETR S'. Show task id,  and status
SELECT Concat(Concat(client, '-'), id) AS task_id, status12
FROM SD_LIVE.TMS_PROBLEM_V                
WHERE owner = 'PETR S' AND status12 NOT LIKE 'C%';

-- Task 2
SELECT Concat(Concat(client, '-'), id) AS task_id, status12, SD_LIVE.TMS_PROBLEM_FULL_TEXT.problemfulltext
FROM SD_LIVE.TMS_PROBLEM_V
JOIN SD_LIVE.TMS_PROBLEM_FULL_TEXT
ON SD_LIVE.TMS_PROBLEM_V.aa_id = SD_LIVE.TMS_PROBLEM_FULL_TEXT.task_aa_id
WHERE owner = 'PETR S' AND status12 NOT LIKE 'C%';

-- Task 3
SELECT Concat(Concat(client, '-'), id) AS task_id, status12, SD_LIVE.TMS_PROBLEM_FULL_TEXT.problemfulltext, SD_LIVE.TMS_ACTION_FULL_TEXT_V.actionfulltext
FROM SD_LIVE.TMS_PROBLEM_V
JOIN SD_LIVE.TMS_PROBLEM_FULL_TEXT
ON SD_LIVE.TMS_PROBLEM_V.aa_id = SD_LIVE.TMS_PROBLEM_FULL_TEXT.task_aa_id
JOIN SD_LIVE.TMS_ACTION_V
ON SD_LIVE.TMS_PROBLEM_V.aa_id = SD_LIVE.TMS_ACTION_V.pr_ac
JOIN SD_LIVE.TMS_ACTION_FULL_TEXT_V
ON SD_LIVE.TMS_ACTION_V.aa_id = SD_LIVE.TMS_ACTION_FULL_TEXT_V.action_aa_id
WHERE owner = 'PETR S' AND status12 NOT LIKE 'C%';

-- Task 4
SELECT Concat(Concat(client, '-'), id) AS task_id, SD_LIVE.TMS_ACTION_V.assignedto
FROM SD_LIVE.TMS_PROBLEM_V
JOIN SD_LIVE.TMS_ACTION_V
ON SD_LIVE.TMS_PROBLEM_V.aa_id = SD_LIVE.TMS_ACTION_V.pr_ac
WHERE SD_LIVE.TMS_ACTION_V.assignedto = 'PETR S'
ORDER BY task_id;
