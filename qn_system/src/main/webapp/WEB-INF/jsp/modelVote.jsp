<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html ng-app="app" lang="en">

<head>
    <meta charset="utf-8">
    <title>createVote</title>
    <link rel="stylesheet" type="text/css" href="/css/questionnaire.css">
    
    <script src="/js/jquery.min2.js"></script>
<!--     <script src="/js/jquery.min.js"></script> -->
    <script src="/js/createquestionnaire_vote.js"></script>
<!-- 	<link rel="stylesheet" type="text/css" href="/css/wui.min.css"> -->
	<link rel="stylesheet" type="text/css" href="/css/wui.min.css">
	<link rel="stylesheet" type="text/css" href="/css/style_date.css">
	<script type="text/javascript" src="/js/angular.min.js"></script>
	<script type="text/javascript" src="/js/wui-date.js" charset="utf-8"></script>
</head>

<body>
   <form action="/qn_system/create_questionnaire" method="post">
    <input type="hidden" name="questionnaire_state" value="1"/>
    <input type="hidden" name="questionnaire_type" value="1"/>
    <center>投票名<input type="text" name="questionnaire_name" value="${questionnaire.questionnaire_name }"/></center>
	
			<div align="center" class="wui-area">
				<p>投票截止时间</p>
				<wui-date 
					name="questionnaire_xdx"
					format="yyyy-mm-dd hh:mm" 
					placeholder="请选择或输入日期" 
					id="date1" 
					btns="{'ok':'确定','now':'此刻'}" 
					ng-model="date1"
				>
				</wui-date>
			</div>
		<script type="text/javascript">
			var app = angular.module('app',["wui.date"]);
		</script>
		
		
	<c:forEach items="${questionnaire.question_list }" var="question">
		<i class="q_name" style="display:none;">${question.question_name }</i>
		<c:if test="${question.question_type==1 }">
			<script>
				$(function(){
					$("#addquerstions").val("0");
					$("#addquerstions").trigger("change");
				});
			</script>
		</c:if>
		
		<c:if test="${question.question_type==2 }">
			<script>
				$(function(){
					$("#addquerstions").val("1");
					$("#addquerstions").trigger("change");
				});
			</script>
		</c:if>

		<!-- 设置题目 -->
		<script>
				$(function(){
					var index = $(".yd_box").find(".movie_box").length - 1;
					var name = $(".q_name").eq(index).text();
					$(".yd_box").find(".movie_box").eq(index).find(".btwenzi").text(name);
				});
				
		</script>
		<!-- 如果是非填空题，则设置选项 -->
		<div style="display:none;" class="op_for">
			<script>
					$(function(){
						count = 0;
// 						alert("一道题");
						var index = $(".yd_box").find(".movie_box").length - 1;
// 						alert(index);
						$(".yd_box").find(".movie_box").eq(index).mouseenter();
						$(".yd_box").find(".movie_box").eq(index).find(".bianji").click();
					});
			</script>
		<c:if test="${question.question_type ne 3 }">
				
			<c:forEach items="${question.options_list }" var="option">
				<i style="display:none;" class="op_num">${option.option_number }</i>
				<i style="display:none;" class="op_name">${option.option_name }</i>
				<script>
					$(function(){
						count++;
						var index = $(".yd_box").find(".movie_box").length - 1;
// 						var number = $(".op_for").eq(index).find(".op_num").eq(count-1).text();
						var op_name = $(".op_for").eq(index).find(".op_name").eq(count-1).text();
// 						alert("index:"+index+"  count:"+count +"  name:"+op_name);
						
						if(count > 1){
							$(".zjxx")[index].click();
// 							$(".zjxx")[index].ready();
// 							alert(index+"添加一个选项");
						}
						$(".yd_box").find(".movie_box").eq(index).find(".input_wenbk").eq(count).val(op_name);
						
					});
				</script>
			</c:forEach>
		
			<!-- 完成编辑 -->
			<script>
// 				$(function(){
// 					var index = $(".yd_box").find(".movie_box").length - 1;
// 					$(".yd_box").find(".movie_box").eq(index).find(".swcbj_but").click();
// 				})
			</script>
		</c:if>
		</div>
	</c:forEach>
		
		
		
		
		
    <div class=" all_660">
        <div class="yd_box"></div>
        <div class="but" style="padding-top: 20px">
            <select id="addquerstions" class="addquerstions" name="">
                <option value="-1">选择投票类型</option>
                <option value="0">单选</option>
                <option value="1">多选</option>
<!--                 <option value="2">填空</option> -->
<!--                 <option value="3">矩阵</option> -->
            </select>
            
        </div>
        <!--选项卡区域  模板区域	---------------------------------------------------------------------------------------------------------------------------------------->
        <div class="xxk_box">
            <div class="xxk_conn hide">
                <!--单选----------------------------------------------------------------------------------------------------------------------------------------->
                <div class="xxk_xzqh_box dxuan ">
                    <textarea style="display:none;" name="" cols="" rows="" class="input_wenbk btwen_text btwen_text_dx" placeholder="单选题目"></textarea>
                    <div class="title_itram">
                        <div class="kzjxx_iteam">
                            <input name="" type="radio" value="" class="dxk">
                            <input name="" type="text" class="input_wenbk" value="" placeholder="选项">
