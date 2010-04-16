<?
$body="Сообщение с сайта
ФИО: ".$name."
E-mail: ".$email."
Сообщение: ".$message;
@mail('design@logomotiv.ru','Сообщение с сайта: '.$theme,$body);
@mail('mk@logomotiv.ru','Сообщение с сайта: '.$theme,$body);
@mail('anshe@logomotiv.ru','Сообщение с сайта: '.$theme,$body);

header("Location: ..");
?>

