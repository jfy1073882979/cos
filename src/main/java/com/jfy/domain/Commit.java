package com.jfy.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Commit {
    private Integer commitId;
    private Integer userId;
    private Integer exhibitionId;
    private String commitContent;
    private Integer rating;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date commitTime;

    private String exhibitionName;
}
