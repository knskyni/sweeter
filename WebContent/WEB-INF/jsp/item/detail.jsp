<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="snack.bean.ItemBean" %>
<%@ page import="snack.helper.WebHelper" %>
<%@ page import="org.apache.commons.text.StringEscapeUtils" %>

<%
    String rootURL = WebHelper.getRootURL(request);

    ItemBean item = (ItemBean)request.getAttribute("itemview");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <jsp:include page="../common/head.jsp" />
</head>
<body>
    <jsp:include page="../header.jsp" />
    <section>
        <div class="container">
            <div class="card mt-4">
                <img class="card-img-top img-fluid" src="<%= rootURL + "/img/item/" + item.getImagePath() %>" alt="">
                <div class="card-body">
                    <h3 class="card-title"><%= StringEscapeUtils.escapeHtml4(item.getName()) %></h3>
                    <h4><%= String.format("%,d", item.getPrice()) %>円</h4>
                    <p class="card-text"><%= StringEscapeUtils.escapeHtml4(item.getDescription()) %></p>
                    評価: <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
                    <div class="mt-2">
                        <button id="cart" class="btn btn-primary float-left">お気に入りに追加</button>
                        <button id="cart" class="btn btn-primary float-right">カートに入れる</button>
                        <button id="purchase_auth" class="btn btn-primary float-right mr-3">今すぐ購入する</button>
                    </div>
                </div>
            </div>
            <!--
            <div class="card card-outline-secondary my-4">
                <div class="card-header">レビュー</div>
                <div class="card-body">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                    <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                    <hr>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                    <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                    <hr>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                    <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                    <hr>
                    <a href="#" class="btn btn-success">Leave a Review</a>
                </div>
            </div>
            -->
        </div>
    </section>

    <jsp:include page="../common/javascript.jsp" />
    <script type="text/javascript">
    function updateCart(itemId, itemCount) {
        $.ajax({
            url:'./cart/add',
            type:'GET',
            data:{
                'id': itemId,
                'count': itemCount
            }
        })
        .done((data) => {
        	alert('買い物かごに入れました。');
        })
        .fail( (jqXHR, textStatus, errorThrown) => {
            alert('更新に失敗しました。');
        });
    }

    $(function(){
        $('#cart').on('click', function(){
        	alert('!');
            updateCart(<%=(item.getId())%>, 0);
        });

        $('#purchase_auth').on('click', function(){
        	location.href="purchase/auth"
        });

        $('input').change(function() {
        	let id = $(this).parents('.row').parents('.row').data('id');
            let count = $(this).val();
            updateCart(id, count);
          });
    });</script>
</body>
</html>