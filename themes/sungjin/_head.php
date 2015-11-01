
<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가

//include_once(G5_PATH.'/themes/basic/head.php');
include_once($themes_path.'/head.php');

?>
<div id="logo">
    <a href="<?php echo G5_URL ?>" target="_self"><img src="../assets/img/logo.png"/></a>
</div>
<div id="board_line_01"></div>
<div id="board_line_02"></div>
<div id="board_line_03"></div>
<div id="board_img_02"></div>

    <?php
    if ((!$bo_table || $w == 's' ) && !defined("_INDEX_")) {
    	$sub_title=$g5['title']; 
    } else {
    	$sub_title=$board['bo_subject'];
    } ?>
    <div id="side_title"><?php  echo ($me_name) ? $me_name  : $board['bo_subject']; ?></div>
    <div id="side_sub_title">
        <ul>
        <?php 
        $len = count($menu[$me_name]);
        for ($i=0; $i<$len; $i++) {
        ?>
            <li><a href="<?php echo $menu[$me_name][$i]['me_link'].'&me_name='.urlencode($me_name);?>"><?php echo $menu[$me_name][$i]['me_name']; ?></a></li>
        <?php } ?>
        </ul>
    </div>
    <div id="side_top_line"></div>
    <div id="side_middle_line"></div>
    <div id="side_left_line"></div>
    <div id="side_right_line"></div>
    <div id="side_bg"></div>

<div id="container">
