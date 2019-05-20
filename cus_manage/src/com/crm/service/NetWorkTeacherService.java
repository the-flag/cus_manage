package com.crm.service;

import java.util.List;

import com.crm.pojo.Access_record;
import com.crm.pojo.FenYe;

public interface NetWorkTeacherService {
FenYe selectNetWorkTeacher(FenYe fenye);

Integer insertTrackInfo(Access_record access_record);

List<Access_record> selectDateLog();
}
