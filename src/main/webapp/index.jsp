<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: loqiu
  Date: 2020/3/16
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EmpList</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<%--empModifyModel   修改的模态框 --%>
<div class="modal fade" id="empModifyModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <%-- 显示添加提示的表单--%>
                <form class="form-horizontal">
                    <%-- empName--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <p class="form-control-static" id="empName_modify_input" name="lastName"></p>
                    </div>
                    <%--  empEmail--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="empEmail_modify_input"
                                   placeholder="empEmail@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--  empGander--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gander</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="empGender_modify_input_man" value="男"
                                       checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="empGender_modify_input_woman" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <%--  deptName--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">DeptName</label>
                        <div class="col-sm-4">
                            <%-- 部门提交部门id--%>
                            <select class="form-control" name="dId">
                                <%--内容应该从数据库中查询出来--%>

                            </select>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="emp_update_close_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<%--empAddModel  id="empAddModel" --> div --%>
<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <%-- 显示添加提示的表单--%>
                <form class="form-horizontal">
                    <%-- empName--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="lastName" class="form-control" id="empName_add_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--  empEmail--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="empEmail_add_input"
                                   placeholder="empEmail@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--  empGander--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gander</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="empGender_add_input_man" value="男"
                                       checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="empGender_add_input_woman" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <%--  deptName--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">DeptName</label>
                        <div class="col-sm-4">
                            <%-- 部门提交部门id--%>
                            <select class="form-control" name="dId">
                                <%--内容应该从数据库中查询出来--%>

                            </select>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="emp_close_btn">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<%--主页面--%>
<div class="container">
    <%--        标题--%>
    <div class="row">
        <div class="page-header">
            <h1>CRUD</h1>
        </div>
    </div>
    <%--    按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary btn-sm" id="btn_add_emp_model"><span class="glyphicon glyphicon-gift"
                                                                                aria-hidden="true"></span> 新增
            </button>
            <button class="btn btn-danger btn-sm" id="btn_del_emp_model"><span class="glyphicon glyphicon-remove"
                                                                               aria-hidden="true"></span> 删除
            </button>
        </div>
    </div>
    <%--表格信息--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>id</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>department</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">
        <%--        分页文字信息--%>
        <div class="col-md-6" id="page_info"></div>
        <%--            分页导航条信息--%>
        <div class="col-md-6" id="page_nav">

        </div>
    </div>
