<?php
if (!defined("_GNUBOARD_")) exit; // 개별 페이지 접근 불가
include_once(G5_LIB_PATH.'/thumbnail.lib.php');

// add_stylesheet('css 구문', 출력순서); 숫자가 작을 수록 먼저 출력됨
add_stylesheet('<link rel="stylesheet" href="'.$board_skin_url.'/style.css">', 0);
?>

<script src="<?php echo G5_JS_URL; ?>/viewimageresize.js"></script>

<?php 
$v_width = '670';   // 동영상 넓이 지정
$v_height = '377';  // 동영상 높이 지정
?>

<!-- video-js -->
<link href="<?php echo $board_skin_url ?>/video-js/video-js.css" rel="stylesheet">
<script src="<?php echo $board_skin_url ?>/video-js/video.js"></script>
<script src="<?php echo $board_skin_url ?>/video-js/jwplayer.js"></script>
<!--
<script src="<?php echo $board_skin_url ?>/video-js/swfobject.js"></script>
<script src="<?php echo $board_skin_url ?>/video-js/hdwplayer.js"></script>
-->
<script>
  videojs.options.flash.swf = "<?php echo $board_skin_url ?>/video-js/video-js.swf";
</script>
<!-- video-js end -->


<!-- 게시물 읽기 시작 { -->
<div id="bo_v_table"><?php echo $board['bo_subject']; ?></div>

<article id="bo_v" style="width:<?php echo $width; ?>">
    <header>
        <h1 id="bo_v_title">
            <?php
            if ($category_name) echo $view['ca_name'].' | '; // 분류 출력 끝
            echo cut_str(get_text($view['wr_subject']), 70); // 글제목 출력
            ?>
        </h1>
    </header>

    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        작성자 <strong><?php echo $view['name'] ?><?php if ($is_ip_view) { echo "&nbsp;($ip)"; } ?></strong>
        <span class="sound_only">작성일</span><strong><?php echo date("y-m-d H:i", strtotime($view['wr_datetime'])) ?></strong>
        조회<strong><?php echo number_format($view['wr_hit']) ?>회</strong>
        댓글<strong><?php echo number_format($view['wr_comment']) ?>건</strong>
    </section>

    <?php
    if ($view['file']['count']) {
        $cnt = 0;
        for ($i=0; $i<count($view['file']); $i++) {
            if (isset($view['file'][$i]['source']) && $view['file'][$i]['source'] && !$view['file'][$i]['view'])
                $cnt++;
        }
    }
     ?>

    <?php if($cnt) { ?>
    <!-- 첨부파일 시작 { -->
    <section id="bo_v_file">
        <h2>첨부파일</h2>
        <ul>
        <?php
        // 가변 파일
        for ($i=0; $i<count($view['file']); $i++) {
            if (isset($view['file'][$i]['source']) && $view['file'][$i]['source'] && !$view['file'][$i]['view']) {
         ?>
            <li>
                <a href="<?php echo $view['file'][$i]['href'];  ?>" class="view_file_download">
                    <img src="<?php echo $board_skin_url ?>/img/icon_file.gif" alt="첨부">
                    <strong><?php echo $view['file'][$i]['source'] ?></strong>
                    <?php echo $view['file'][$i]['bf_content'] ?> (<?php echo $view['file'][$i]['size'] ?>)
                </a>
                <span class="bo_v_file_cnt"><?php echo $view['file'][$i]['download'] ?>회 다운로드</span>
                <span>DATE : <?php echo $view['file'][$i]['datetime'] ?></span>
            </li>
        <?php
            }
        }
         ?>
        </ul>
    </section>
    <!-- } 첨부파일 끝 -->
    <?php } ?>

    <?php
    if (implode('', $view['link'])) {
     ?>
     <!-- 관련링크 시작 { -->
    <section id="bo_v_link">
        <h2>관련링크</h2>
        <ul>
        <?php
        // 링크
        $cnt = 0;
        for ($i=1; $i<=count($view['link']); $i++) {
            if ($view['link'][$i]) {
                $cnt++;
                $link = cut_str($view['link'][$i], 70);
         ?>
            <li>
                <a href="<?php echo $view['link_href'][$i] ?>" target="_blank">
                    <img src="<?php echo $board_skin_url ?>/img/icon_link.gif" alt="관련링크">
                    <strong><?php echo $link ?></strong>
                </a>
                <span class="bo_v_link_cnt"><?php echo $view['link_hit'][$i] ?>회 연결</span>
            </li>
        <?php
            }
        }
         ?>
        </ul>
    </section>
    <!-- } 관련링크 끝 -->
    <?php } ?>

    <!-- 게시물 상단 버튼 시작 { -->
    <div id="bo_v_top">
        <?php
        ob_start();
         ?>
        <?php if ($prev_href || $next_href) { ?>
        <ul class="bo_v_nb">
            <?php if ($prev_href) { ?><li><a href="<?php echo $prev_href ?>" class="btn_b01">이전글</a></li><?php } ?>
            <?php if ($next_href) { ?><li><a href="<?php echo $next_href ?>" class="btn_b01">다음글</a></li><?php } ?>
        </ul>
        <?php } ?>

        <ul class="bo_v_com">
            <?php if ($update_href) { ?><li><a href="<?php echo $update_href ?>" class="btn_b01">수정</a></li><?php } ?>
            <?php if ($delete_href) { ?><li><a href="<?php echo $delete_href ?>" class="btn_b01" onclick="del(this.href); return false;">삭제</a></li><?php } ?>
            <?php if ($copy_href) { ?><li><a href="<?php echo $copy_href ?>" class="btn_admin" onclick="board_move(this.href); return false;">복사</a></li><?php } ?>
            <?php if ($move_href) { ?><li><a href="<?php echo $move_href ?>" class="btn_admin" onclick="board_move(this.href); return false;">이동</a></li><?php } ?>
            <?php if ($search_href) { ?><li><a href="<?php echo $search_href ?>" class="btn_b01">검색</a></li><?php } ?>
            <li><a href="<?php echo $list_href ?>" class="btn_b01">목록</a></li>
            <?php if ($reply_href) { ?><li><a href="<?php echo $reply_href ?>" class="btn_b01">답변</a></li><?php } ?>
            <?php if ($write_href) { ?><li><a href="<?php echo $write_href ?>" class="btn_b02">글쓰기</a></li><?php } ?>
        </ul>
        <?php
        $link_buttons = ob_get_contents();
        ob_end_flush();
         ?>
    </div>
    <!-- } 게시물 상단 버튼 끝 -->

    <section id="bo_v_atc">
        <h2 id="bo_v_atc_title">본문</h2>

        <?php
        // 파일 출력
        $v_img_count = count($view['file']);
        if($v_img_count) {
            echo "<div id=\"bo_v_img\">\n";

            // 첫번째 이미지 출력안함 $i=0 --> $i=1
            for ($i=1; $i<=count($view['file']); $i++) {
                if ($view['file'][$i]['view']) {
                    //echo $view['file'][$i]['view'];
                    echo get_view_thumbnail($view['file'][$i]['view']);
                }
            }

            echo "</div>\n";
        }
         ?>

		<!-- video start -->
		<!-- youtube -->
		<?php if($view[wr_1]){ ?>
		<div style="margin:0 0 10px 0;"> 
			<iframe width="<?php echo $v_width?>" height="<?php echo $v_height?>" src="http://www.youtube.com/embed/<?php echo $view[wr_1]?>?feature=player_embedded" frameborder="0" allowfullscreen></iframe>
		</div>
		<?php } ?>

		<!-- vimeo -->
		<?php if($view[wr_2]){ ?>
		<div style="margin:0 0 10px 0;">
			<iframe src="//player.vimeo.com/video/<?php echo $view[wr_2]?>" width="<?php echo $v_width?>" height="<?php echo $v_height?>" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
		</div>
		<?php } ?>

		<!-- source code -->
		<?php if($view[wr_3]){ ?>
			<?php echo $view['wr_3']; ?>
		<?php } ?>

		<!-- 링크 동영상 video-js로 실행 -->
		<?php 
		if($view[wr_4]){ 
			if ($view[file][0][file]) {  // 첨부파일1(썸네일이미지) 있는 경우
				$v_logo = G5_URL."/data/file/".$bo_table."/".$view[file][0][file];
			} else { 
				$v_logo = $board_skin_url."/video-js/logo.jpg";
			}
		?>
			<video id="video_link" class="video-js vjs-default-skin" controls preload="none" width="<?php echo $v_width?>" height="<?php echo $v_height?>" poster="<?php echo $v_logo?>" data-setup="{}">
			<source src="<?php echo $view['wr_4']?>" type='video/mp4' />
			</video>
		<?php } ?>

		<!-- 링크 동영상 video-js로 실행 rtmp -->

		<?php 
		if($view[wr_5]){ 
			if ($view[file][0][file]) {  // 첨부파일1(썸네일이미지) 있는 경우
				$v_logo = G5_URL."/data/file/".$bo_table."/".$view[file][0][file];
			} else { 
				$v_logo = $board_skin_url."/video-js/logo.jpg";
			}
		?>
            <!--
		<div id='video_link_rtmp'>This text will be replaced</div>
		<script type='text/javascript'>
			var so = new SWFObject('<?php echo $board_skin_url."/video-js/player.swf"?>','ply','<?php echo $v_width?>','<?php echo $v_height?>','9','#000000');
			so.addParam('allowfullscreen','true');
			so.addParam('allowscriptaccess','always');
			so.addParam('wmode','opaque');
			so.addVariable('file','<?php echo $view[wr_5]?>');
			so.addVariable('streamer','rtmp://106.245.233.50');
			so.write('video_link_rtmp');
		</script>
            -->

            <div id='video_link_rtmp'>This text will be replaced</div>
            <script type='text/javascript'>
                jwplayer("video_link_rtmp").setup({
                    playlist: [{
                        image: "<?php echo $v_logo?>",
                        sources: [{ 
                            file: "rtmp://106.245.233.50/<?php echo $view['wr_5']?>"
                        }]
                    }],
                    height: <?php echo $v_height?>,
                    primary: "flash",
                    width: <?php echo $v_width?>
                });
            </script>

            <!--
            <div id='video_link_rtmp'>This text will be replaced</div>
            <script type='text/javascript'>
                hdwplayer({ 
                    id       : 'video_link_rtmp',
                    swf      : '<?php echo $board_skin_url."/video-js/hdwplayer.swf"?>',
                    width    : '630',
                    height   : '360',
                    type     : 'rtmp',
                    streamer : 'rtmp://106.245.233.50/',
                    video    : '<?php echo $view['wr_5']?>',
                    rtsp     : '',
                    hls      : '',
                    preview  : '<?php echo $v_logo?>',
                    license  : '',
                    logo     : '<?php echo $v_logo?>',
                    autoStart: 'false'
                });     
            </script>
            -->

		<?php } ?>

		<!-- 업로드 동영상 video-js로 실행 -->
		<?php 
		if($view[file][1][file]){
			if ($view[file][0][file]) {  // 첨부파일1(썸네일이미지) 있는 경우
				$v_logo = G5_URL."/data/file/".$bo_table."/".$view[file][0][file];
			} else { 
				$v_logo = $board_skin_url."/video-js/logo.jpg";
			}
		?>
			<video id="video_upload" class="video-js vjs-default-skin" controls preload="none" width="<?php echo $v_width?>" height="<?php echo $v_height?>" poster="<?php echo $v_logo?>" data-setup="{}">
			<source src="<?=G5_URL."/data/file/".$bo_table."/".$view[file][1][file]?>" type='video/mp4' />
			</video>
		<?php } ?>

		<!-- video end -->



        <!-- 본문 내용 시작 { -->
        <div id="bo_v_con"><?php echo get_view_thumbnail($view['content']); ?></div>
        <?php//echo $view['rich_content']; // {이미지:0} 과 같은 코드를 사용할 경우 ?>
        <!-- } 본문 내용 끝 -->

        <?php if ($is_signature) { ?><p><?php echo $signature ?></p><?php } ?>

        <!-- 스크랩 추천 비추천 시작 { -->
        <?php if ($scrap_href || $good_href || $nogood_href) { ?>
        <div id="bo_v_act">
            <?php if ($scrap_href) { ?><a href="<?php echo $scrap_href;  ?>" target="_blank" class="btn_b01" onclick="win_scrap(this.href); return false;">스크랩</a><?php } ?>
            <?php if ($good_href) { ?>
            <span class="bo_v_act_gng">
                <a href="<?php echo $good_href.'&amp;'.$qstr ?>" id="good_button" class="btn_b01">추천 <strong><?php echo number_format($view['wr_good']) ?></strong></a>
                <b id="bo_v_act_good"></b>
            </span>
            <?php } ?>
            <?php if ($nogood_href) { ?>
            <span class="bo_v_act_gng">
                <a href="<?php echo $nogood_href.'&amp;'.$qstr ?>" id="nogood_button" class="btn_b01">비추천  <strong><?php echo number_format($view['wr_nogood']) ?></strong></a>
                <b id="bo_v_act_nogood"></b>
            </span>
            <?php } ?>
        </div>
        <?php } else {
            if($board['bo_use_good'] || $board['bo_use_nogood']) {
        ?>
        <div id="bo_v_act">
            <?php if($board['bo_use_good']) { ?><span>추천 <strong><?php echo number_format($view['wr_good']) ?></strong></span><?php } ?>
            <?php if($board['bo_use_nogood']) { ?><span>비추천 <strong><?php echo number_format($view['wr_nogood']) ?></strong></span><?php } ?>
        </div>
        <?php
            }
        }
        ?>
        <!-- } 스크랩 추천 비추천 끝 -->
    </section>

    <?php
    include_once(G5_SNS_PATH."/view.sns.skin.php");
    ?>

    <?php
    // 코멘트 입출력
    include_once('./view_comment.php');
     ?>

    <!-- 링크 버튼 시작 { -->
    <div id="bo_v_bot">
        <?php echo $link_buttons ?>
    </div>
    <!-- } 링크 버튼 끝 -->

</article>
<!-- } 게시판 읽기 끝 -->