<!--                             <label> -->
<!--                                 <input name="" type="checkbox" value="" class="fxk"> <span>可填空</span> -->
<!--                             </label>  -->
                            <a href="javascript:void(0);" class="del_xm">删除</a>
                        </div>
                    </div>
                    <a href="javascript:void(0)" class="zjxx">增加选项</a>
                    <!--完成编辑-->
                    <div class="bjqxwc_box">
                        <a href="javascript:void(0);" class="qxbj_but">取消编辑</a>
                        <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                    </div>
                </div>
                <!--多选----------------------------------------------------------------------------------------------------------------------------------------->
                <div class="xxk_xzqh_box duoxuan hide">
                    <textarea style="display:none;" name="" cols="" rows="" class="input_wenbk btwen_text btwen_text_duox" placeholder="多选题目"></textarea>
                    <div class="title_itram">
                        <div class="kzjxx_iteam">
                            <input name="" type="checkbox" value="" class="dxk">
                            <input name="" type="text" class="input_wenbk" value="选项" placeholder="选项">
<!--                             <label> -->
<!--                                 <input name="" type="checkbox" value="" class="fxk"> <span>可填空</span></label> -->
                            <a href="javascript:void(0);" class="del_xm">删除</a>
                        </div>
                    </div>
                    <a href="javascript:void(0)" class="zjxx">增加选项</a>
                    <!--完成编辑-->
                    <div class="bjqxwc_box">
                        <a href="javascript:void(0);" class="qxbj_but">取消编辑</a>
                        <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                    </div>
                </div>
                <!-- 填空----------------------------------------------------------------------------------------------------------------------------------------->
                <div class="xxk_xzqh_box tktm hide">
                    <textarea name="" cols="" rows="" class="input_wenbk btwen_text btwen_text_tk" placeholder="答题区"></textarea>
                    <!--完成编辑-->
                    <div class="bjqxwc_box">
                        <a href="javascript:void(0);" class="qxbj_but">取消编辑</a>
                        <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                    </div>
                </div>
                <!-- 矩阵----------------------------------------------------------------------------------------------------------------------------------------->
                <div class="xxk_xzqh_box  hide">
                    <div class="line_dl"></div>
                    <div class="jztm">
                        <textarea name="" cols="" rows="" class="input_wenbk btwen_text" placeholder="题目"></textarea>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tbody>
                                <tr valign="top">
                                    <td width="135">
                                        <h4 class="ritwenz_xx">左标题</h4>
                                        <textarea name="" cols="" rows="" class="leftbtwen_text" placeholder="例子：CCTV1，CCTV2，CCTV3"></textarea>
                                    </td>
                                    <td>
                                        <h4 class="ritwenz_xx  ">
                                                右侧选项文字 <input type="radio" name="xz" value="0"
                                                    checked="checked" class="xzqk">单选<input
                                                    type="radio" value="1" name="xz" class="xzqk">多选
                                            </h4>
                                        <div class="title_itram">
                                            <div class="kzjxx_iteam">
                                                <input name="" type="text" class="input_wenbk jzwent_input" value="选项" onBlur="if(!this.value)this.value='选项'" onClick="if(this.value&amp;&amp;this.value=='选项' )  this.value=''">
                                                <label>
                                                    <input name="" type="checkbox" value="" class="fxk"> <span>可填空</span></label> <a href="javascript:void(0);" class="del_xm">删除</a>
                                            </div>
                                            <div class="kzjxx_iteam">
                                                <input name="" type="text" class="input_wenbk jzwent_input" value="选项" onBlur="if(!this.value)this.value='选项'" onClick="if(this.value&amp;&amp;this.value=='选项' )  this.value=''">
                                                <label>
                                                    <input name="" type="checkbox" value="" class="fxk"> <span>可填空</span></label> <a href="javascript:void(0);" class="del_xm">删除</a>
                                            </div>
                                            <div class="kzjxx_iteam">
                                                <input name="" type="text" class="input_wenbk jzwent_input" value="选项" onBlur="if(!this.value)this.value='选项'" onClick="if(this.value&amp;&amp;this.value=='选项' )  this.value=''">
                                                <label>
                                                    <input name="" type="checkbox" value="" class="fxk"> <span>可填空</span></label> <a href="javascript:void(0);" class="del_xm">删除</a>
                                            </div>
                                        </div> <a href="javascript:void(0)" class="zjxx" style="margin-left: 0;">增加选项</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!--完成编辑-->
                        <div class="bjqxwc_box">
                            <a href="javascript:void(0);" class="qxbj_but">取消编辑</a> <a href="javascript:void(0);" class="swcbj_but"> 完成编辑</a>
                        </div>
                    </div>
                </div>

				


            </div>
        </div>
    </div>
	<div class="xxk_xzqh_box dxuan"  align="center">
		 <input type="submit" id="button" value="生成问卷" style="border:none;width:200px;height:50px;border-radius:30px;background:blue;color:white;size=9px" />
		 <input type="submit" id="button" value="重置问卷" style="border:none;width:200px;height:50px;border-radius:30px;background:red;color:white;size=9px" />
    </div>
  </form>
</body>

</html>
