<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<c:set var="basePath" value="<%=basePath %>"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <title>大圆中秋趴</title>
    <link rel="stylesheet" type="text/css" href="${imgPath}/css/reset.css?v=${imgVersion}"/>
    <script src="${imgPath}/thirdparty/jquery/jquery-1.11.3.min.js"></script>
    <script>
        var basePath = '<%=basePath%>';
    </script>

    <c:if test="${userAgent == 'MicroMessenger'}">
        <jsp:include page="include/weixinShareConfig.jsp"/>


        <script>
            wx.ready(function(){
                //分享到朋友圈
                wx.onMenuShareTimeline({
                    title:  '${applicationScope['weixinDefaultShareTitle']}', // 分享标题
                    link: '<%=basePath%>index',
                    imgUrl: '${imgPath}${applicationScope['weixinDefaultShareIcon']}', // 分享图标
                    success: function () {
                        // 用户确认分享后执行的回调函数
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                    }
                });

                //分享给朋友
                wx.onMenuShareAppMessage({
                    title: '${applicationScope['weixinDefaultShareTitle']}', // 分享标题
                    desc: '${applicationScope['weixinDefaultShareDesc']}', // 分享描述
                    link:  '<%=basePath%>index',
                    imgUrl: '${imgPath}${applicationScope['weixinDefaultShareIcon']}', // 分享图标
                    type: 'link', // 分享类型,music、video或link，不填默认为link
                    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
                    success: function () {
                        // 用户确认分享后执行的回调函数
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                    }
                });

                wx.onMenuShareQQ({
                    title: '${applicationScope['weixinDefaultShareTitle']}', // 分享标题
                    desc: '${applicationScope['weixinDefaultShareDesc']}', // 分享描述
                    link: '<%=basePath%>index', // 分享链接
                    imgUrl: '${imgPath}${applicationScope['weixinDefaultShareIcon']}', // 分享图标
                    success: function () {
                        // 用户确认分享后执行的回调函数
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                    }
                });

                wx.onMenuShareWeibo({
                    title: '${applicationScope['weixinDefaultShareTitle']}', // 分享标题
                    desc: '${applicationScope['weixinDefaultShareDesc']}', // 分享描述
                    link: '<%=basePath%>index', // 分享链接
                    imgUrl: '${imgPath}${applicationScope['weixinDefaultShareIcon']}', // 分享图标
                    success: function () {
                        // 用户确认分享后执行的回调函数
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                    }
                });

                wx.onMenuShareQZone({
                    title: '${applicationScope['weixinDefaultShareTitle']}', // 分享标题
                    desc: '${applicationScope['weixinDefaultShareDesc']}', // 分享描述
                    link: '<%=basePath%>index', // 分享链接
                    imgUrl: '${imgPath}${applicationScope['weixinDefaultShareIcon']}', // 分享图标
                    success: function () {
                        // 用户确认分享后执行的回调函数
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                    }
                });
            });



            var userAgent = "MicroMessenger";



        </script>
    </c:if>
