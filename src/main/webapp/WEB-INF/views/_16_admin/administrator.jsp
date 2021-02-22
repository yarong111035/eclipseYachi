<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理員首頁</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/_00_util/adminUtil/css/administrator.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/_00_util/adminUtil/css/normalize.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/_00_util/adminUtil/javascript/header.js"></script>
    
        <script>
        $(function () {
            
            /* hover事件切換 如果只寫一個方法  
               那鼠標經過和離開都會觸發這個方法 slideToggle
            */
            // $('.menu-box').hover(function(){
            //     $(this).children('ul').slideToggle();
            // })

            $('.tab-list a').hover(function(){
                /* 為匹配的當前元素切換 class css類別 */
                $(this).toggleClass('liColor');
                
                /* 拿到當前(this) a 的索引號 */
                index = $(this).index();

                /* 讓上面和下面相應的索引號 eq() 顯示內容 
                    其餘siblings() 隱藏起來 */
                $('.tab-panel').eq(index).stop().fadeIn('slow').show().siblings().hide();

            },function(){
                /* 第二個方法處理滑鼠移開事件 */
                $(this).removeClass('liColor');
                $('.tab-panel').hide();
            })

            $('.tab-panel').hover(function(){
                index = $(this).index();
                $(this).css('background-color','white').show();
                $('.tab-list a').eq(index).addClass('liColor');
            },function(){
                $(this).hide();
                $('.tab-list a').eq(index).removeClass('liColor');
            })

        });

    </script>
</head>
<body>

    <div class="administrator container">
        <div class="row">
            <aside class="col-4">
                <div class="function">
                    <!-- <h3>管理員</h3> -->
                    <div class="item">
                        <img src="https://picsum.photos/250/250" id="headImg">
                    </div>

                    <label for="file">
                        <i class="fas fa-image">
                            編輯頭貼
                            <input type="file" id="file" accept=".jpeg,.png" style="display: none;"
                            >
                        </i>
                    </label>

                    <div class="item">
                        <a href="administrator.html">
                            <button style="background:rgb(170, 192, 207);"><span>管理員首頁</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <button><span>商品維護</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="admin_activity.html">
                            <button ><span>平台優惠活動</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="admin_coupon.html">
                            <button><span>平台優惠券</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="admin_adinfo.html">
                            <button><span>廣告資訊</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="admin_chatroom.html">
                            <button><span>客服回應</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <button><span>審核商家</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="admin_announcement.html">
                            <button><span>公告</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <button><span>申訴單</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <button><span>基本資料</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <button><span>登出</span></button>
                        </a>
                    </div>
                </div>
            </aside>
            <main class="col-8">
                <div class="status">
                    <div class="status-nav">
                        <h3>平台優惠活動</h3>
                        <div class="space"></div>
                        <a href="#">readmore...</a>
                    </div>
                    <hr>
                    <div>
                        <a href="#">2020/08/09-2020/09/01 中元節活動，集點換旺旺</a><br>
                        <a href="#">2020/09/15-2020/10/01 慶中秋，月餅買十送一優惠券</a><br>
                        <a href="#">2020/11/11 1111購物節，集優惠券換老婆餅</a><br>
                        <a href="#">2020/10/28 慶萬聖節，帳號轉職魔法師</a><br>
                    </div>
                </div>
                <div class="status">
                    <div class="status-nav">
                        <h3>廣告資訊</h3>
                        <div class="space"></div>
                        <a href="#">readmore...</a>
                    </div>
                    <hr>
                    <div>
                        <a href="#">2020/08/09-2020/09/01 鎮瀾宮媽祖廟 水餃買十送十</a><br>
                        <a href="#">2020/08/09-2020/09/01 鎮瀾宮媽祖廟 消波塊買十送十</a><br>
                        <a href="#">2020/11/11-2020/12/12 鄭太吉有限公司 慶記買十送十</a><br>
                        <a href="#">2020/12/25 蕭家班有限公司 慶記買十送十</a><br>
                    </div>
                </div>
                <div class="status">
                    <div class="status-nav">
                        <h3>客服回應</h3>
                        <div class="space"></div>
                        <a href="#">readmore...</a>
                    </div>
                    <hr>
                    <div>
                        <a href="#">2020/08/09 23:59 sjw說:請問中元節活動什麼意思？消費亡者？好笑嗎？低級當有趣</a><br>
                        <a href="#">2020/09/15 23:59 sjw說:請問中秋節活動什麼意思？消費嫦娥？你把吳剛放在哪裡？低級當有趣</a><br>
                        <a href="#">2020/11/11 08:59 菜雞說:請問台積電可以買嗎？</a><br>
                        <a href="#">2021/03/31 10:00 總監說:看得出來有準備拉</a><br>
                    </div>
                </div>
                <div class="status">
                    <div class="status-nav">
                        <h3>審核商家</h3>
                        <div class="space"></div>
                        <a href="#">readmore...</a>
                    </div>
                    <hr>
                    <div>
                        <a href="#">2020/07/05 頤宮中餐廳Le Palais 申請店家</a><br>
                        <a href="#">2020/09/13 教父牛排 申請店家</a><br>
                        <a href="#">2020/10/10 鮨野村 申請店家</a><br>
                        <a href="#">2020/10/25 大腕燒肉專門店 申請店家</a><br>
                    </div>
                </div>
                <div class="status">
                    <div class="status-nav">
                        <h3>公告</h3>
                        <div class="space"></div>
                        <a href="#">readmore...</a>
                    </div>
                    <hr>
                    <div>
                        <a href="#">2020/07/05 饒河夜市 胡椒餅 成為Yachi店家</a><br>
                        <a href="#">2020/08/09 中原活動開始</a><br>
                        <a href="#">2020/08/29 遼寧夜市 客家湯圓 成為Yachi店家</a><br>
                        <a href="#">2020/10/01 師大夜市 我家牛排 已下架</a><br>
                    </div>
                </div>
                <div class="status">
                    <div class="status-nav">
                        <h3>申訴單</h3>
                        <div class="space"></div>
                        <a href="#">readmore...</a>
                    </div>
                    <hr>
                    <div>
                        <a href="#">2020/07/05 06:00 sjw用戶檢舉 yachi 性別欄無LGBTQ+可選擇</a><br>
                        <a href="#">2020/07/07 8:00 karen用戶檢舉 岡山羊肉爐教壞我家小孩</a><br>
                        <a href="#">2020/07/08 06:00 sjw用戶檢舉 川普 BLM</a><br>
                        <a href="#">2020/07/08 06:00 sjw用戶檢舉 拜登 老人失智</a><br>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>