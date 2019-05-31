#第一代  查询最近六个月所有咨询师的成交量  没有数据时该月份差不出来 比如 19-05，19-03  那19-04这个月份没有数据，没有查询出来
SELECT DATE_FORMAT(c.customer_jiaotime,'%y-%m') as 'yuefen' ,COUNT(1) as 'count' 
   	FROM customer c INNER JOIN `user` u ON c.user_id = u.user_id INNER JOIN user_role ur ON u.user_id = ur.user_id 
   	WHERE ur.role_id=3 GROUP BY DATE_FORMAT(c.customer_jiaotime,'%y-%m') ORDER BY DATE_FORMAT(c.customer_jiaotime,'%y-%m') DESC LIMIT 0,6
		
		
		#过度
		select DATE_FORMAT(t.customer_jiaotime,'%Y-%m') month,count(1) minute from device_data t
		where t.body_infrared>0 and t.device_id=13 
		AND  DATE_FORMAT(time,'%Y-%m')>
		DATE_FORMAT(date_sub(curdate(), interval 12 month),'%Y-%m')
		 group by device_id,month
		
#第二代  最近六个月所有咨询师的成交量  该月没有数据时 自动填充为0 并查询出来  如：19-05 ：2 ，19-04 ：0 ， 19-03 ： 4 那19-04这个月没有数据但填充为0
SELECT v.month name,IFNULL(c.b,0) value from past_12_month_view v LEFT JOIN
(select DATE_FORMAT(c.customer_jiaotime,'%y-%m') as a ,COUNT(1) as b
from customer c INNER JOIN `user` u ON c.user_id = u.user_id INNER JOIN user_role ur ON u.user_id = ur.user_id 
WHERE ur.role_id=3 AND 
DATE_FORMAT(c.customer_jiaotime,'%y-%m')>
DATE_FORMAT(date_sub(curdate(), interval 6 month),'%y-%m')
GROUP BY a) c
ON v.month= c.a  GROUP BY v.month,c.b ORDER BY v.`month` DESC;
		
		
		
		#创建查找过去六个月的视图
drop view if exists past_12_month_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `past_12_month_view` AS
    SELECT DATE_FORMAT(CURDATE(), '%y-%m') AS `month` 
    UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 1 MONTH), '%y-%m') AS `month` 
    UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 2 MONTH), '%y-%m') AS `month` 
    UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 3 MONTH), '%y-%m') AS `month` 
    UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 4 MONTH), '%y-%m') AS `month` 
    UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 5 MONTH), '%y-%m') AS `month` 
		
#查询
select t.month from past_12_month_view t group by t.month;
#定义最近六个月的时间 -- 函数
DELIMITER &&  
create procedure last6monthsdate()
BEGIN
		drop view if exists past_12_month_view;
		CREATE 
				ALGORITHM = UNDEFINED 
				DEFINER = `root`@`%` 
				SQL SECURITY DEFINER
		VIEW `past_12_month_view` AS
				SELECT DATE_FORMAT(CURDATE(), '%y-%m') AS `month` 
				UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 1 MONTH), '%y-%m') AS `month` 
				UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 2 MONTH), '%y-%m') AS `month` 
				UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 3 MONTH), '%y-%m') AS `month` 
				UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 4 MONTH), '%y-%m') AS `month` 
				UNION SELECT DATE_FORMAT((CURDATE() - INTERVAL 5 MONTH), '%y-%m') AS `month` ;

END&&
DELIMITER;

#定时器 -- 每月一号凌晨一点执行 调用函数 创建最近六个月的时间表

CREATE EVENT last6monthsdatetimer    
ON SCHEDULE EVERY 1 MONTH STARTS DATE_ADD(DATE_ADD(DATE_SUB(CURDATE(),INTERVAL DAY(CURDATE())-1 DAY), INTERVAL 1 MONTH),INTERVAL 1 HOUR)  
ON COMPLETION PRESERVE ENABLE  
DO  
 BEGIN  
     CALL last6monthsdate();  
 END

		
		