</head>
<body>
<div class="page">
    <div class="head">
        <p>今年中秋，还在苦恼送五仁月饼还是韭菜月饼？大圆君悄悄告诉你，有一个礼物只有我们知道~与亲朋好友分享，就能让大家的财富一起增值！</p>
    </div>
    <!--状态1 -->
    <div class="share f-dn">
        <div class="btn f-tac" style="padding-top: 3rem;">
            <a href="#"><img src="${imgPath}/images/btn-share.png" /></a>
        </div>
    </div>
    <!--状态2 -->
    <div class="share f-dn sharinfomation">
        <div class="title f-tac" style="padding-top: 2rem;">
            <img src="${imgPath}/images/title-fxhy.png" />
        </div>
        <div class="btn f-tac">
            <a onclick="shareinfomation();"><img src="${imgPath}/images/btn-share.png" /></a>
        </div>
    </div>
    <!--状态3 -->
    <div class="share" id="accountInput">
        <div class="phone f-tac mt0-3">
            <span style="line-height: 1.9rem;">普洱账号：</span>
            <span class="ipt"><input id="account" name="account" maxlength="16" type="text" value=""></span>
        </div>
        <div class="btn f-tac mt0-3">
            <a onclick="submitShareForm();"><img src="${imgPath}/images/btn-share2.png" /></a>
        </div>
        <div class="btn f-tac mt0-3">
            <a onclick="toOpenAccount();"><img src="${imgPath}/images/btn-newuser.png" /></a>
        </div>
    </div>
    <!--状态4 -->
    <div class="share f-dn" id="downloadAppView">
        <h2>请下载APP，或关注微信公众号，参与活动！</h2>
        <div class="qrCode">
            <div class="qr-module">
                <p><img src="${imgPath}/images/code1.png"></p>
                <p>大圆银泰掌上交易端</p>
                <p><a href="${applicationScope['systemPuerAppDownloadPage']}">点击立即下载 ></a></p>
            </div>
            <div class="qr-module">
                <p><img src="${imgPath}/images/code2.png"></p>
                <p>扫描二维码或微信搜索</p>
                <p>dytjme 并关注 ></p>
            </div>
        </div>
    </div>
    <div class="article">
        <h2 class="title"><img src="${imgPath}/images/title-hdgz.png"></h2>
        <p>活动时间：活动时间：即日起----2016年9月30日15:00止</p>
        <p>活动人数：前30000名符合条件的交易商</p>
    </div>
    <div class="rule">
        <table>
            <tr>
                <td width="20%">时间</td>
                <td>新用户</td>
                <td width="19%">新用户获赠</td>
                <td width="19%">老用户获赠</td>
            </tr>
            <tr>
                <td rowspan="2">首次入金至<br>下次众筹日止</td>
                <td>日权益（资金＋持仓）大于<br>888元，日均持仓大于500元</td>
                <td>总值不低于<br><span style="color: #ee4721;">8</span>元的新品</td>
                <td>总值不低于<br><span style="color: #ee4721;">8</span>元的新品</td>
            </tr>
            <tr>
                <td>日权益（资金＋持仓）大于<br>8888元，日均持仓大于5000元</td>
                <td>总值不低于<br><span style="color: #ee4721;">128</span>元的新品</td>
                <td>总值不低于<br><span style="color: #ee4721;">48</span>元的新品</td>
            </tr>
        </table>
    </div>
    <div class="article">
        <h2 class="title"><img src="${imgPath}/images/title-tbsm.png"></h2>
        <p>1、活动期间新朋友在首次开户后也可以推荐更多的朋友，享受奖励。推荐人最多可累计获得<span style="color: #ee4721;">10次</span>奖励。如：A君推荐11位好友， 11位好友都符合活动内容2，则A君可获得不低于480元的推荐前10位好友新藏品奖励，但11位好友每人可获得不低于128元的新藏品奖励；<p>
        <p>2、持仓：是指交易商每个交易日15:00后持有藏品的市值；日平均持仓：按每日总持仓累计除以累计交易日来计算。<p>
        <p>3、活动赠送<span style="color: #ee4721;">30000名</span>，符合条件的交易商按首次入金的时间先后次序，先到先得，送完为止。<p>
        <p>4、指定众筹日指大圆普洱交易中心9月30日后首次藏品众筹开始日，赠品在该次众筹活动中予以赠送和发放。<p>
        <p>5、对本次活动，大圆普洱交易中心将对新开户做电话回访，如有虚假开户或其他违反大圆普洱交易中心相关规则、管理办法的，大圆普洱交易中心有权取消相应交易商参与本次活动的资格。<p>
        <p>6、参与的个人和机构，不得向第三方做出超过本活动条款之外的承诺。违规者取消活动资格，责任自负。<p>
        <p>7、推荐人应准确填写推荐人的交易帐号，对填写错误的交易帐号导致无法赠送的，责任自行承担，与大圆普洱交易中心无关。<p>
        <p>8、推荐开户、交易符合较高奖励标准的，不能同时享受较低标准的奖励。<p>
        <p>9、建议参加活动的交易商请详细咨询您的经纪类会员单位，如您的经纪类公司单位未参与此次活动，您推荐的朋友将会自动分配到参与活动的其他经纪类会员单位，否则您将无法获得推荐奖励。<p>
        <p>10、具体详情可咨询大圆普洱交易市场客服电话400-928-2200。<p>
        <p>11、本次活动的最终解释权归大圆普洱交易中心所有。<p>
    </div>
</div>
<div class="download">
    <a href="${applicationScope['systemPuerAppDownloadPage']}"><img src="${imgPath}/images/download.png"></a>
</div>

<!-- 遮罩状态 start-->
<div id="maskDiv" class="tip f-dn">
<div class="tip-share">
<img src="${imgPath}/images/share.png" />
</div>
<div class="f-share"></div>
</div>
<!-- 遮罩状态 end-->
<div class="error" style="display: none;">
    <div>
        <p class="pic"><img src="${imgPath}/images/error_ico.png"></p>
        <p id="errorText"></p>
    </div>
    <div class="btn"><a>确定</a></div>
