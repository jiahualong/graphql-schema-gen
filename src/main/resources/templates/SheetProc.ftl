package com.seaboxdata.seamodel5.sdm.draft.excelimport.service.impl;

import cn.hutool.poi.excel.ExcelReader;
import com.seaboxdata.seamodel5.comm.model.BaseModel;
import com.seaboxdata.seamodel5.sdm.draft.excelimport.model.${clz.clzName}Model;
import com.seaboxdata.seamodel5.sdm.draft.excelimport.service.ISheetProc;
import com.seaboxdata.seamodel5.sdm.draft.upload.convert.${clz.clzName?replace('Excel','')}Convert;
import com.seaboxdata.seamodel5.sdm.draft.upload.dao.I${clz.clzName?replace('Excel','')}MppDao;
import com.seaboxdata.seamodel5.sdm.draft.upload.model.${clz.clzName?replace('Excel','')};
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.io.File;
import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.toList;

/**
 * @Desc ${clz.comment}实体
 * @Author ${author}
 * @Date ${create}
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class SheetProc${clz.clzName} implements ISheetProc {
    /**
     * 处理 ${clz.clzName} Shhet
     *
     * @param batchId   批次
     * @param dmId      模型Id
     * @param baseModel 基础信息
     * @param excelFile Excel文件
     */
    @Override
    public void procUpload(@NotNull Long batchId, @NotNull Long dmId, @NotNull BaseModel baseModel, @NotNull File excelFile) {
        try (ExcelReader reader = new ExcelReader(excelFile, "${clz.comment}")) {
            List<${clz.clzName}Model> all = reader.read(HEADER_ROW_INDEX, START_ROW_INDEX, ${clz.clzName}Model.class);
            all.forEach(e -> log.info("excel,{}", e));
            List<${clz.clzName?replace('Excel','')}> entityUploads = all.stream()
                    .filter(Objects::nonNull)
                    .map(${clz.clzName}Model::redress)
                    .map(${clz.clzName?replace('Excel','')}Convert.INSTANCE::fromExcelModel)
                    .map(e -> e.setBaseModelValue(baseModel)
                            .setBatchId(batchId)
                            .setDmId(dmId)
                    ).collect(toList());
            if (!CollectionUtils.isEmpty(entityUploads)) {
                ${clz.clzNameUncapitalize?replace('Excel', '')}MppDaoImpl.saveBatch(entityUploads);
            }
        }
    }

    /** dao */
    private final I${clz.clzName?replace('Excel','')}MppDao ${clz.clzNameUncapitalize?replace('Excel','')}MppDaoImpl;
    /** excel header index */
    public static final int HEADER_ROW_INDEX = 1;
    /** excel start index */
    public static final int START_ROW_INDEX = 2;
}