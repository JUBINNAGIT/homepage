
<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가

//include_once(G5_PATH.'/themes/basic/head.php');
include_once($themes_path.'/head.php');

?>
<div id="logo">
    <img src="../assets/img/logo.png">
</div>
<div id="board_line_01"></div>
<div id="board_line_02"></div>
<div id="board_line_03"></div>
<div id="board_img_02"></div>

    <div id="side_title"></div>
    <div id="side_sub_title"></div>
    <div id="side_top_line"></div>
    <div id="side_middle_line"></div>
    <div id="side_left_line"></div>
    <div id="side_right_line"></div>
    <div id="side_bg"></div>

<div id="container">
    <?php if ((!$bo_table || $w == 's' ) && !defined("_INDEX_")) { ?><div id="container_title"><?php echo $g5['title'] ?></div><?php } ?>
