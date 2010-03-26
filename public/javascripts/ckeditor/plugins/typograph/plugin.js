/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.plugins.add( 'typograph',
{
	init : function( editor )
	{
		// Add the link and unlink buttons.
		editor.addCommand( 'typograph', new CKEDITOR.typographCommand() );
		
		editor.ui.addButton( 'Typograph',
			{
				label : editor.lang.unlink,
				command : 'typograph'
			} );
		

		// Add the CSS styles for anchor placeholders.
		editor.addCss(
			'img.cke_anchor' +
			'{' +
				'background-image: url(' + CKEDITOR.getUrl( this.path + 'images/anchor.gif' ) + ');' +
				'background-position: center center;' +
				'background-repeat: no-repeat;' +
				'border: 1px solid #a9a9a9;' +
				'width: 18px;' +
				'height: 18px;' +
			'}\n' +
			'a.cke_anchor' +
			'{' +
				'background-image: url(' + CKEDITOR.getUrl( this.path + 'images/anchor.gif' ) + ');' +
				'background-position: 0 center;' +
				'background-repeat: no-repeat;' +
				'border: 1px solid #a9a9a9;' +
				'padding-left: 18px;' +
			'}'
		   	);

		// Register selection change handler for the unlink button.
		 editor.on( 'selectionChange', function( evt )
			{
				/*
				 * Despite our initial hope, document.queryCommandEnabled() does not work
				 * for this in Firefox. So we must detect the state by element paths.
				 */
				var command = editor.getCommand( 'typograh' ),
					element = evt.data.path.lastElement.getAscendant( 'a', true );
				if ( element && element.getName() == 'a' && element.getAttribute( 'href' ) )
					command.setState( CKEDITOR.TRISTATE_OFF );
				else
					command.setState( CKEDITOR.TRISTATE_DISABLED );
			} );

		// If the "menu" plugin is loaded, register the menu items.
		if ( editor.addMenuItems )
		{
			editor.addMenuItems(
				{


					typograph :
					{
						label : editor.lang.unlink,
						command : 'typograph',
						group : 'link',
						order : 5
					}
				});
		}


	},

	afterInit : function( editor )
	{
		// Register a filter to displaying placeholders after mode change.

		var dataProcessor = editor.dataProcessor,
			dataFilter = dataProcessor && dataProcessor.dataFilter;

		if ( dataFilter )
		{
			dataFilter.addRules(
				{
					elements :
					{
						a : function( element )
						{
							var attributes = element.attributes;
							if ( attributes.name && !attributes.href )
								return editor.createFakeParserElement( element, 'cke_anchor', 'anchor' );
						}
					}
				});
		}
	},

	requires : [ 'fakeobjects' ]
} );

CKEDITOR.typographCommand = function(){};
CKEDITOR.typographCommand.prototype =
{
	/** @ignore */
	exec : function( editor )
	{
		
			alert(editor.document.getHtml());

			
	}
};

CKEDITOR.tools.extend( CKEDITOR.config,
{
	linkShowAdvancedTab : true,
	linkShowTargetTab : true
} );
