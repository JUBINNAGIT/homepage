<?php
define('_INDEX_', true);
include_once($themes_path.'/_head.php');
?>

<h2 class="sound_only">최신글</h2>
<!-- 최신글 시작 { -->
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
<!-- } 최신글 끝 -->

<?php
include_once($themes_path.'/_tail.php');
?>
