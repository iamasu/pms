/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function(config) {
    // Define changes to default configuration here. For example:
    config.language = 'en';
    config.uiColor = '#F4F4F4';
    config.height = 60;
    config.resize_minHeight = 50;
    config.resize_maxHeight = 200;
    config.resize_minWidth = 500;
    config.resize_dir = 'vertical';
    config.toolbarLocation = 'bottom';
    config.toolbarCanCollapse = false;
    config.toolbar = [
        {name: 'addPhoto', items: ['addPhoto']},
        {name: 'insert', items: ['Smiley']},
        {name: 'document', items: ['Save']}
    ];
    // The toolbar groups arrangement, optimized for two toolbar rows.

    // Remove some buttons provided by the standard plugins, which are
    // not needed in the Standard(s) toolbar.
    config.removeButtons = 'Underline,Subscript,Superscript,Image,IFrame';
    config.fillEmptyBlocks = false;
    config.ignoreEmptyParagraph = true;
    config.enterMode = 2;
    config.forceEnterMode = false;
    config.shiftEnterMode = 1;
    // Set the most common block elements.
    config.format_tags = 'p;h1;h2;h3;pre';
    config.removePlugins = 'autogrow,elementspath';
    // Simplify the dialog windows.
    config.removeDialogTabs = 'image:advanced;link:advanced';
    config.extraAllowedContent = 'a[!href,document-href]';
    config.extraPlugins = 'addPhoto';
    config.resize_enabled = true;
    config.autoGrow_onStartup = true;
    config.autoGrow_minHeight = 250;
    config.autoGrow_maxHeight = 600;
};
