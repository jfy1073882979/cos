package com.jfy.dao;

import com.jfy.domain.Exhibition;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface ExhibitionMapper {
    public List<Exhibition> getAllExhibition();
    public Exhibition getExhibitionById(Integer exhibitionId);
    public Integer updateExhibitionRating(@Param("exhibitionId") Integer exhibitionId,@Param("rating") BigDecimal rating);

    public List<Exhibition> searchExhibitions(String exhibitionName);
    public Integer addExhibition(Exhibition exhibition);

    public Integer deleteExhibitionById(Integer exhibitionId);

    public Integer updateExhibitionInfo(Exhibition exhibition);

    public Integer updateExhibitionPic(@Param("exhibitionId") Integer exhibitionId,@Param("cover") String cover);

}
