<!--订单查看详情页面ftl-->
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="/admin/X-admin-2.2/css/font.css">
    <link rel="stylesheet" href="/admin/X-admin-2.2/css/xadmin.css">
    <script type="text/javascript" src="/admin/X-admin-2.2/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/admin/X-admin-2.2/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--></head>

<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">

            <div class="layui-form-item">
                <label for="name" class="layui-form-label">
                    下单用户：</label>
                <div class="layui-input-inline">
                    <input type="text"  value="${Order.user.username!""}" readonly="readonly" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="name" class="layui-form-label">
                    订单流水号：</label>
                <div class="layui-input-inline">
                    <input type="text"  value="${Order.orderNo!""}" readonly="readonly" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label for="description" class="layui-form-label">
                    收件人姓名：</label>
                <div class="layui-input-inline">
                    <input type="text" style="width: 190px"  value="${Order.address.receiverName!""}" readonly="readonly" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label for="description" class="layui-form-label">
                   配送地址：</label>
                <div class="layui-input-inline">
                    <input type="text" style="width: 300px" value="${Order.address.receiverAddress!""}" readonly="readonly" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label for="description" class="layui-form-label">
                    收件人手机：</label>
                <div class="layui-input-inline">
                    <input type="text" style="width: 190px"  value="${Order.address.receiverPhone!""}" readonly="readonly" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <table class="layui-table layui-form">
                <thead>
                <th style="text-align:center">商品名称</th>
                <th width="80" style="text-align:center">商品图片</th>
                <th width="100" style="text-align:center">商品单价(元/箱)</th>
                <th width="40" style="text-align:center">购买数量(箱)</th>
                <th width="40" style="text-align:center">小计(元)</th>
                </thead>
                <tbody class="x-cate">
                    <#if OrderItemList?size gt 0>
                        <#list OrderItemList as orderItem>
                            <tr>
                                <td style="text-align:center">${orderItem.productName!""}</td>
                                <td style="text-align:center"> <img src="/photo/view?filename=${orderItem.productPic!""}" width="70px" height="70px" /></td>
                                <td style="text-align:center">${orderItem.productPrice!""}</td>
                                <td style="text-align:center">${orderItem.quantity!""}</td>
                                <td style="text-align:center">${orderItem.totalPrice!""}</td>
                            </tr>
                        </#list>
                    </#if>
                </tbody>
            </table>


        </form>
    </div>
</div>
<script type="text/javascript">


</script>
<script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>

</html>