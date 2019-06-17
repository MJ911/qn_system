<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html ng-app="app" lang="en">

<head>
    <meta charset="utf-8">
    <title>createquestionnaire</title>
    <link rel="stylesheet" type="text/css" href="/css/questionnaire.css">
    <script src="/js/jquery.min2.js"></script>
<!--     <script src="/js/jquery.min.js"></script> -->
    <script src="/js/createquestionnaire.js"></script>
<!-- 	<link rel="stylesheet" type="text/css" href="/css/wui.min.css"> -->
	<link rel="stylesheet" type="text/css" href="/css/wui.min.css">
		<link rel="stylesheet" type="text/css" href="/css/style_date.css">
		
		<script type="text/javascript" src="/js/angular.min.js"></script>
		<script type="text/javascript" src="/js/wui-date.js" charset="utf-8"></script>
</head>


<body>
<!--   	<form action="/qn_system/create_questionnaire" method="post"> -->
<!--   		<input name="questionnaire_name" type="hidden" value="xdxxxxx" /> -->
<!-- <!--   		<input name="question_list[0].question_name" type="hidden" value="xdxxxxx" /> -->
<!--   		<input type="submit" value="test"/> -->
<!--   	</form> -->

<!--   	<input type="hidden" name="question_list[0].question_number" value="1"/> -->
<!--   	<input type="hidden" name="question_list[1].question_number" value="2"/> -->
<!--   	<input type="submit" value="test"/> -->
<!--   </form> -->
  <form action="/qn_system/create_questionnaire" method="post">
    <input type="hidden" name="questionnaire_state" value="1"/>
    <input type="hidden" name="questionnaire_type" value="0"/>
    <center>问卷名<input type="text" name="questionnaire_name"/></center>
	
			<div align="center" class="wui-area">
				<p>问卷截止时间</p>
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
	
	
	
    <div class=" all_660">
        <div class="yd_box"></div>
        <div class="but" style="padding-top: 20px">
            <select id="addquerstions" class="addquerstions" name="">
                <option value="-1">添加问题</option>
                <option value="0">单选</option>
                <option value="1">多选</option>
                <option value="2">填空</option>
                <option value="3">矩阵</option>
            </select>
            <input type="button" id="button_xdx" value="添加问题"/>
        </div>
        <!--选项卡区域  模板区域---------------------------------------------------------------------------------------------------------------------------------------->
        <div class="xxk_box">
            <div class="xxk_conn hide">
                <!--单选----------------------------------------------------------------------------------------------------------------------------------------->
                <div class="xxk_xzqh_box dxuan ">
                
                    <textarea cols="" rows="" class="input_wenbk btwen_text btwen_text_dx" placeholder="单选题目"></textarea>
                    <div class="title_itram">
                        <div class="kzjxx_iteam">
                            <input name="" type="radio" value="" class="dxk">
                            <input name="" type="text" class="input_wenbk" value="" placeholder="选项">
<!--                             <label> -->
<!--                                 <input name="" type="checkbox" value="" class="fxk"> <span>可填空</span> -->
<!--                             </label> -->
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
                    
<%--                 	<input type="hidden" name="question_list[<%=question_num%>].question_num" value=<%=question_num %>/> --%>
                    <textarea cols="" rows="" class="input_wenbk btwen_text btwen_text_duox" placeholder="多选题目"></textarea>
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
                   
<%--                 	<input type="hidden" name="question_list[<%=question_num%>].question_num" value=<%=question_num %>/> --%>
                    <textarea cols="" rows="" class="input_wenbk btwen_text btwen_text_tk" placeholder="答题区"></textarea>
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
		 <input type="button" id="button" value="重置问卷" style="border:none;width:200px;height:50px;border-radius:30px;background:red;color:white;size=9px" />
    </div>
  </form>
</body>

</html>
