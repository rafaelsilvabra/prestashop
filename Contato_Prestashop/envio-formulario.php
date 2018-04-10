<?php
//pego os dados enviados pelo formulario
$emailpara = "EMAIL 1 AQUI";
$emailcopia = "EMAIL 2 AQUI";
$assunto = $_POST["assunto_mensagem"];
$nome = $_POST["nome"];
$email = $_POST["email"];
$telefone = $_POST["telefone"];
$celular = $_POST["celular"];
$referencia = $_POST["referencia"];
$msg = $_POST["msg"];

$anexar = $_POST["anexar"];

//formato o campo da mensagem
$msg = wordwrap( $msg, 50, "
", 1);
//valido os emails
if (!ereg("^([0-9,a-z,A-Z]+)([.,_]([0-9,a-z,A-Z]+))*[@]([0-9,a-z,A-Z]+)([.,_,-]([0-9,a-z,A-Z]+))*[.]([0-9,a-z,A-Z]){2}([0-9,a-z,A-Z])?$", $emailpara)){
echo"<center>Digite um email valido</center>";
echo "<center><a href=\"http://SUA_URL_DA_PAGINA_DE_RETORNO\">Voltar</center></a>";
exit;
}
if (!ereg("^([0-9,a-z,A-Z]+)([.,_]([0-9,a-z,A-Z]+))*[@]([0-9,a-z,A-Z]+)([.,_,-]([0-9,a-z,A-Z]+))*[.]([0-9,a-z,A-Z]){2}([0-9,a-z,A-Z])?$", $email)){
echo "<center>Digite um email valido</center>";
echo "<center><a href=\"http://SUA_URL_DA_PAGINA_DE_RETORNO\"><center>Voltar</center></a>";
exit;
}
$arquivo = isset($_FILES["arquivo"]) ? $_FILES["arquivo"] : FALSE;
if(file_exists($arquivo["tmp_name"]) and !empty($arquivo)){
$fp = fopen($_FILES["arquivo"]["tmp_name"],"rb");
$anexo = fread($fp,filesize($_FILES["arquivo"]["tmp_name"]));
$anexo = base64_encode($anexo);
fclose($fp);
$anexo = chunk_split($anexo);
$boundary = "XYZ-" . date("dmYis") . "-ZYX";
$mens = "--$boundary\n";
$mens .= "Content-Transfer-Encoding: 8bits\n";
$mens .= "Content-type: text/html; charset=UTF-8\r\n";
$mens .= "<font size=5><b>Contato | Loja Virtual</b></font>\n<br><br>";
$mens .= "<font size=3><b>Nome do solicitante:</b> $nome\n<br>";
$mens .= "<b>E-mail:</b> $email\n<br>";
$mens .= "<b>Telefone:</b> $telefone\n<br>";
$mens .= "<b>Celular:</b> $celular\n<br>";
$mens .= "<b>Código Referência de produto:</b> $referencia\n<br>";
$mens .= "<b>Mensagem:</b> $msg\n</font>";
$mens .= "--$boundary\n";
$mens .= "Content-Type: ".$arquivo["type"]."\n";
$mens .= "Content-Disposition: attachment; filename=\"".$arquivo["name"]."\"\n";
$mens .= "Content-Transfer-Encoding: base64\n\n";
$mens .= "$anexo\n";
$mens .= "--$boundary--\r\n";
$headers = "MIME-Version: 1.0\n";
$headers .= "From: \"$nome\" <$email>\r\n";
$headers .= "Cc: $emailcopia\n";
$headers .= "Content-type: multipart/mixed; boundary=\"$boundary\"\r\n";
$headers .= "$boundary\n";
//envio o email com o anexo
mail($email,$assunto,$mens,$headers);
echo"<meta http-equiv='refresh' content='0; url=http://SUA_URL_DA_PAGINA_DE_RETORNO'>";
}
//se não tiver anexo repete os dados
else{
$boundary = "XYZ-" . date("dmYis") . "-ZYX";
$mens = "--$boundary\n";
$mens .= "Content-Transfer-Encoding: 8bits\n";
$mens .= "Content-type: text/html; charset=UTF-8\r\n";
$mens .= "<font size=5><b>Contato | Loja Virtual</b></font>\n<br><br>";
$mens .= "<b>Nome do solicitante:</b> $nome\n<br>";
$mens .= "<b>E-mail:</b> $email\n<br>";
$mens .= "<b>Telefone:</b> $telefone\n<br>";
$mens .= "<b>Celular:</b> $celular\n<br>";
$mens .= "<b>Código Referência de produto:</b> $referencia\n<br>";
$mens .= "<b>Mensagem:</b> $msg\n</font>";
$headers = "MIME-Version: 1.0\n";
$headers .= "From: \"$nome\" <$email>\r\n";
$headers .= "Cc: $emailcopia\n";
$headers .= "Content-type: multipart/mixed; boundary=\"$boundary\"\r\n";
$headers .= "Content-type: text/html; charset=utf-8\n";
$headers .= "$boundary\n";
//envio o email sem anexo
mail($emailpara,$assunto,$mens,$headers);
echo"<meta http-equiv='refresh' content='0; url=http://SUA_URL_DA_PAGINA_DE_RETORNO'>";
}
?>