</div>
<script type="text/javascript">
    var totalRecord;
    var currentPage;
    /**
     * ====================================================给页面添加数据=======================================================
     */
    $(function () {
        btn_page(1);
    });

    /**
     * 解析json并在 table显示 每条信息
     */
    function build_emps_table(result) {
        //刷新页面之前要清空
        $("#emps_table tbody").empty();
        /**
         * //清空thead中的checkbox ?????????????????????????????????????????????
         */
        $("#check_all").removeAttr("checked");
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item' /></td>");
            var empIdTd = $("<td></td>").append(item.id);
            var empNameTd = $("<td></td>").append(item.lastName);
            var empGenderTd = $("<td></td>").append(item.gender);
            var empEmailTd = $("<td></td>").append(item.email);
            var empDeptTd = $("<td></td>").append(item.department.deptName);
            /**
             * 添加按钮
             */
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm editBtn")
                .append($("<span></span>")).addClass("glyphicon glyphicon-pencil").append("修改");
            editBtn.attr("edit_emp_id", item.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delBtn")
                .append($("<span></span>")).addClass("glyphicon glyphicon-remove").append("删除");
            delBtn.attr("del_emp_id", item.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            /**
             * 追加按钮
             */
            $("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(empGenderTd).append(empEmailTd).append(empDeptTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }

    /**
     * 显示分页数据
     */
    function build_page_info(result) {
        //刷新页面之前要清空
        $("#page_info").empty();
        var page = result.extend.pageInfo;
        $("#page_info").append("当前" + page.pageNum + "页,总" + page.pages + "页,总" + page.total + "条记录");
        totalRecord = page.total;
        currentPage = page.pageNum;
    }

    /**
     * 解析分页条
     * @param result
     */
    function build_page_nav(result) {
        //刷新页面之前要清空
        $("#page_nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        //首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        //前一页
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        //pageInfo.hasPreviousPage
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //不禁用才能用点击事件
            firstPageLi.click(function () {
                btn_page(1);
            });
            prePageLi.click(function () {
                btn_page(result.extend.pageInfo.pageNum - 1)
            });
        }
        //分页条
        ul.append(firstPageLi).append(prePageLi)
        //pageInfo.navigatepageNums
        var pageNum = result.extend.pageInfo.navigatepageNums;
        $.each(pageNum, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (item == result.extend.pageInfo.pageNum) {
                numLi.addClass("active");
            }
            //点击事件，让页面跳转
            numLi.click(function () {
                btn_page(item);
            });
            ul.append(numLi);
        });
        //后一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        //末页
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        //pageInfo.hasNextPage
        if (result.extend.pageInfo.hasNextPage == false) {
            lastPageLi.addClass("disabled");
            nextPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                btn_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                btn_page(result.extend.pageInfo.pages);
            });
        }
        //整合添加
        ul.append(nextPageLi).append(lastPageLi);
        //加入到nav中
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav");
    }

    /**
     * 页面跳转 并向页面添加数据
     */
    function btn_page(pageNum) {
        $.ajax({
            url: "${pageContext.request.contextPath}/empsWithJson",
            data: "pageNumber=" + pageNum,
            type: "GET",
            success: function (result) {
                //显示表格数据
                build_emps_table(result);
                //显示分页数据
                build_page_info(result);
                //显示分页条数据
                build_page_nav(result);
            }
        });
    }

    /**
     * * ===================================================================新增方法======================================================
     * 重置表单的方法
     */
    function reset_form(element) {
        //重置表单
        $("#empAddModel form")[0].reset();
        //清空样式
        $(element).find("*").removeClass("has-error has-success");
        //清空span的文本信息
        $(element).find(".help-block").text("");
    }

    /**
     * 打开模态框，添加emp 打开的同时要查询出部门信息
     */
    $("#btn_add_emp_model").click(function () {
        //每次打开模态框就清除原来的文本信息和样式
        reset_form("#empAddModel")
        /**
         * 发出Ajax请求 查询出部门信息
         */
        getDept("#empAddModel select");
        /**
         * 添加框体属性
         */
        $("#empAddModel").modal({
            backdrop: "static"
        });
    });

    /**
     * 查出所有部门信息
     * "#dept_name_list"
     */
    function getDept(ele) {
        //清空之前下拉列表的值
        $(ele).empty();
        $.ajax({
            url: "${pageContext.request.contextPath}/depts",
            type: "GET",
            success: function (resultDeptList) {
                select_deptNames(resultDeptList, ele);
            }
        });
    }

    function select_deptNames(resultDeptList, ele) {
        //清空select
        $("#dept_name_list").empty();
        /**
         * 添加select下拉选项
         * 添加deptName
         */
        var depts = resultDeptList.extend.deptList;
        $.each(depts, function (index, item) {
            var option = $("<option></option>").append(item.deptName).attr("value", item.id);
            option.appendTo(ele);
        });
    }

    /**
     * 数据校验方法--服务器的前端校验
     */
    function validata_add_form() {
        //拿到校验数据 使用正则表达式
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            // alert("用户名是2-5位汉字或6-16位英文");
            //美化验证，input框会变红，会有提示信息
            show_validate_msg("#empName_add_input", "error", "用户名是2-5位汉字或6-16位英文");
            return false;
        } else {
            show_validate_msg("#empName_add_input", "success", "");
        }
        // email test
        var empEmail = $("#empEmail_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(empEmail)) {
            // alert("邮箱格式不正确!");
            show_validate_msg("#empEmail_add_input", "error", "邮箱格式不正确!");
            return false;
        } else {
            show_validate_msg("#empEmail_add_input", "success", "");
        }
        return true;
    }

    /**
     * 显示校验信息
     */
    function show_validate_msg(element, status, msg) {
        //清除当前元素校验状态
        $(element).parent().removeClass("has-success has-error");
        $(element).next("span").text("");
        if ("success" == status) {
            $(element).parent().addClass("has-success");
            $(element).next("span").text(msg);
        } else if ("error" == status) {
            $(element).parent().addClass("has-error");
            $(element).next("span").text(msg);
        }
    }

    /**
     * 绑定 emp_save 提交emp数据
     */
    $("#emp_save_btn").click(function () {
        //先进行数据校验然后提交到服务器进行保存，也就是服务器的前端校验
        if (!validata_add_form()) {
            return false;
        }
        //数据校验之后
        if ($(this).attr("ajax_va") == "error") {
            return false;
        }
        //发送ajax请求
        $.ajax({
            url: "${pageContext.request.contextPath}/saveEmp",
            type: "POST",
            data: $("#empAddModel form").serialize(),
            success: function (resultMessage) {
                //返回格式需要是json格式，所以方法要加responseBody标签
                if (resultMessage.code == 100) {
                    //校验成功
                    //返回之后关闭模态框
                    $("#empAddModel").modal("hide");
                    //跳转到最后一页
                    btn_page(totalRecord + 1);
                } else {
                    //校验失败 显示失败信息
                    // console.log(resultMessage);
                    //有哪个字段的错误信息就显示哪个字段
                    if (undefined != resultMessage.extend.errorFileds.last_name) {
                        show_validate_msg("#empName_add_input", "error", "用户名是2-5位汉字或6-16位英文", resultMessage.extend.errorFileds.last_name);
                    }
                    if (undefined != resultMessage.extend.errorFileds.email) {
                        show_validate_msg("#empEmail_add_input", "error", "邮箱格式不正确!", resultMessage.extend.errorFileds.email);
                    }

                }
            }
        });
    });
    /**
     * 绑定change事件，检查邮箱是否重复
     */
    $("#empEmail_add_input").change(function () {
        //发送ajax请求，检查邮箱是否重复
        var empEmail = this.value;
        $.ajax({
            url: "${pageContext.request.contextPath}/checkEmpEmail",
            data: "empEmail=" + empEmail,
            type: "POST",
            success: function (checkResult) {
                if (checkResult.code == 100) {
                    show_validate_msg("#empEmail_add_input", "success", "邮箱可用");
                    $("#emp_save_btn").attr("ajax_va", "success")
                } else {
                    show_validate_msg("#empEmail_add_input", "error", checkResult.extend.va_msg);
                    $("#emp_save_btn").attr("ajax_va", "error")
                }
            }
        });
    });
    /**
     * 检查姓名是否重复
     */
    $("#empName_add_input").change(function () {
        var empName = this.value;
        $.ajax({
            url: "${pageContext.request.contextPath}/checkEmpName",
            data: "empName=" + empName,
            type: "POST",
            success: function (checkResult) {
                if (checkResult.code == 100) {
                    show_validate_msg("#empName_add_input", "success", "姓名可用");
                    $("#emp_save_btn").attr("ajax_va", "success")
                } else {
                    show_validate_msg("#empName_add_input", "error", checkResult.extend.va_msg);
                    $("#emp_save_btn").attr("ajax_va", "error")
                }
            }
        });
    });
    /**
     *=======================================================添加修改操作========================================================
     * 创建按钮之前绑定click事件，肯定绑定不上，因为没有按钮
     * 1，可以在创建按钮的时候绑定，2.绑定 on() 方法使后添加的也能绑定方法
     */
    $(document).on("click", ".editBtn", function () {
        //每次打开模态框就清除原来的文本信息和样式
        reset_form("#empModifyModel")
        /**
         * 发出Ajax请求 查询出部门信息
         */
        getDept("#empModifyModel select");
        getEmps($(this).attr("edit_emp_id"));
        //传递empid给更新模态框的更新按钮
        $("#emp_update_btn").attr("edit_emp_id", $(this).attr("edit_emp_id"));
        //查出部门信息，查出员工信息 调用模态框
        $("#empModifyModel").modal({
            backdrop: "static"
        });
    })

    /**
     * 查新员工信息，显示在模态框中，getEmp
     */
    function getEmps(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/getEmp/" + id,
            type: "GET",
            success: function (getEmpResult) {
                var empData = getEmpResult.extend.emp;
                $("#empName_modify_input").text(empData.lastName);
                $("#empEmail_modify_input").val(empData.email);
                //Ajax 在添加select和radio时的应用
                $("#empModifyModel input[name=gender]").val([empData.gender]);
                $("#empModifyModel select").val([empData.dId]);
            }
        });
    }

    /**
     * 给更新绑定点击事件 更新员工信息
     */
    $("#emp_update_btn").click(function () {
        //验证邮箱是否合法
        var empEmail = $("#empEmail_modify_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(empEmail)) {
            // alert("邮箱格式不正确!");
            show_validate_msg("#empEmail_modify_input", "error", "邮箱格式不正确!");
            return false;
        } else {
            show_validate_msg("#empEmail_modify_input", "success", "");
        }
        //发送更新请求
        $.ajax({
            url: "${pageContext.request.contextPath}/UpdateEmp/" + $(this).attr("edit_emp_id"),
            // type: "POST",
            // data:$("#empModifyModel form").serialize()+"&_method=PUT",
            type: "PUT",
            data: $("#empModifyModel form").serialize(),
            success: function (UpdateEmpResult) {
                // alert(UpdateEmpResult.msg);
                //返回格式需要是json格式，所以方法要加responseBody标签
                if (UpdateEmpResult.code == 100) {
                    //校验成功
                    //返回之后关闭模态框
                    $("#empModifyModel").modal("hide");
                    //跳转到当前页，更新数据
                    btn_page(currentPage);
                }
            }
        });
    });
    /**
     * =========================================================删除操作=================================================
     * 绑定删除click
     */
    $(document).on("click", ".delBtn", function () {
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        if(confirm("确认删除["+empName+"]吗？")){
            //删除单个emp
            $.ajax({
                url: "${pageContext.request.contextPath}/delEmp/" + $(this).attr("del_emp_id"),
                type:"DELETE",
                success:function (deleteEmpResult) {
                    alert(deleteEmpResult.msg);
                    btn_page(currentPage);
                }
            });
        }else{}
    });
    /**
     * checkbox 的全选全不选
     */
    $("#check_all").click(function () {
        //获取当前checkbox是否选中
        $(this).prop("checked");
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    /**
     * 给总的check_all绑定点击事件
     */
    $(document).on("click",".check_item",function () {
        //判断当前选中元素是否选中5个
        if($(".check_item:checked").length==$(".check_item").length){
            $("#check_all").prop("checked",true);
        }
    });
    /**
     * 批量删除
     */
    $("#btn_del_emp_model").click(function () {
        var empNames="";
        var del_ids_str="";
        $.each($(".check_item:checked"),function (index,item) {
            //要删除的员工姓名
            empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            //组装id的字符串
            del_ids_str+=$(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        empNames = empNames.substring(0,empNames.length-1);
        del_ids_str = del_ids_str.substring(0,del_ids_str.length-1);
        if(confirm("确认删除["+empNames+"]吗？")){
            $.ajax({
                url: "${pageContext.request.contextPath}/delEmp/" + del_ids_str,
                type:"DELETE",
                success:function (deleteEmpResult) {
                    alert(deleteEmpResult.msg);
                    btn_page(currentPage);
                }
            });
        }
    });
</script>
</body>
</html>
