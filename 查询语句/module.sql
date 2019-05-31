DELETE FROM module WHERE module_id=19 AND NOT EXISTS (SELECT * FROM role_module r WHERE r.module_id=19)
DELETE FROM module WHERE module_parent_id=
SELECT r.role_id,r.role_name,r.role_desc,r.role_flag FROM role r INNER JOIN role_module rm ON r.role_id=rm.role_id WHERE rm.module_id=18


DELETE FROM module WHERE module_id=19 AND NOT EXISTS (SELECT * FROM role_module r WHERE r.module_id=31)



SELECT * FROM role_module r WHERE r.module_id=19

DELETE FROM module WHERE module_id=31 AND NOT EXISTS (SELECT * FROM role_module r INNER JOIN (SELECT m1.* FROM module m INNER JOIN module m1 ON m.module_id=m1.module_parent_id  WHERE m.module_id=31) m ON r.module_id=m.module_id) AND NOT EXISTS (SELECT * FROM role_module r WHERE r.module_id=31)





INSERT INTO module(module_name,module_path,module_weight,module_parent_id) 
		select "测试44","ss",99,25 from dual 
		where not exists (select 1 from module a where a.module_name="测试44" AND a.module_parent_id=25)
		
		SELECT module_id,module_name,module_path,module_weight,module_parent_id FROM module
		WHERE module_name="测试44" AND module_parent_id=25
		
		SELECT module_id,module_name,module_path,module_weight,module_parent_id FROM module WHERE module_id=
		
		
		SELECT r.role_id,r.role_name,r.role_desc,r.role_flag 
		FROM role r INNER JOIN role_module rm ON r.role_id=rm.role_id 
		WHERE rm.module_id=30


		SELECT r.role_id,r.role_name,r.role_desc,r.role_flag,m.module_name 
		FROM role r INNER JOIN role_module rm ON r.role_id=rm.role_id INNER JOIN module m ON rm.module_id=m.module_id 
		WHERE rm.module_id=30
		
		
		






