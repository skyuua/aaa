<!--前台系统订单结算页面-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/home/css/css.css" rel="stylesheet" type="text/css" />
    <link href="/home/css/common.css" rel="stylesheet" tyle="text/css" />
    <link href="/home/css/Orders.css" rel="stylesheet" type="text/css" />
    <script src="/home/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="/home/js/jquery.reveal.js" type="text/javascript"></script>
    <script src="/home/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <script src="/home/js/jquery.sumoselect.min.js" type="text/javascript"></script>
    <script src="/home/js/common_js.js" type="text/javascript"></script>
    <script src="/home/js/footer.js" type="text/javascript"></script>
    <script type="text/javascript" src="/admin/X-admin-2.2/lib/layui/layui.all.js" charset="utf-8"></script>
    <title>确认订单界面</title>
</head>
<script type="text/javascript">
    $(document).ready(function () {
        window.asd = $('.SlectBox').SumoSelect({ csvDispCount: 3 });
        window.test = $('.testsel').SumoSelect({okCancelInMulti:true });
    });
</script>
<body>
<div id="Orders" class="Inside_pages  clearfix">
    <div class="Orders_style clearfix">
        <div class="address clearfix">
            <div class="title">收货人信息</div>
            <div class="adderss_list clearfix">
                <div class="title_name">选择收货地址 <a href="/home/address/index">+选择地址</a><a href="javascript:void(0);" onclick="location.reload();">刷新地址</a></div>
                <div class="Shipping_address">
                    <ul class="detailed">
                        <li><label>收货人姓名</label><span><#if Address??>${Address.receiverName!""}</#if></span></li>
                        <li><label>电子邮件</label><span>${email!""}</span></li>
                        <li><label>详细地址</label><span><#if Address??>${Address.receiverAddress!""}</#if></span></li>
                        <li><label>手机号码</label><span><#if Address??>${Address.receiverPhone}</#if></span></li>
                    </ul>
                </div>
            </div>

            <form class="form" method="post">
                <fieldset>
                    <!--产品列表-->
                    <div class="Product_List">
                        <table>
                            <thead><tr class="title"><td class="name">商品名称</td><td class="price">商品单价</td><td class="Preferential">优惠价</td><td class="Quantity">购买数量</td><td class="Money">金额</td></tr></thead>
                            <tbody>
                                <#if Order.orderItemList?size gt 0>
                                    <#list Order.orderItemList as orderItem>
                                        <tr>
                                            <td class="Product_info">
                                                <a href="/home/product/detail?id=${orderItem.productId!""}"><img src="/photo/view?filename=${orderItem.productPic!""}"  width="100px" height="100px"/></a>
                                                <a href="/home/product/detail?id=${orderItem.productId!""}" class="product_name">${orderItem.productName!""}</a>
                                            </td>
                                            <td><i>￥</i>${orderItem.productPrice!""}</td>
                                            <td><i>￥</i>${orderItem.productPrice!""}</td>
                                            <td>${orderItem.quantity!""}</td>
                                            <td class="Moneys"><i>￥</i>${orderItem.totalPrice!""}</td>
                                        </tr>
                                    </#list>
                                </#if>
                            </tbody>
                        </table>
                        <div class="Pay_info">
                            <label>订单留言</label><input id="remark" type="text"  class="text_name " placeholder="请输入50字以内的订单留言" />
                        </div>
                        <!--价格-->
                        <div class="price_style">
                            <div class="right_direction">
                                <ul>
                                    <li><label>商品总价</label><i>￥</i><span>${Order.totalPrice!""}</span></li>
                                    <li class="shiji_price"><label>实&nbsp;&nbsp;付&nbsp;&nbsp;款</label><i>￥</i><span>${Order.totalPrice!""}</span></li>
                                </ul>
                                <div class="btn"><input onclick="submitOrder(${Order.id!""});" type="button" value="提交订单" class="submit_btn"/> <input onclick="backCart();" type="button" value="返回购物车"  class="return_btn"/></div>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>
    <script type="text/javascript">

        //返回购物车
        function backCart(){
            window.location.href = "/home/cart/index";
        }

        //提交订单
        function submitOrder(id){
            var remark = $("#remark").val();
            $.ajax({
                url:'/home/order/submit',
                data:{remark:remark,orderId:id},
                type:'post',
                dataType:'json',
                beforeSend: function () {
                    layer.msg('正在提交订单信息...请稍后....', {
                        shade: 0.4,
                        time:false //取消自动关闭
                    });
                },
                success:function(data){
                    if(data.code == 0){
                        layer.alert(data.msg, {icon: 6},function () {
                            window.location.href = "/home/user/order";
                        });
                    }else{
                        layer.alert(data.msg, {icon: 5});
                    }
                },
                error:function(){
                    layer.alert("网络错误，订单提交失败！", {icon: 5});
                }
            });
        }


    </script>
</body>
</html>
