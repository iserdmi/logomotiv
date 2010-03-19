(function()
 {
 var pluginName = 'spoiler';
 // Регистрируем имя плагина .
 CKEDITOR.plugins.add( pluginName,
 {
 init : function( editor )
 {//Добавляем команду на нажатие кнопки
 editor.addCommand( pluginName,new CKEDITOR.dialogCommand( 'spoiler' ));
  //Указываем где скрипт окна диалога.

 // Добавляем кнопочку
 editor.ui.addButton( 'Spoiler',
 {
 label : 'Добавить Spoiler',//Title кнопки
 command : pluginName,
 icon : this.path + 'logo.gif'//Путь к иконке
 });
 }
 });
})();