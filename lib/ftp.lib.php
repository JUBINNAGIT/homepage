
<!--  
	ftp를 이용해 업로드 할 원본 파일의 경로입니다. ftp 계정이 test01이고 
    업로드 할 파일이 존재하는 계정의 디렉토리 구조가 /home/test01/html/thumb_img 일 

    경우 아래와 같이 경로를 잡습니다. */

    $file_path = "/home/test01/html/thumb_img/"; //파일의 경로

    $file_name = "thumb_empty.jpg"; // 파일명

        

    // ftp 업로드 함수 호출
    ftp_upload($file_path,$file_name);

 
 -->

<?

// ftp 파일 업로드 함수입니다.
function ftp_upload($file_path,$file_name){

    $ftp_host = "test02.net";   // ftp host명 
    $ftp_id = "test02";         // ftp 아이디
    $ftp_pw = "**********";  // ftp 비밀번호 
    $ftp_port = "21";           // ftp 포트

 

    /* 파일이 저장될 경로입니다. 예를들면 ftp 계정이 test02이고 계정의 디렉토리 구조가 

	/home/test02/html/thumb_img 일 경우

	아래와 같이 경로를 잡습니다. */

    $server_path = "/html/thumb_img/"; 


    if(!($fc = ftp_connect($ftp_host, $ftp_port))) die("$ftp_host : $ftp_port - 연결에 실패하였습니다.");   
    if(!ftp_login($fc, $ftp_id, $ftp_pw)) die("$ftp_id - 로그인에 실패하였습니다.");   

    ftp_chdir($fc, $server_path);   

	$source_file = $file_path ."/" . $file_name;
    $destination_file = $file_name;
 

    if(!ftp_put($fc, $destination_file, $source_file, FTP_BINARY))   
    {   
    	echo" <script> window.alert ('파일을 지정한 디렉토리로 복사 하는 데 실패했습니다.');</script>";      
		exit;
    }   

    ftp_quit($fc);  
}


// ftp 파일 삭제 함수입니다.
function ftp_file_delete($file_name){

 

    $ftp_host = "test02.net";    // ftp host명 
    $ftp_id = "test02";           // ftp 아이디
	$ftp_pw = "**********";   // ftp 비밀번호 
	$ftp_port = "21";            // ftp 포트
	   

    if(!($fc = ftp_connect($ftp_host, $ftp_port))) die("$server_host : $server_post - 연결에 실패하였습니다.");   

    if(!ftp_login($fc, $ftp_id, $ftp_pw)) die("$server_id - 로그인에 실패하였습니다.");   

    $server_path = "/html/thumb_img/"; 

    ftp_chdir($fc, $server_path);   
    $res = ftp_size($fc, $file_name);

    if ($res != -1) {
        if(!ftp_delete($fc, $file_name))   
        {   
	        echo" <script> window.alert ('파일을 지정한 디렉토리에서 삭제 하는 데 실패했습니다._1');</script>";      
		    exit;       
		}
    }

    ftp_quit($fc);  

}

?>