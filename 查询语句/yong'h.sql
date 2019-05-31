INSERT INTO user_role(user_id,role_id) 
		VALUES (
		select 5,11 from dual 
		where not exists (select 1 from user_role a where a.user_id=5 AND a.role_id=11)),(5,13),(5,14)
		
		
		INSERT INTO user_role(user_id,role_id) 
		VALUES (CASE WHEN NO EXISTS(SELECT * FROM user_role WHERE user_id=5 AND role_id=11) THEN '' ELSE 5,11 END)
		
				INSERT INTO user_role(user_id,role_id) 
		VALUES((SELECT 5,11 from dual  WHERE not exists (select 1 from user_role a where a.user_id=5 AND a.role_id=11)))
		
		
				INSERT INTO user_role(user_id,role_id) 
	(SELECT 18,14 from dual  WHERE not exists (select * from user_role a where a.user_id=18 AND a.role_id=14)),
	(SELECT 5,14 from dual  WHERE not exists (select * from user_role a where a.user_id=5 AND a.role_id=14))
		INSERT INTO user_role(user_id,role_id)  VALUES ()
		
		
		UPDATE `user` SET user_wrong_number=user_wrong_number+1 WHERE user_account="测试添加"
		