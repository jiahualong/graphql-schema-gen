package com.seaboxdata.drd2.duty.service;

import com.seaboxdata.drd2.api.dto.duty.DutyDTO;
import com.seaboxdata.drd2.api.dto.page.PaginationResult;
import com.seaboxdata.drd2.api.input.duty.DutyInput;
import com.seaboxdata.drd2.api.input.duty.FindDutyListInput;
import com.seaboxdata.drd2.user.model.User;

import java.util.List;

/** 职责服务 */
public interface IDutyService {

/** 通过条件搜索Duty */
PaginationResult<DutyDTO> findDutyList(FindDutyListInput input, User user);

    /** 添加Duty */
    DutyDTO addUpdateDuty(DutyInput input, User user);

    /** 删除Duty */
    Long delDuty(Long dutyId, User user);

    /** 删除Duty */
    List<Long> delDutyByIdList(List<Long> dutyIdList, User user);

            }
