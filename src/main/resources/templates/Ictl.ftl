package com.seaboxdata.drd2.api.controller;

import com.seaboxdata.drd2.api.config.FeignClientConfig;
import com.seaboxdata.drd2.api.dto.duty.DutyDTO;
import com.seaboxdata.drd2.api.dto.page.PaginationResult;
import com.seaboxdata.drd2.api.input.duty.DutyInput;
import com.seaboxdata.drd2.api.input.duty.FindDutyListInput;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.cloud.openfeign.FeignClientsConfiguration;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(contextId = "Drd2Duty",
url = FeignClientConfig.URL,
name = FeignClientConfig.NAME,
configuration = FeignClientsConfiguration.class)
public interface IDutyCtl {

/** 查询input */
@PostMapping("/dutyctl/findDutyList")
PaginationResult<DutyDTO> findDutyList(@RequestBody FindDutyListInput input);

    /** 添加或更新职责 */
    @PostMapping("/dutyctl/addUpdateDuty")
    DutyDTO addUpdateDuty(@RequestBody DutyInput input);

    /** 删除职责(批量) */
    @DeleteMapping("/dutyctl/delDutyByIdList")
    List<Long> delDutyByIdList(@RequestParam("dutyIdList") List<Long> dutyIdList);

            }
