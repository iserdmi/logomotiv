<?
$body="��������� � �����
���: ".$name."
E-mail: ".$email."
���������: ".$message;
@mail('design@logomotiv.ru','��������� � �����: '.$theme,$body);
@mail('mk@logomotiv.ru','��������� � �����: '.$theme,$body);
@mail('anshe@logomotiv.ru','��������� � �����: '.$theme,$body);

header("Location: ..");
?>

