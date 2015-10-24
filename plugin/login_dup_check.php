<?php
if (!defined('_GNUBOARD_')) exit; // 개별 페이지 접근 불가

// ===========================================================
//	그누보드 G5 중복로그인 체크  v 0.1
//	Copyright(c) 2013 그누보드 닉 마스타 All rights reserved.
// ===========================================================

if ($member['mb_id']) {

	// 내 IP 가 아닌 다른 IP 에서 로그인 한 게 있는가?
	$tmp_sql = " select * from {$g5['login_table']} ";
	$tmp_sql .= "	where mb_id = '{$member['mb_id']}' and lo_ip <> '{$_SERVER['REMOTE_ADDR']}' ";
	$tmp_sql .= "	order by lo_datetime desc ";
	$tmp_row = sql_fetch($tmp_sql);

	if ($tmp_row['mb_id']) {
		// 다른 데서 로그인 된 정보가 있다..
		$tmp_ip_other = $tmp_row['lo_ip'];		// 로그인된 다른 곳의 IP

		// 여기 IP 에서의 로그인 정보는 지워버린다. => 활동하면 다시 생기므로 지워도 상관없다.
		sql_query(" delete from {$g5['login_table']} where mb_id = '{$member['mb_id']}' and lo_ip = '{$_SERVER['REMOTE_ADDR']}' ");

		echo "<script>alert('" . $tmp_ip_other . " 에서 로그인 된 정보가 있습니다.');</script>";
		echo "<script>location.href = '" . G5_BBS_URL ."/logout.php';</script>";

	}

}
?>
