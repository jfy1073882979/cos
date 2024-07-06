<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container mt-5">
    <form action="/order/submitOrder" method="post">
        <div class="form-group" style="display: none;">
            <label for="ticketId">门票ID</label>
            <input type="text" class="form-control" id="ticketId" name="ticketId" value="${ticket.ticketId}">
        </div>

        <div class="form-group">
            <label for="ticketName">门票</label>
            <input type="text" class="form-control" id="ticketName" name="ticketName" value="${ticket.ticketName}" readonly>
        </div>

        <div class="form-group">
            <label for="price">价格</label>
            <input type="text" class="form-control" id="price" name="price" value="${ticket.price}" readonly>
        </div>

        <div class="form-group">
            <label for="quantity">当前/总共票数</label>
            <input type="text" class="form-control" id="quantity" name="quantity" value="${ticket.remainingQuantity}/${ticket.totalQuantity}" readonly>
        </div>

        <div class="form-group">
            <label for="buyQuantity">购买数量</label>
            <input type="number" class="form-control" id="buyQuantity" name="buyQuantity" min="1" max="${ticket.remainingQuantity}">
        </div>

        <div class="form-group">
            <label for="exhibitionId">展会ID</label>
            <input type="text" class="form-control" id="exhibitionId" name="exhibitionId" value="${ticket.exhibitionId}" readonly>
        </div>

        <div class="form-group">
            <label for="totalCost">预计花费</label>
            <input type="text" class="form-control" id="totalCost" name="totalCost" readonly>
        </div>

        <button type="submit" class="btn btn-primary">确认</button>
        <button type="reset" class="btn btn-secondary">重置</button>
    </form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $('#buyQuantity').change(function(){
            var price = $('#price').val();
            var buyQuantity = $('#buyQuantity').val();
            var totalCost = price * buyQuantity;
            $('#totalCost').val(totalCost);
        });
    });
</script>