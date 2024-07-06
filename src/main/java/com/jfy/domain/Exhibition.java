package com.jfy.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Exhibition {
    private Integer exhibitionId;

    private String exhibitionName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date releaseTime;
    private String content;
    private String exhibitionPic;
    private BigDecimal rating;
}
