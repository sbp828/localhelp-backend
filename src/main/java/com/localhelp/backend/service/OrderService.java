package com.localhelp.backend.service;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.localhelp.backend.dto.OrderRequest;
import com.localhelp.backend.dto.OrderResponse;
import com.localhelp.backend.model.Medicine;
import com.localhelp.backend.model.OrderItem;
import com.localhelp.backend.model.Orders;
import com.localhelp.backend.repository.MedicineRepository;
import com.localhelp.backend.repository.OrderItemRepository;
import com.localhelp.backend.repository.OrdersRepository;

@Service
@Transactional
public class OrderService {

    @Autowired
    private MedicineRepository medicineRepo;

    @Autowired
    private OrdersRepository ordersRepo;

    @Autowired
    private OrderItemRepository itemRepo;

    public OrderResponse createOrder(OrderRequest request) {

        Orders order = new Orders();
        order.setTotalAmount(0.0);

        Orders savedOrder = ordersRepo.save(order);

        double total = 0.0;

        for (OrderRequest.Item item : request.getItems()) {

            Medicine med = medicineRepo.findById(item.getMedicineId())
                    .orElseThrow(() -> new RuntimeException("Medicine not found"));

            int qty = item.getQuantity();

            if (med.getStock() < qty) {
                throw new RuntimeException("Insufficient stock for " + med.getName());
            }

            med.setStock(med.getStock() - qty);
            medicineRepo.save(med);

            double itemTotal = med.getPrice() * qty;
            total += itemTotal;

            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(savedOrder);
            orderItem.setMedicineId(med.getId());
            orderItem.setQuantity(qty);
            orderItem.setPrice(med.getPrice());

            itemRepo.save(orderItem);
        }

        savedOrder.setTotalAmount(total);
        ordersRepo.save(savedOrder);

        return new OrderResponse(
                savedOrder.getId(),
                total,
                "ORDER PLACED SUCCESSFULLY"
        );
    }
}
