#查询咨询师最近六个月的成交量
SELECT DATE_FORMAT(customer_jiaotime,'%y-%m') as '月份' ,COUNT(1) as '数量' FROM customer WHERE user_id=3  GROUP BY DATE_FORMAT(customer_jiaotime,'%y-%m') ORDER BY customer_jiaotime DESC LIMIT 0,6



SELECT * FROM customer c INNER JOIN `user` u ON c.user_id = u.user_id INNER JOIN user_role ur ON u.user_id = ur.user_id WHERE ur.role_id=3 

#咨询经理查询所有咨询的成交量
SELECT DATE_FORMAT(c.customer_jiaotime,'%y-%m') as 'yuefen' ,COUNT(1) as 'count' FROM customer c INNER JOIN `user` u ON c.user_id = u.user_id INNER JOIN user_role ur ON u.user_id = ur.user_id WHERE ur.role_id=3 GROUP BY DATE_FORMAT(c.customer_jiaotime,'%y-%m') ORDER BY customer_jiaotime DESC LIMIT 0,6

#客户人数
SELECT COUNT(c.customer_id ) FROM customer c INNER JOIN `user` u ON c.user_id = u.user_id INNER JOIN user_role ur ON u.user_id = ur.user_id WHERE ur.role_id=3	

SELECT COUNT(u.user_id) FROM `user` u  INNER JOIN user_role ur ON u.user_id = ur.user_id WHERE ur.role_id=3 
	
	SELECT COUNT(c.customer_id ) 
   	FROM customer c INNER JOIN `user` u ON c.user_id = u.user_id INNER JOIN user_role ur ON u.user_id = ur.user_id 
   	WHERE ur.role_id=3
	SELECT DATE_FORMAT("2019-05-14 17:06:31",'%y-%m')
	
	SELECT u.user_id,user_account,user_password,user_name,user_sex,user_creat_time,user_is_lock,user_wrong_number,user_email,user_phone,
					r.role_id,r.role_name
		FROM `user` u INNER JOIN user_role ur ON u.user_id=ur.user_id INNER JOIN role r ON ur.role_id=r.role_id WHERE user_account="root" 
		
		SELECT DATE_FORMAT(NOW(),'%y-%m-%d')
		SELECT DATE_FORMAT(NOW(),"%H-%i")
		
SELECT COUNT(u.user_id) FROM `user` u INNER JOIN user_role ur ON u.user_id = ur.user_id WHERE ur.
#签到
SELECT COUNT(u.user_id) FROM `user` u INNER JOIN sign s ON u.user_id = s.user_id WHERE DATE_FORMAT(s.user_login_time,'%y-%m-%d') = DATE_FORMAT(NOW(),'%y-%m-%d')

#迟到
SELECT COUNT(u.user_id) FROM `user` u INNER JOIN sign s ON u.user_id = s.user_id WHERE DATE_FORMAT(s.user_login_time,'%y-%m-%d') = DATE_FORMAT(NOW(),'%y-%m-%d') AND DATE_FORMAT(NOW(),"%H-%i") > "08-00"
#未签到
SELECT COUNT(DISTINCT(u.user_id)) FROM `user` u INNER JOIN sign s ON u.user_id = s.user_id WHERE DATE_FORMAT(s.user_login_time,'%y-%m-%d') != DATE_FORMAT(NOW(),'%y-%m-%d')

SELECT u.user_id,user_account,user_password,user_name,user_sex,user_creat_time,user_is_lock,user_wrong_number,user_email,user_phone, r.role_id,r.role_name FROM `user` u LEFT JOIN user_role ur ON u.user_id=ur.user_id LEFT JOIN role r ON ur.role_id=r.role_id WHERE user_account="root"