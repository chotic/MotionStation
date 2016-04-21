function rg_dialog( action, ids, format )
% RG  This is the book generator for Stateflow
% supported format is Postscript and PDF
%   $Revision: 1.19.2.3 $ $Date: 2004/04/15 00:59:08 $

%   Vladimir Kolesnikov
%   Jay R. Torgerson
%   Copyright 1995-2004 The MathWorks, Inc.


switch action,
	case 'construct',
		%
		% See if my window already exists. if it does, return
		%
		fig = findobj( 'Tag', 'SFRGDialogFig' );
		if ~isempty( fig ) figure( fig ); return; end
		coeff = 0.65;
		chartName = sf( 'get', ids, '.name' );
		chartName = chartName( 1, : );

		% replace newline chars with spaces
		i = find(chartName==10);
		if ~isempty(i), chartName(i) = ''; end

		machine = sf( 'get', ids, '.machine' );
		machine = machine(1);
		machineName = sf( 'get', machine, '.name' );
		%position the dialog in the center of the screen
		scrUnits =get(0,'Units');
		set(0,'Units','character');
		scr = get(0,'ScreenSize');
		figPosition = [ 0 0 100 20 ] * coeff;
		figPosition(1:2) = scr(1:2)+(scr(3:4)-figPosition(3:4))/2;
		set(0,'Units',scrUnits);

		dialogFig = figure( ...
			'Interruptible','on', ...
	   	'Color', [.76 .76 .76], ...
 	 	 	'Units', 'character', ...
   		'Position',figPosition, ...
   		'Tag','SFRGDialogFig', ...
         'numbertitle','off', ...
  			'Interruptible','on', ...
			'name','Stateflow Print Book Dialog', ...
			'menu','none', ...
			'toolbar', 'none', ...
			'UserData', {ids, format}, ...
			'DoubleBuffer', 'on', ...
			'Resize','off');

		printButt = uicontrol('Parent',dialogFig, ...
			'Units','character', ...
			'callback','sf(''Private'', ''rg_dialog'', ''print'');', ...
			'Enable','on', ...
			'Interruptible','on', ...
			'Position',[54 1.6 13 2.6]*coeff, ...
			'String','Print', ...
			'Tag','printButton');

		cancelButt = uicontrol('Parent',dialogFig, ...
			'Units','character', ...
			'callback','sf(''Private'', ''rg_dialog'', ''cancel'');', ...
			'Enable','on', ...
			'Interruptible','on', ...
			'Position',[69 1.6 13 2.6]*coeff, ...
			'String','Cancel', ...
			'Tag','cancelButton');

		helpButt = uicontrol('Parent',dialogFig, ...
			'Units','character', ...
			'callback','sfhelp;', ...
			'Enable','on', ...
			'Interruptible','on', ...
			'Position',[84 1.6 13 2.6]*coeff, ...
			'String','Help', ...
			'Tag','helpButton');

		printToFrame = uicontrol('Parent',dialogFig, ...
			'Units','character', ...
			'Enable','off', ...
			'Interruptible','on', ...
			'Position',[10 5 86 5.4]*coeff, ...
			'Style', 'frame', ...
			'Tag','printToFrame');

		printToTXT = uicontrol('Parent',dialogFig, ...
			'Units','character', ...
			'Enable','on', ...
			'Interruptible','on', ...
			'Position',[18 9 20 2]*coeff, ...
			'HorizontalAlignment', 'left', ...
			'String','  Print To:', ...
			'Style', 'text', ...
			'Tag','printToTXT');


		printPrinterRadioBtn = uicontrol('Parent',dialogFig, ...
			'Units','character', ...
			'Enable','on', ...
			'Interruptible','on', ...
			'Position',[15 6.4 25 2]*coeff, ...
			'String','Printer', ...
			'callback','sf(''Private'', ''rg_dialog'', ''print_to'', ''printer'');', ...
			'Max', 1, ...
			'Min', 0, ...
			'Value', 0, ...
			'Style', 'radiobutton', ...
			'Tag','printPrinterRadioButton');

		printPSRadioBtn = uicontrol('Parent',dialogFig, ...
			'Units','character', ...
			'Enable','on', ...
			'Interruptible','on', ...
			'Position',[42 6.4 25 2]*coeff, ...
			'String','PS', ...
			'callback','sf(''Private'', ''rg_dialog'', ''print_to'', ''ps'');', ...
			'Max', 1, ...
			'Min', 0, ...
			'Value', 0, ...
			'Style', 'radiobutton', ...
			'Tag','printPSRadioButton');

      lang = get(0,'language' );
      % for the purposes of determining if machine is japanese, this will do
      if length( lang ) < 2, lang = '???'; end
      if strcmp( [computer lang(1:2)], 'PCWINja' )
         pdfString = 'PDFWithJapanese';
         pdfXPos = 65; pdfWidth = 30;
      else
         pdfString = 'PDF';
         pdfXPos = 70;  pdfWidth = 25;
      end

      printPDFRadioBtn = uicontrol('Parent',dialogFig, ...
         'Units','character', ...
			'Enable','on', ...
			'Interruptible','on', ...
			'Position',[pdfXPos 6.4 pdfWidth 2]*coeff, ...
			'String',pdfString, ...
			'callback','sf(''Private'', ''rg_dialog'', ''print_to'', ''pdf'');', ...
			'Max', 1, ...
			'Min', 0, ...
			'Value', 1, ...
			'Style', 'radiobutton', ...
			'Tag','printPDFRadioButton');



		printWhatFrame = uicontrol('Parent',dialogFig, ...
			'Units','character', ...
			'Enable','off', ...
			'Interruptible','on', ...
			'Position',[10 11.6 86 7]*coeff, ...
			'Style', 'frame', ...
			'Tag','printWhatFrame');

		printWhatTXT = uicontrol('Parent',dialogFig, ...
			'Units','character', ...
			'Enable','on', ...
			'Interruptible','on', ...
			'Position',[18 17 20 2]*coeff, ...
			'HorizontalAlignment', 'left', ...
			'String','  Print What:', ...
			'Style', 'text', ...
			'Tag','printWhatTXT');



		printAllRadioButton = uicontrol('Parent',dialogFig, ...
			'Units','character', ...
			'Enable','on', ...
			'Interruptible','on', ...
			'Position',[15 14.8 80 2]*coeff, ...
			'String',sprintf('Print all charts for this machine (%s)',machineName), ...
			'callback','sf(''Private'', ''rg_dialog'', ''printAll'');', ...
			'Style', 'radiobutton', ...
			'Max', 1, ...
			'ToolTip',  machineName, ...
			'Min', 0, ...
			'Value', 1, ...
			'Tag','printAllRadioButton');

		printThisRadioButton = uicontrol('Parent',dialogFig, ...
			'Units','character', ...
			'Enable','on', ...
			'Interruptible','on', ...
			'Position',[15 12.2 80 2]*coeff, ...
			'String',sprintf('Print current chart (%s)',chartName), ...
			'callback','sf(''Private'', ''rg_dialog'', ''printThis'');', ...
			'Style', 'radiobutton', ...
			'Max', 1, ...
			'Min', 0, ...
			'Value', 0, ...
			'ToolTip',  chartName, ...
			'Tag','printThisRadioButton');

      includeLibrariesCheckbox = uicontrol('Parent',dialogFig, ...
			'Units','character', ...
			'Enable','on', ...
			'Interruptible','on', ...
			'Position',[10 2 35 2.6]*coeff, ...
			'String',['Include library links' ], ...
			'Style', 'checkbox', ...
			'Max', 1, ...
			'Min', 0, ...
			'Value', 1, ...
			'ToolTip',  'Add linked libraries to the report', ...
         'Tag','includeLibrariesCheckbox');

	case 'print_to',
		printToBtns(1) = findobj('Tag','printPSRadioButton');
		printToBtns(2) = findobj('Tag','printPDFRadioButton');
		printToBtns(3) = findobj('Tag','printPrinterRadioButton');


		switch ids, % second argument is a string {'ps','pdf','printer'}
		case 'ps',
			me = 1;
		case 'pdf',
			me = 2;
		case 'printer',
			me = 3;
		end
		myId = printToBtns(me);
		val = get( myId, 'Value' );
		if val
			for i = 1:length(printToBtns)
				if i ~= me
					set( printToBtns, 'Value', 0 );
				end
			end

		end
		set( myId, 'Value', 1 );

	case 'cancel',
		fig = findobj( 'Tag', 'SFRGDialogFig' );
		close( fig );

	case 'printThis',
		me = findobj('Tag','printThisRadioButton');
		val = get( me, 'Value' );
		set( me, 'Value', 1 );
		other = findobj('Tag','printAllRadioButton');
		set( other, 'Value', 0 );

	case 'printAll',
		me = findobj('Tag','printAllRadioButton');
		val = get( me, 'Value' );
		set( me, 'Value', 1 );
		other = findobj('Tag','printThisRadioButton');
		set( other, 'Value', 0 );

	case 'print',
		fig = findobj( 'Tag', 'SFRGDialogFig' );
		ud = get( fig, 'UserData' );
		ids = ud{1};
		format = ud{2}; %which is ps
		% However, if the print to PDF is selected then format is 'pdf'
		printPDFCB = findobj('Tag','printPDFRadioButton');
		printPDFCBVal = get( printPDFCB, 'Value' );
		if printPDFCBVal
			format = 'pdf';
		end
		chartName = sf( 'get', ids, '.name' );
		chartName = chartName( 1, : );
		chartName = strrep( chartName, '/', '_' );
		machine = sf( 'get', ids, '.machine' );
		machine = machine(1);
		machineName = sf( 'get', machine, '.name' );
		% construct the vector of chart ids
		printAllButt = findobj('Tag','printAllRadioButton');
		printAll = get( printAllButt, 'Value' );
		fileName = get_chart_name( ids );
		if printAll
			mach = sf( 'get', ids, '.machine' );
         ids = sf( 'get', mach, '.charts' );  % this does not include links
         ilc = findobj('Tag','includeLibrariesCheckbox');
         ilcVal = get( ilc, 'Value' );
         if ilcVal == 1
         	inst = sf('Private','get_instances_in_machine', mach );
         	moreCharts = sf('get', inst, 'instance.chart' );

            % Skip link charts which have subcharts
            for chart_i = moreCharts(:)'
                if rg_printbook_cant_handle_chart(chart_i)
                    warning(sprintf('Report generator skipping chart "%s" which contains subchart(s), truthtable(s), or Embedded MATLAB function(s)', ...
                            sf('get',chart_i,'chart.name')));
                else
                    ids = [ids chart_i];
                end
            end
         end
			fileName = machineName;
		end

		% see if print to file option is checked
		ptpb = findobj('Tag','printPrinterRadioButton');
		ptp = get( ptpb, 'Value' );
		if ~ptp %don't print to printer
			curPath = '';
			if strcmp( computer, 'PCWIN' )
				curPath = pwd;
			end
			[fileName, pathName] = uiputfile( ...
				[curPath filesep fileName '.' format], 'Save As' );
			if fileName == 0  % user selected cancel on the uiputfile
				return;
			end
			close(fig);
			toFile = 0;
			rg( ids, format, fileName, pathName, toFile );
		else
			close(fig);
			myDir = tempdir;
			if myDir( length( tempdir ) ) == filesep
				myDir( length( tempdir ) ) = []; %remove closing filesep in the tempdir path
			end
			rg( ids, format, 'sf__rep.ps', myDir, 1 );
		end
	case 'help',
		sfhelp;
end


function chartName = get_chart_name(chart)

chartName = sf('get',chart,'chart.name');
[r,c] = find(chartName == '/');
if ~isempty(c)
   chartName = chartName(max(c)+1:end);
end
chartName(regexp(chartName,'\W')) = '_';