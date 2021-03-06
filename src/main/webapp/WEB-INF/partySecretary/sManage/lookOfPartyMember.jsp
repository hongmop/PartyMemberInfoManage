<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看所属党员信息</title>
<link rel="stylesheet" href="${rootPath }css/bootstrap.css">
<link rel="stylesheet" href="${rootPath }css/partySecretary/red_tou.css">
<link rel="stylesheet" href="${rootPath }css/partySecretary/partyinformation.css">
<script src="${rootPath }js/jquery-2.2.3.min.js"></script>
<script src="${rootPath }js/bootstrap.js"></script>
</head>

<body>

<%@ include file="../head.jsp"%>

<!--以上为头部-->

		
<div id="body">
 <div id="body-one">
   <p><img src="${rootPath }images/topimg.png"> <span>您的位置：
   <a href="${rootPath }secretary/pSForward_fIndex">首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;党员管理&nbsp;&nbsp;>&nbsp;&nbsp;所属党员信息</span></p>
 </div>
 <div id="body-two">
 	<form action="${rootPath }secretary/partySecretary_lookOfPartyMember" method="post">
    	<input type="text" name="search" class="form-control" placeholder="您可以通过/姓名/民族/籍贯/手机号/搜索" autocomplete="off"/>
     	<button class="btn btn-primary sure" type="submit">搜索</button>
     </form>
 </div>
 <div id="body-three">
     <div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
    <thead>
      <tr class="two">
         <th>姓名</th>
         <th>年龄</th>
         <th>性别</th>
         <th>民族</th>
        <!-- <th>籍贯</th>-->
         <th>手机号</th>
         <!--  
         <th>学习时长</th>
         <th>注册日期</th>
         <th>出生日期</th>-->
         <th>身份证号</th>
         <th>入党日期</th>
         <th>在党职务</th>
          <th>所属党支部</th>
          <th>详细信息</th>
       </tr>
      </thead>
      <tbody>
      			<c:forEach items="${pc.data}" var="pmi">
				  <tr>
						<td>${pmi.username}</td>
						<td>${pmi.age}</td>
						<td>${pmi.sex}</td>
						<td>${pmi.nation}</td>
						<!--<td>${pmi.nativePlace}</td>-->
						<td>${pmi.phoneNo}</td>
						<!-- <td>${pmi.strLearnTime}</td>
						<td>${pmi.loginDate}</td>
						<td>${pmi.birthdate}</td>-->
						<td>${pmi.idCard}</td>
						<td>${pmi.joinPartyDate}</td>
						<td>${pmi.duties}</td>
						<td>${pmi.partyBranch}</td>
						<td><a href="${rootPath }secretary/partySecretary_partyMemberData?pmiId=${pmi.ptm_Id}">详细信息</a></td>
					</tr>
				</c:forEach>
      </tbody>
    </table>
 </div>
 </div>
 </div>
	
	
	<div id="pagecut" style="text-align:center;">
		<ul class="pagination">
			<li><a href="${rootPath }secretary/partySecretary_lookOfPartyMember?page=${pc.prePage}&&search=${search}">上一页</a></li>
			<c:if test="${1 < pc.currentPage -3}">
				<li><a href="${rootPath }secretary/partySecretary_lookOfPartyMember?page=1&&search=${search}">1</a></li>
			</c:if>
			
			<c:forEach var="i" begin="${pc.currentPage-3>0?pc.currentPage-3:1 }" end="${pc.currentPage+3>pc.pageNum?pc.pageNum:pc.currentPage+3  }">
				<c:choose>
					<c:when test="${i>0 && i == pc.currentPage }">
						<li class="active"><a href="${rootPath }secretary/partySecretary_lookOfPartyMember?page=${i }&&search=${search}">${i}</a></li>
					</c:when>

					<c:when test="${i>0 && i != postPS.currentPage }">
						<li><a href="${rootPath }secretary/partySecretary_lookOfPartyMember?page=${i }&&search=${search}">${i}</a></li>
					</c:when>
				</c:choose>
			</c:forEach>
			<li><a href="${rootPath }secretary/partySecretary_lookOfPartyMember?page=${pc.nextPage}&&search=${search}">下一页</a></li>
		</ul>
	</div>
		
	 <footer id="footer-warp"><!--页脚开始-->
		<p class="footer"><a href="">网站声明</a> &nbsp; &nbsp;<span>|</span> &nbsp; &nbsp;<a href="">关于我们 &nbsp; &nbsp;</a><span>|</span> &nbsp; &nbsp;<a href="">联系我们</a></p>
		<p>Copyright @ 2016 All rights reserved.　　版权所有：河南科技学院党委</p>
</footer><!--页脚结束-->		
</body>
</html>