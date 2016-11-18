<?php
define('_INDEX_', true);
include_once('./_common.php');

// 초기화면 파일 경로 지정 : 이 코드는 가능한 삭제하지 마십시오.
if ($config['cf_include_index'] && is_file(G5_PATH.'/'.$config['cf_include_index'])) {
    include_once(G5_PATH.'/'.$config['cf_include_index']);
    return; // 이 코드의 아래는 실행을 하지 않습니다.
}

if (G5_IS_MOBILE) {
    include_once($themes_path.'/index.php');
    return;
}

include_once($themes_path.'/head.php');
?>

    <div id="logo">
        <img src="assets/img/logo.png">
    </div>
    
    <div class="design_shape">
        <!--div class="subject">Realize<br><font style="color:black">Bible</font></div>
        <div class="subject_">놀라운 성경이야기</div-->
        <div class="page"></div>
        <div class="btn"></div>
        <div class="visual_line"></div>
        <div class="shadow"></div>

        <div class="main_wrap">
            <div class="left"></div>
            <div class="right"></div>
            <div class="main"></div>
            <div class="line"></div>
            <div class="Layer_100"></div>
        </div>
        <div class="gallery">
            <div class="title"></div>
            <div class="top_btn"></div>

            <div class="imgWrap">
        <!-- 겔러리 시작  -->
<?php
        $page_no = 0;
?>
                <div class="img" style="float:left;">
<?php
                echo latest_gallery($skin, $page_no, 8, 25);
?>
                </div>
            <div class="bottom_btn"></div>
        </div>
    </div>
        <!-- 겔러리 끝  -->

    <div class="latest_board">
        <!-- 최신글 시작  -->
<?php
        //  최신글
        $sql = " select bo_table
                    from `{$g5['board_table']}` a left join `{$g5['group_table']}` b on (a.gr_id=b.gr_id)
                    where a.bo_device <> 'mobile' and a.bo_read_level < 3";
        if(!$is_admin)
            $sql .= " and a.bo_use_cert = '' ";
        $sql .= " order by b.gr_order, a.bo_order ";
        $result = sql_query($sql);
        for ($i=0; $row=sql_fetch_array($result); $i++) {
            if ($row['bo_table'] == 'notics') {
                continue;
            }
?>
            <div style="float:left;">
<?php
                // 이 함수가 바로 최신글을 추출하는 역할을 합니다.
                // 사용방법 : latest(스킨, 게시판아이디, 출력라인, 글자수);
                echo latest($skin, $row['bo_table'], 5, 25);
?>
            </div>
<?php
        }
?>
        <!--  최신글 끝 -->
    </div>
    <div id="notics_board">
<?php
        echo latest($skin, 'notics', 5, 25);
?>
    </div>
<?php
$footerClass = "top";
include_once($themes_path.'/tail.php');
?>