</div>
<div id="blackbackground" class="f-share f-dn"></div>
<script src="${imgPath}/js/checkinfo.js?v=${imgVersion}"></script>
<script>

    $(function(){
        var bwidth = $("body").width();
        tfont = bwidth/16;
        $("html").css("font-size",tfont);

        $(".error .btn").click(function(){
            $(".error").hide();
            $("#blackbackground").hide();
        })

        if(!isWeixin()) {
            $("#downloadAppView").attr("class", "share");
            $("#accountInput").hide();
        }
    })

    var generatedShareUrl = "";



    function submitShareForm() {

        if ($("#account").val() == "") {
            $("#errorText").html("请输入交易账号!");
            $("#blackbackground").show();
            $(".error").show();
            return false;
        }

        var reg = new RegExp("^[0-9]*$");
        var obj = $("#account").val();
        if(!reg.test(obj)){
            $("#errorText").html("请输入数字!");
            $("#blackbackground").show();
            $(".error").show();
            return false;
        }

        $.ajax({
            url: basePath+"account/generateShareUrl",
            type: "POST",
            data: {"account":$("#account").val()},
            dataType: "json",
            success: function (r) {
                if (r.result.code == 2000) {
                    $("#maskDiv").attr("class", "tip");
                    $(".share").hide();
                    $(".sharinfomation").show();
                    generatedShareUrl = basePath+"openAccount?shareId="+r.result.msg;
                    window.shareUrl = basePath+"openAccount?shareId="+r.result.msg;
                    console.debug("window.shareUrl:", window.shareUrl);
                    var customerName = '';
                    if(r.result.data){
                        customerName =checkFuXing(r.result.data.toString())+"先生/女士 ";
                    }else{
                        customerName='大圆君';
                    }
                    //分享给朋友
                    if(isWeixin()){
                        wx.onMenuShareAppMessage({
                            title:'${applicationScope['weixinDefaultShareTitle']}', // 分享标题
                            desc:customerName+"携手大圆普洱，赠您新股藏品，邀您增值财富", // 分享描述
                            link: window.shareUrl,
                            imgUrl: '${imgPath}${applicationScope['weixinDefaultShareIcon']}', // 分享图标
                            type: 'link', // 分享类型,music、video或link，不填默认为link
                            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
                            success: function () {
                                // 用户确认分享后执行的回调函数
                                successShare();
                            },
                            cancel: function () {
                                // 用户取消分享后执行的回调函数
                                closeShare();
                            }
                        });
                        //分享到朋友圈
                        wx.onMenuShareTimeline({
                            title: customerName+"携手大圆普洱，赠您新股藏品，邀您增值财富", // 分享标题
                            link: window.shareUrl,
                            imgUrl: '${imgPath}${applicationScope['weixinDefaultShareIcon']}', // 分享图标
                            success: function () {
                                // 用户确认分享后执行的回调函数
                                successShare();
                            },
                            cancel: function () {
                                // 用户取消分享后执行的回调函数
                                closeShare();
                            }
                        });

                        wx.onMenuShareQQ({
                            title: '${applicationScope['weixinDefaultShareTitle']}', // 分享标题
                            desc: customerName+"携手大圆普洱，赠您新股藏品，邀您增值财富", // 分享描述
                            link: window.shareUrl,
                            imgUrl: '${imgPath}${applicationScope['weixinDefaultShareIcon']}', // 分享图标
                            success: function () {
                                // 用户确认分享后执行的回调函数
                            },
                            cancel: function () {
                                // 用户取消分享后执行的回调函数
                            }
                        });

                        wx.onMenuShareWeibo({
                            title:  '${applicationScope['weixinDefaultShareTitle']}', // 分享标题
                            desc: customerName+"携手大圆普洱，赠您新股藏品，邀您增值财富", // 分享描述
                            link: window.shareUrl,
                            imgUrl: '${imgPath}${applicationScope['weixinDefaultShareIcon']}', // 分享图标
                            success: function () {
                                // 用户确认分享后执行的回调函数
                            },
                            cancel: function () {
                                // 用户取消分享后执行的回调函数
                            }
                        });

                        wx.onMenuShareQZone({
                            title: '${applicationScope['weixinDefaultShareTitle']}', // 分享标题
                            desc: customerName+"携手大圆普洱，赠您新股藏品，邀您增值财富", // 分享描述
                            link:  window.shareUrl,
                            imgUrl: '${imgPath}${applicationScope['weixinDefaultShareIcon']}', // 分享图标
                            success: function () {
                                // 用户确认分享后执行的回调函数
                            },
                            cancel: function () {
                                // 用户取消分享后执行的回调函数
                            }
                        });
                    }
                }
                if (r.result.code == 1000) {
                    $("#errorText").html(r.result.msg);
                    $("#blackbackground").show();
                    $(".error").show();
                }

            }
        });
    }

    function toOpenAccount() {
        window.location.href=basePath+"openAccount";
    }


    function shareinfomation(){
         $("#maskDiv").show();

    }

    //分享成功
    function successShare() {
        $("#maskDiv").css("display","none");
//        $(".share").html("您已成功分享！");
    }

    //取消分享
    function closeShare(){
        $("#maskDiv").css("display","none");
    }

    /*判断是不是微信浏览器*/
    function isWeixin(){
        var ua = navigator.userAgent.toLowerCase();
        if(ua.match(/MicroMessenger/i)=="micromessenger") {
            return true;
        } else {
            return false;
        }
    }


</script>
</body>
</html>
