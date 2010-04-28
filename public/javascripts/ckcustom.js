/*
Copyright (c) 2003-2009, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
  config.PreserveSessionOnFileBrowser = true;
  // Define changes to default configuration here. For example:
  config.language = 'ru';
  config.uiColor = '#cecece';

  //config.ContextMenu = ['Generic','Anchor','Flash','Select','Textarea','Checkbox','Radio','TextField','HiddenField','ImageButton','Button','BulletedList','NumberedList','Table','Form'] ;
  
  config.height = '400px';
  config.width = '600px';
  
  //config.resize_enabled = false;
  //config.resize_maxHeight = 2000;
  //config.resize_maxWidth = 750;
  
  //config.startupFocus = true;	enterMode		: Number( document.getElementById( 'xEnter' ).value ),
//	shiftEnterMode	: Number( document.getElementById( 'xShiftEnter' ).value )
  config.enterMode = Number(2);
  config.shiftEnterMode = Number(1);
  
  // works only with en, ru, uk languages
  config.extraPlugins = "stylescombo";
  
  config.toolbar = 'Easy';
  
  config.toolbar_Easy =
    [
        ['Source','-','Preview','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord',],
        ['Maximize','-','About'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['StylesCombo','Styles','Format'],
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript', 'TextColor'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
        ['Image','Embed','Flash','Attachment','Table','HorizontalRule','Smiley','SpecialChar','PageBreak', 'Typograph']
    ];

   // config.toolbar = 'color';
    config.toolbar_color= [['Source'],['Styles'],['Format']];
    config.stylesCombo_stylesSet = 'my_styles';
	
};

CKEDITOR.addStylesSet( 'my_styles',
[
    // Block Styles

    // Inline Styles
    { name : 'Заголовок 1', element : 'h1', attributes: { 'class' : 'nil'} },
	{ name : 'Стиль 1', element : 'span', attributes: { 'class' : 'style1'} },
	{ name : 'Стиль 2', element : 'span', attributes: { 'class' : 'style2'} },
	{ name : 'Стиль 3', element : 'span', attributes: { 'class' : 'style3'} },
	{ name : 'Стиль 4', element : 'span', attributes: { 'class' : 'style4'} },
	{ name : 'Стиль 5', element : 'span', attributes: { 'class' : 'style5'} }
]);
