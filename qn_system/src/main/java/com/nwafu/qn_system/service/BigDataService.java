package com.nwafu.qn_system.service;

import java.util.List;

/**
 * 
 * @author jyq
 *
 */
public interface BigDataService {
    public Integer getNumber(int question_id);
    public List<String> getName(int question_id);
}