<script>
<?php if ($board['bo_download_point'] < 0) { ?>
$(function() {
    $("a.view_file_download").click(function() {
        if(!g5_is_member) {
            alert("다운로드 권한이 없습니다.\n회원이시라면 로그인 후 이용해 보십시오.");
            return false;
        }

        var msg = "파일을 다운로드 하시면 포인트가 차감(<?php echo number_format($board['bo_download_point']) ?>점)됩니다.\n\n포인트는 게시물당 한번만 차감되며 다음에 다시 다운로드 하셔도 중복하여 차감하지 않습니다.\n\n그래도 다운로드 하시겠습니까?";

        if(confirm(msg)) {
            var href = $(this).attr("href")+"&js=on";
            $(this).attr("href", href);

            return true;
        } else {
            return false;
        }
    });
});
<?php } ?>

function board_move(href)
{
    window.open(href, "boardmove", "left=50, top=50, width=500, height=550, scrollbars=1");
}
</script>

<script>
$(function() {
    $("a.view_image").click(function() {
        window.open(this.href, "large_image", "location=yes,links=no,toolbar=no,top=10,left=10,width=10,height=10,resizable=yes,scrollbars=no,status=no");
        return false;
    });

    // 추천, 비추천
    $("#good_button, #nogood_button").click(function() {
        var $tx;
        if(this.id == "good_button")
            $tx = $("#bo_v_act_good");
        else
            $tx = $("#bo_v_act_nogood");

        excute_good(this.href, $(this), $tx);
        return false;
    });

    // 이미지 리사이즈
    $("#bo_v_atc").viewimageresize();
});

function excute_good(href, $el, $tx)
{
    $.post(
        href,
        { js: "on" },
        function(data) {
            if(data.error) {
                alert(data.error);
                return false;
            }

            if(data.count) {
                $el.find("strong").text(number_format(String(data.count)));
                if($tx.attr("id").search("nogood") > -1) {
                    $tx.text("이 글을 비추천하셨습니다.");
                    $tx.fadeIn(200).delay(2500).fadeOut(200);
                } else {
                    $tx.text("이 글을 추천하셨습니다.");
                    $tx.fadeIn(200).delay(2500).fadeOut(200);
                }
            }
        }, "json"
    );
}
</script>
<!-- } 게시글 읽기 끝 -->