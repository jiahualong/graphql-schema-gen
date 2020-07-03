package com.seaboxdata.drd2.duty.ctl;

import com.seaboxdata.drd2.api.controller.IDutyCtl;
import com.seaboxdata.drd2.api.dto.duty.DutyDTO;
import com.seaboxdata.drd2.api.dto.page.PaginationResult;
import com.seaboxdata.drd2.api.input.duty.DutyInput;
import com.seaboxdata.drd2.api.input.duty.FindDutyListInput;
import com.seaboxdata.drd2.duty.service.IDutyService;
import com.seaboxdata.drd2.user.service.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@Slf4j
@RestController
public class DutyCtl implements IDutyCtl {

private IDutyService dutyService;
private IUserService userService;

public DutyCtl(IDutyService dutyService, IUserService userService) {
this.dutyService = dutyService;
this.userService = userService;
}

@Override
public PaginationResult<DutyDTO> findDutyList(FindDutyListInput input) {
    return dutyService.findDutyList(input, userService.getUser());
    }

    @Override
    public DutyDTO addUpdateDuty(DutyInput input) {
    return dutyService.addUpdateDuty(input, userService.getUser());
    }

    @Override
    public List<Long> delDutyByIdList(List<Long> dutyIdList) {
            return dutyService.delDutyByIdList(dutyIdList, userService.getUser());
            }
            }
