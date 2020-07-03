package com.seaboxdata.drd2.duty.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.seaboxdata.drd2.api.dto.duty.DutyDTO;
import com.seaboxdata.drd2.api.dto.page.PaginationResult;
import com.seaboxdata.drd2.api.input.duty.DutyInput;
import com.seaboxdata.drd2.api.input.duty.FindDutyListInput;
import com.seaboxdata.drd2.duty.dao.DutyDAO;
import com.seaboxdata.drd2.duty.dao.mapper.DutyMapper;
import com.seaboxdata.drd2.duty.model.Duty;
import com.seaboxdata.drd2.duty.model.mapstruct.DutyMapStruct;
import com.seaboxdata.drd2.duty.service.IDutyService;
import com.seaboxdata.drd2.user.model.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.toList;

/**
* 职责服务
*/
@Slf4j
@Service
public class DutyService implements IDutyService {

private DutyDAO dutyDAO;
private DutyMapper dutyMapper;

public DutyService(DutyDAO dutyDAO, DutyMapper dutyMapper) {
this.dutyDAO = dutyDAO;
this.dutyMapper = dutyMapper;
}

/**
* 通过条件搜索Duty
*/
@Override
public PaginationResult<DutyDTO> findDutyList(FindDutyListInput input, User user) {
    input.trim();
    LambdaQueryWrapper<Duty> query = new LambdaQueryWrapper<Duty>()
            .eq(Duty::getIsDel, false)
            .eq(Duty::getTenantId, user.getTenantId())
            .eq(Duty::getOrgId, input.getOrgId())
            .orderByDesc(Duty::getCreateTm);
            IPage<Duty> page = dutyMapper.selectPage(new Page<>(input.getPageNum(), input.getSize()), query);
                if (Objects.nonNull(page)) {
                PaginationResult<DutyDTO> result = new PaginationResult<>();
                    result
                    .setTotal((int) page.getTotal())
                    .setPageNum(input.getPageNum())
                    .setLimit((int) page.getSize())
                    .setData(page.getRecords().stream().map(DutyMapStruct.INSTANCE::toDTO).collect(toList()));
                    return result;
                    } else {
                    return new PaginationResult<>(0, input.getPageNum(), input.getSize(), Collections.emptyList());
                    }
                    }

                    /**
                    * 添加Duty
                    */
                    @Override
                    public DutyDTO addUpdateDuty(DutyInput input, User user) {
                    Duty duty = DutyMapStruct.INSTANCE.fromInput(input);
                    if (isNewDuty(duty)) {
                    duty = dutyDAO.createDuty(duty, LocalDateTime.now(), user.getTenantId(), user.getId());
                    } else {
                    dutyDAO.updateDuty(duty, LocalDateTime.now(), user.getTenantId(), user.getId());
                    }
                    return DutyMapStruct.INSTANCE.toDTO(duty);
                    }

                    /**
                    * 删除Duty
                    */
                    @Override
                    public Long delDuty(Long dutyId, User user) {
                    Duty duty = dutyDAO.selectById(dutyId, user.getTenantId());
                    if (Objects.nonNull(duty)) {
                    dutyMapper.updateById(duty.setIsDel(true));
                    }
                    return dutyId;
                    }

                    @Override
                    public List<Long> delDutyByIdList(List<Long> dutyIdList, User user) {
                            List<Duty> existDutyList = dutyMapper.selectList(new LambdaQueryWrapper<Duty>()
                                    .eq(Duty::getTenantId, user.getTenantId())
                                    .in(Duty::getId, dutyIdList)
                                    );
                                    List<Long> delDutyIdList = existDutyList.stream().map(d -> {
                                        d.setIsDel(true);
                                        dutyMapper.updateById(d);
                                        return d.getId();
                                        }).collect(toList());
                                        return delDutyIdList;
                                        }

                                        private boolean isNewDuty(Duty duty) {
                                        if (Objects.nonNull(duty) && Objects.nonNull(duty.getId())) {
                                        return false;
                                        }
                                        return true;
                                        }
                                        }
