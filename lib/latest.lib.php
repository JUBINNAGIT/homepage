<?php
if (!defined('_GNUBOARD_')) exit;

// 최신글 추출
// $cache_time 캐시 갱신시간
function latest($skin_dir='', $bo_table, $rows=10, $subject_len=40, $cache_time=1, $options='')
{
    global $g5;
    //static $css = array();

    if (!$skin_dir) $skin_dir = 'basic';

    $latest_skin_path = THEMES_PATH.'/'.G5_SKIN_DIR.'/latest/'.$skin_dir;
    $latest_skin_url  = THEMES_URL.'/'.G5_SKIN_DIR.'/latest/'.$skin_dir;

    $cache_fwrite = false;
    if(G5_USE_CACHE) {
        $cache_file = G5_DATA_PATH."/cache/latest-{$bo_table}-{$skin_dir}-{$rows}-{$subject_len}.php";

        if(!file_exists($cache_file)) {
            $cache_fwrite = true;
        } else {
            if($cache_time > 0) {
                $filetime = filemtime($cache_file);
                if($filetime && $filetime < (G5_SERVER_TIME - 3600 * $cache_time)) {
                    @unlink($cache_file);
                    $cache_fwrite = true;
                }
            }

            if(!$cache_fwrite)
                include($cache_file);
        }
    }

    if(!G5_USE_CACHE || $cache_fwrite) {
        $list = array();

        $sql = " select * from {$g5['board_table']} where bo_table = '{$bo_table}' ";
        $board = sql_fetch($sql);
        $bo_subject = get_text($board['bo_subject']);

        $tmp_write_table = $g5['write_prefix'] . $bo_table; // 게시판 테이블 전체이름
        $sql = " select * from {$tmp_write_table} where wr_is_comment = 0 order by wr_num limit 0, {$rows} ";
        $result = sql_query($sql);
        for ($i=0; $row = sql_fetch_array($result); $i++) {
            $list[$i] = get_list($row, $board, $latest_skin_url, $subject_len);
        }

        if($cache_fwrite) {
            $handle = fopen($cache_file, 'w');
            $cache_content = "<?php\nif (!defined('_GNUBOARD_')) exit;\n\$bo_subject='".$bo_subject."';\n\$list=".var_export($list, true)."?>";
            fwrite($handle, $cache_content);
            fclose($handle);
        }
    }

    /*
    // 같은 스킨은 .css 를 한번만 호출한다.
    if (!in_array($skin_dir, $css) && is_file($latest_skin_path.'/style.css')) {
        echo '<link rel="stylesheet" href="'.$latest_skin_url.'/style.css">';
        $css[] = $skin_dir;
    }
    */

    ob_start();
    include $latest_skin_path.'/latest.skin.php';
    $content = ob_get_contents();
    ob_end_clean();

    return $content;
}

// 최신글 겔러리
// $cache_time 캐시 갱신시간
function latest_gallery($skin_dir='', $offset=0, $rows=10, $subject_len=40, $cache_time=1, $options='')
{
    global $g5;
    //static $css = array();

    if (!$skin_dir) $skin_dir = 'basic';

    $latest_skin_path = THEMES_PATH.'/'.G5_SKIN_DIR.'/latest/'.$skin_dir;
    $latest_skin_url  = THEMES_URL.'/'.G5_SKIN_DIR.'/latest/'.$skin_dir;

    $cache_fwrite = false;
    if(G5_USE_CACHE) {
        $cache_file = G5_DATA_PATH."/cache/latest-gallery-{$skin_dir}-{$rows}-{$subject_len}.php";

        if(!file_exists($cache_file)) {
            $cache_fwrite = true;
        } else {
            if($cache_time > 0) {
                $filetime = filemtime($cache_file);
                if($filetime && $filetime < (G5_SERVER_TIME - 3600 * $cache_time)) {
                    @unlink($cache_file);
                    $cache_fwrite = true;
                }
            }

            if(!$cache_fwrite)
                include($cache_file);
        }
    }

    if(!G5_USE_CACHE || $cache_fwrite) {
        $lists = array();
        $sql = "select a.bo_table,bo_subject,wr_id,bf_file from `{$g5['board_table']}` a left join `{$g5['board_file_table']}` b on (a.bo_table=b.bo_table)
                    where a.bo_device <> 'mobile' and a.bo_skin = 'gallery'";
        $result = sql_query($sql);
        for ($i=0; $row=sql_fetch_array($result); $i++) {
            $list = array();
            $list['bo_table'] = $row['bo_table'];
            $list['bo_subject'] = $row['bo_subject'];
            $list['wr_id'] = $row['wr_id'];
            $list['bf_file'] = $row['bf_file'];
            $lists[$i] = $list;
        }

        if($cache_fwrite) {
            $handle = fopen($cache_file, 'w');
            $cache_content = "<?php\nif (!defined('_GNUBOARD_')) exit;\n\$lists=".var_export($lists, true)."?>";
            fwrite($handle, $cache_content);
            fclose($handle);
        }


    }

    /*
    // 같은 스킨은 .css 를 한번만 호출한다.
    if (!in_array($skin_dir, $css) && is_file($latest_skin_path.'/style.css')) {
        echo '<link rel="stylesheet" href="'.$latest_skin_url.'/style.css">';
        $css[] = $skin_dir;
    }
    */

    ob_start();
    include $latest_skin_path.'/latest_gallery.skin.php';
    $content = ob_get_contents();
    ob_end_clean();

    return $content;
}



?>
