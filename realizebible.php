<?php
define('_INDEX_', true);
include_once('./_common.php');

// 초기화면 파일 경로 지정 : 이 코드는 가능한 삭제하지 마십시오.
if ($config['cf_include_index'] && is_file(G5_PATH.'/'.$config['cf_include_index'])) {
    include_once(G5_PATH.'/'.$config['cf_include_index']);
    return; // 이 코드의 아래는 실행을 하지 않습니다.
}

if (G5_IS_MOBILE) {
    include_once(G5_MOBILE_PATH.'/index.php');
    return;
}

include_once(G5_PATH.'/head_.php');
add_stylesheet('<link rel="stylesheet" href="'.G5_CSS_URL.'/main.css">', 1);
?>

    <div id="logo">
        <img src="assets/img/logo.png">
    </div>
    <div class="menu_bar">
        <div class="church_wrap">
            <div class="church">교회소개</div>
        </div>
        <div class="service_wrap">
            <div class="service over">예배자료</div>
            <div class="service_video inactive">문서말씀</div>
            <div class="service_docu">영상말씀</div>
        </div>
        <div class="mission_wrap">
            <div class="mission">인터넷선교</div>
        </div>
            <div class="bible_wrap">
            <div class="bible">성경공부</div>
        </div>
        <div class="refer_wrap">
            <div class="refer_data">참고자료</div>
        </div>
        <div class="event_wrap">
            <div class="event_data">행사자료</div>
        </div>
    </div>
    
    <div class="design_shape">
        <div class="page">
        </div>
        <div class="btn">
        </div>
        <div class="visual_line">
        </div>
        <div class="shadow">
        </div>
        <div class="main_wrap">
            <div class="left"></div>
            <div class="right"></div>
            <div class="main"></div>
            <div class="line"></div>
        </div>
        <div class="gallery">
            <div class="title"></div>
            <div class="top_btn"></div>
            <ul class="imgWrap">
                <li class="img"></li>
                <li class="img"></li>
                <li class="img"></li>
                <li class="img"></li>
                <li class="img"></li>
                <li class="img"></li>
                <li class="img"></li>
                <li class="img"></li>
            </ul>
            <div class="bottom_btn"></div>
        </div>
    </div>
    <div class="latest_board">
        <!-- 최신글 시작  -->
<?php
        //  최신글
        $sql = " select bo_table
                    from `{$g5['board_table']}` a left join `{$g5['group_table']}` b on (a.gr_id=b.gr_id)
                    where a.bo_device <> 'mobile' ";
        if(!$is_admin)
            $sql .= " and a.bo_use_cert = '' ";
        $sql .= " order by b.gr_order, a.bo_order ";
        $result = sql_query($sql);
        for ($i=0; $row=sql_fetch_array($result); $i++) {
            if ($i%2==1) $lt_style = "margin-left:20px";
            else $lt_style = "";
?>
            <div style="float:left;<?php echo $lt_style ?>">
<?php
                // 이 함수가 바로 최신글을 추출하는 역할을 합니다.
                // 사용방법 : latest(스킨, 게시판아이디, 출력라인, 글자수);
                echo latest("basic", $row['bo_table'], 5, 25);
?>
            </div>
<?php
        }
?>
        <!--  최신글 끝 -->
    </div>
    
<?php
include_once('./_tail.php');
?>

