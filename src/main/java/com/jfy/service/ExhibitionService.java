package com.jfy.service;

import com.jfy.domain.Exhibition;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface ExhibitionService {
    public List<Exhibition> getAllExhibition();

    public Exhibition getExhibitionById(Integer exhibitionId);

    public Integer updateExhibitionRating( Integer exhibitionId, BigDecimal rating);

    public List<Exhibition> searchExhibitions(String exhibitionName);

    public Integer addExhibition(Exhibition exhibition);

    public Integer deleteExhibitionById(Integer exhibitionId);

    public Integer updateExhibitionInfo(Exhibition exhibition);

    public Integer updateExhibitionPic( Integer exhibitionId, String cover);


}
