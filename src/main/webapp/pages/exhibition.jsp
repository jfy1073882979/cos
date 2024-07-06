<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>展会详情</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <div class="card mb-3">
        <div class="row no-gutters">
            <div class="col-md-4">
                <img src="/img/exhibition/${exhibition.exhibitionPic}" class="card-img" alt="${exhibition.exhibitionName}封面">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title">${exhibition.exhibitionName}</h5>
                    <p class="card-text">${exhibition.content}</p>
                    <p class="card-text"><small class="text-muted"><fmt:formatDate value="${exhibition.releaseTime}" pattern="yyyy-MM-dd HH:mm:ss" /></small></p>
                </div>
            </div>
        </div>
    </div>

    <h3>门票信息</h3>
    <c:forEach var="ticket" items="${ticketList}">
        <div class="card mb-3">
            <div class="card-body">
                <h5 class="card-title">${ticket.ticketName}</h5>
                <p class="card-text">价格: ￥${ticket.price}</p>
                <p class="card-text">数量: ${ticket.remainingQuantity}/${ticket.totalQuantity}</p>
                <a href="/ticket/jumpToOrder?ticketId=${ticket.ticketId}" class="btn btn-primary">购买门票</a>
            </div>
        </div>
    </c:forEach>

    <h3>评论区</h3>
    <form action="/commit/addCommit" method="post" class="mb-3">
        <div class="form-group">
            <textarea name="comment" class="form-control" rows="3" placeholder="发表评论"></textarea>
        </div>
        <div class="form-group">
            <label for="rating">评分:</label>
            <select name="rating" class="form-control" id="rating">
                <option value="1">1星</option>
                <option value="2">2星</option>
                <option value="3">3星</option>
                <option value="4">4星</option>
                <option value="5">5星</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">发表评论</button>
    </form>

    <c:forEach var="comment" items="${commitList}">
        <c:if test="${comment.exhibitionId eq exhibition.exhibitionId}">
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title">用户${comment.userId}: 评分${comment.rating}</h5>
                    <p class="card-text">${comment.commitContent}</p>
                    <p class="card-text"><small class="text-muted"><fmt:formatDate value="${comment.commitTime}" pattern="yyyy-MM-dd HH:mm:ss" /></small></p>
                </div>
            </div>
        </c:if>
    </c:forEach>

</div>

</body>
</html>