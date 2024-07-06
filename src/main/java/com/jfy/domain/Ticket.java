package com.jfy.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ticket {
    private Integer ticketId;
    private String ticketName;
    private BigDecimal price;
    private Integer totalQuantity;
    private Integer remainingQuantity;
    private Integer exhibitionId;
}
