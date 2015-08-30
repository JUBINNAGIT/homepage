<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가

// 하단 파일 경로 지정 : 이 코드는 가능한 삭제하지 마십시오.
if ($config['cf_include_tail'] && is_file(G5_PATH.'/'.$config['cf_include_tail'])) {
    include_once(G5_PATH.'/'.$config['cf_include_tail']);
    return; // 이 코드의 아래는 실행을 하지 않습니다.
}

if (G5_IS_MOBILE) {
    include_once(G5_MOBILE_PATH.'/tail.php');
    return;
}
?>
    </div>
</div>

<!-- } 콘텐츠 끝 -->

<hr>

<!-- 하단 시작 { -->
<div id="footer">
    <div id="footer_logo" class="float"><img src="assets/img/footer_logo.png"></div><div id="footer_shape" class="float"></div>
    <div id="footer_right" class="float">
        <div id="footer_top">
            <div id="footer_intro" class="float"><a href="<?php echo G5_BBS_URL; ?>/content.php?co_id=intro">소계</a></div><div id="footer_shape1" class="float"></div>
            <div id="footer_agree" class="float"><a href="<?php echo G5_BBS_URL; ?>/content.php?co_id=privacy">개인정보취급</a></div><div id="footer_shape2" class="float"></div>
            <div id="footer_lisence" class="float"><a href="<?php echo G5_BBS_URL; ?>/content.php?co_id=provision">이용약관</a></div><div id="footer_shape3" class="float"></div>
            <div id="footer_question" class="float">문의</div><div id="footer_shape4" class="float"></div>
            <div id="footer_find" class="float">찾아오시는길</div>
        </div>
        <div id="footer_bottom">
            <div id="footer_address">부천시 원미구 중동. 신중동역 부근</div>
        </div>
    </div>
</div>
<!-- } 하단 끝 -->

<script>
$(function() {
    // 폰트 리사이즈 쿠키있으면 실행
    font_resize("container", get_cookie("ck_font_resize_rmv_class"), get_cookie("ck_font_resize_add_class"));
});
</script>

<?php
include_once($themes_path."/tail.sub.php");
?>