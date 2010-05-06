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
        $mail->From = 'robot@logomotiv.ru';      // от кого
        $mail->FromName = 'VIRTYOS';   // от кого
        //$mail->AddAddress('director@united-subaru.ru', ''); // кому - адрес, Имя
        $mail->AddAddress('katya@logomotiv.ru', ''); // кому - адрес, Имя
        //$mail->AddAddress('president@united-subaru.ru', ''); // кому - адрес, Имя
        $mail->IsHTML(true);        // выставляем формат письма HTML
        $mail->Subject = 'Заказ календаря';  // тема письма 
		
		foreach($_REQUEST as $k=>&$v){
		$v=iconv('UTF-8', 'CP1251', $v);
		}
		
		
	 $mess .= 'ФИО &nbsp;&nbsp; <b>'.$_REQUEST['fio'].'</b><br/>
	Телефон &nbsp;&nbsp; <b>'.$_REQUEST['phone'].'</b><br/>
	 Емейл &nbsp;&nbsp; <b>'.$_REQUEST['mail'].'</b><br/>
	 Тип календаря &nbsp;&nbsp; <b>'.$_REQUEST['type'].'</b><br/>
	Дизайн &nbsp;&nbsp; <b>'.nl2br($_REQUEST['design']).'</b><br/>
	Тираж &nbsp;&nbsp; <b>'.nl2br($_REQUEST['tir']).'</b><br/>
	Комментарии &nbsp;&nbsp; <b>'.nl2br($_REQUEST['text']).'</b><br/>

	 ';
 $mail->Body = $mess; 
 //echo 'sss';
 $mail->Send();
 
?>
