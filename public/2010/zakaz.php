<?
  function reArrayFiles(&$file_post) {

    $file_ary = array();
    $file_count = count($file_post['name']);
    $file_keys = array_keys($file_post);

    for ($i=0; $i<$file_count; $i++) {
        foreach ($file_keys as $key) {
            $file_ary[$i][$key] = $file_post[$key][$i];
        }
    }

    return $file_ary;
}
  
       require 'class.phpmailer.php';
 
         $mail = new PHPMailer();
        $mail->From = 'robot@logomotiv.ru';      // �� ����
        $mail->FromName = 'VIRTYOS';   // �� ����
        //$mail->AddAddress('director@united-subaru.ru', ''); // ���� - �����, ���
        $mail->AddAddress('katya@logomotiv.ru', ''); // ���� - �����, ���
        //$mail->AddAddress('president@united-subaru.ru', ''); // ���� - �����, ���
        $mail->IsHTML(true);        // ���������� ������ ������ HTML
        $mail->Subject = '����� ���������';  // ���� ������ 
		
		foreach($_REQUEST as $k=>&$v){
		$v=iconv('UTF-8', 'CP1251', $v);
		}
		
		
	 $mess .= '��� &nbsp;&nbsp; <b>'.$_REQUEST['fio'].'</b><br/>
	������� &nbsp;&nbsp; <b>'.$_REQUEST['phone'].'</b><br/>
	 ����� &nbsp;&nbsp; <b>'.$_REQUEST['mail'].'</b><br/>
	 ��� ��������� &nbsp;&nbsp; <b>'.$_REQUEST['type'].'</b><br/>
	������ &nbsp;&nbsp; <b>'.nl2br($_REQUEST['design']).'</b><br/>
	����� &nbsp;&nbsp; <b>'.nl2br($_REQUEST['tir']).'</b><br/>
	����������� &nbsp;&nbsp; <b>'.nl2br($_REQUEST['text']).'</b><br/>

	 ';
 $mail->Body = $mess; 
 //echo 'sss';
 $mail->Send();
 
?>
