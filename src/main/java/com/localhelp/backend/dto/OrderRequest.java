package com.localhelp.backend.dto;

import lombok.Data;
import java.util.List;

@Data
public class OrderRequest {

    private List<Item> items;

    @Data
    public static class Item {
        private Long medicineId;
        private int quantity;
    }
}
