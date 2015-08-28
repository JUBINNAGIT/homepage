<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가

// add_stylesheet('css 구문', 출력순서); 숫자가 작을 수록 먼저 출력됨
add_stylesheet('<link rel="stylesheet" href="'.$latest_skin_url.'/style.css">', 0);
?>

<?php

    for ($i=0; $i<count($lists); $i++) {

        echo "<a href=\"".G5_BBS_URL."/board.php?bo_table=".$lists[$i]['bo_table']."&wr_id=".$lists[$i]['wr_id']."\">";

        if($lists[$i]['bf_file']) {
            $path = G5_DATA_URL.'/file/'.$lists[$i]['bo_table'].'/'.$lists[$i]['bf_file'];
            $img_content = '<img src="'.$path.'">';
        }
        echo $img_content;
        echo "</a>";
    }
?>
