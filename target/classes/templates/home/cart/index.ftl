<!--前台系统购物车页面-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <#include "../common/header.ftl"/>
    <title>购物车</title>
</head>

<body>
<!--顶部样式-->
<#include "../common/top_menu.ftl"/>
<!---->
<div><img src="/home/images/AD_page_img_02.png" width="100%"/></div>
<!--购物车样式-->
<div class="Narrow">
    <div class="shop_cart">
        <div class="cart_style">
            <div class="title_name">
                <ul>
                    <li class="title_width"><label class="auto-label"><input type="checkbox" id="all_selected"><span>全选</span></label></li>
                    <li class="title_width1">商品信息</li>
                    <li class="title_width2">单价</li>
                    <li class="title_width3">数量</li>
                    <li class="title_width4">小计</li>
                    <li class="title_width5">操作</li>
                </ul>
            </div>
            <div class="list_style">
                <form id="cart-form">
                    <#if CartVo.cartProductVoList?size gt 0>
                        <#list CartVo.cartProductVoList as cartProductVo>
                            <ul class="product_cart">
                                <li class="title_width"><input type="checkbox" class="check-box" tips="${cartProductVo.productId!""}"></li>
                                <li class="title_width1">
                                    <a href="/home/product/detail?id=${cartProductVo.productId!""}" class="product_img left"><img src="/photo/view?filename=${cartProductVo.productPic!""}" width="100px" height="100px" /></a>
                                    <p class="cart_content" style="text-align: center">
                                        <a href="/home/product/detail?id=${cartProductVo.productId!""}" class="title_name">${cartProductVo.productName!""}</a>
                                    </p>
                                </li>
                                <li class="title_width2">￥${cartProductVo.price!""}</li>
                                <li class="title_width3">
                                    <div class="Numbers">
                                        <a href="javascript:void(0);" onclick="reduce(${cartProductVo.productId!""});" class="jian">-</a>
                                        <input id="number${cartProductVo.productId!""}" name="number" readonly="readonly" type="text" value="${cartProductVo.quantity!""}" class="number_text">
                                        <a href="javascript:void(0);" onclick="add(${cartProductVo.productId!""});" class="jia">+</a>
                                    </div>
                                </li>
                                <li class="title_width4">￥${cartProductVo.productTotalPrice!""}</li>
                                <li class="title_width5"><a href="javascript:void(0);" onclick="delCartProduct(${cartProductVo.productId!""});">删除</a></li>
                            </ul>
                        </#list>
                    </#if>
                </form>
            </div>
        </div>
        <!--操作-->
        <div class="cart_operating clearfix">
            <div class="cart_operating_style">
                <div class="cart_price">商品总价：<b>￥${CartVo.cartTotalPrice!""}</b></div>
                <div class="cart_btn"><a href="javascript:void(0);" onclick="generateOrder();" class="payment_btn"></a><a href="/home/product/fruit" class="continue_btn"></a></div>
            </div>
        </div>
    </div>
</div>
<!--底部样式-->
<#include "../common/footer.ftl"/>
<script type="text/javascript">

    //判断当前是否已经全选
    var checkbox_arr = document.getElementsByClassName("check-box");
    for(var i = 0;i < checkbox_arr.length;i++){
        checkbox_arr[i].onclick=function(){
            var flag = true; //当前已全选
            $("#cart-form").find(".check-box").each(function(i,e){
                if($(e).attr("checked") == null){
                    flag = false;
                }
            });
            if(flag){
                $("#all_selected").attr("checked","true");
            }else{
                $("#all_selected").removeAttr("checked");
            }
        };
    }

    //商品全选操作
    document.getElementById("all_selected").onclick = function () {
        //获取checkbox元素
        var box=document.getElementById("all_selected");
        if(box.checked == true){
            //全选
            $("#cart-form").find(".check-box").each(function(i,e){
                $(e).attr("checked","true");
            });
        }else{
            //取消全选
            $("#cart-form").find(".check-box").each(function(i,e){
                $(e).removeAttr("checked");
            });
        }
    }


    //商品数量添加
    function add(id){
        $.ajax({
            url:'/home/cart/update',
            data:{productId:id,method:"add"},
            type:'post',
            dataType:'json',
            success:function(data){
                if(data.code == 0){
                    window.location.reload();
                }else{
                    layer.alert(data.msg, {icon: 5});
                }
            },
            error:function(){
                layer.alert("网络错误，增加商品数量失败！", {icon: 5});
            }
        });
    }

    //商品数量减少
    function reduce(id){
        var number = $("#number"+id).val();
        if(number <= 1){
            layer.alert("商品数量至少为1！", {icon: 5});
            return false;
        }
        $.ajax({
            url:'/home/cart/update',
            data:{productId:id,method:"reduce"},
            type:'post',
            dataType:'json',
            success:function(data){
                if(data.code == 0){
                    window.location.reload();
                }else{
                    layer.alert(data.msg, {icon: 5});
                }
            },
            error:function(){
                layer.alert("网络错误，减少商品数量失败！", {icon: 5});
            }
        });
    }

    //删除购物车商品
    function delCartProduct(id){
        $.ajax({
            url:'/home/cart/delete',
            data:{productId:id},
            type:'post',
            dataType:'json',
            success:function(data){
                if(data.code == 0){
                    window.location.reload();
                }else{
                    layer.alert(data.msg, {icon: 5});
                }
            },
            error:function(){
                layer.alert("网络错误，删除购物车商品失败！", {icon: 5});
            }
        });
    }

    //生成订单
    function generateOrder(){
        layer.confirm('确定要前往订单结算页面吗？',{btn: ['确定', '取消'],title:"信息提示"},
            function(index){
                //确定按钮的操作
                var ids = "";
                $("#cart-form").find(".check-box").each(function(i,e){
                    if($(e).attr("checked") != null){
                        ids = ids + $(e).attr("tips");
                        ids = ids + ",";
                    }
                });
                ids = ids.substring(0,ids.length-1);
                $.ajax({
                    url:'/home/order/generate',
                    data:{ids:ids},
                    type:'post',
                    dataType:'json',
                    success:function(data){
                        if(data.code == 0){
                            layer.close(index);
                            window.location.href = "/home/order/index?orderId="+data.data;
                        }else{
                            layer.alert(data.msg, {icon: 5});
                        }
                    },
                    error:function(){
                        layer.alert("网络错误，前往订单结算页面失败！", {icon: 5});
                    }
                });
        });
    }
</script>
</body>
</html>
