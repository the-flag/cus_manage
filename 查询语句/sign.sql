UPDATE sign SET user_leave_time=NOW() WHERE user_id=3 AND DATE(user_login_time)="2019-05-22" AND user_leave_time IS NULL;


UPDATE sign SET user_leave_time=NOW() WHERE user_id=3 AND DATE(user_login_time)="2019-05-22" AND user_leave_time IS NULL;


SET @var_name =SELECT sign_id FROM sign WHERE user_id=3 AND DATE(user_login_time)==DATA(NOW()) OR user_leave_time IS NULL;

SELECT @var_name
SELECT sign_id FROM sign WHERE user_id=3 AND user_login_time>user_leave_time OR user_leave_time IS NULL



SELECT DATE(user_login_time) FROM sign WHERE user_leave_time IS NULL
set @time=NOW();
SELECT DATA(@time)

