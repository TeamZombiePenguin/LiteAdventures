package game;

import game.display.Tile;
import game.display.TileManager;
import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.Lib;

/**
 * ...
 * @author Josh Elliott
 */

class Main extends Sprite 
{
	var inited:Bool;

	var m_tileToAdd:Int = 1;
	var m_testTileManager:TileManager;
	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;
		
		m_testTileManager = new TileManager( );
		m_testTileManager.addTile( 0, 0, 0 );
		m_testTileManager.addTile( 1, 0, 0 );
		m_testTileManager.addTile( 0, 1, 0 );
		m_testTileManager.addTile( 1, 1, 0 );
		m_testTileManager.addTile( 1, 1, 1 );
		m_testTileManager.addTile( 0, 2, 0 );
		m_testTileManager.addTile( 0, 2, 1 );
		m_testTileManager.addTile( 1, 2, 0 );
		m_testTileManager.addTile( 1, 2, 1 );
		m_testTileManager.addTile( 2, 2, 0 );
		m_testTileManager.addTile( 2, 2, 1 );
		m_testTileManager.addTile( 2, 1, 0 );
		m_testTileManager.addTile( 2, 1, 1 );
		m_testTileManager.addTile( 2, 0, 0 );
		m_testTileManager.addTile( 2, 0, 1 );
		m_testTileManager.addTile( 2, 2, 2 );
		
		m_testTileManager.redrawTiles( stage );
		
		//m_testTileManager.getTileAt( 0, 0, 0 ).select();
		
		//stage.addEventListener( MouseEvent.CLICK, addTile );
		
		
		/*
		var testTile:Tile = new Tile( );
		stage.addChild( testTile );
		testTile.x = 300;
		testTile.y = 150;
		
		var testTile5:Tile = new Tile( );
		stage.addChild( testTile5 );
		testTile5.x = testTile.x - 64;
		testTile5.y = testTile.y;
		
		var testTile2:Tile = new Tile( );
		stage.addChild( testTile2 );
		testTile2.x = testTile.x + 32;
		testTile2.y = testTile.y + 16;
		
		var testTile3:Tile = new Tile( );
		stage.addChild( testTile3 );
		testTile3.x = testTile.x - 32;
		testTile3.y = testTile.y + 16;
		
		var testTile4:Tile = new Tile( );
		stage.addChild( testTile4 );
		testTile4.x = testTile.x - 64;
		testTile4.y = testTile.y - 16;
		*/
		
		// (your code here)
		
		// Stage:
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
	}

	/* SETUP */

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.addChild(new Main());
		
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
	}
	
	public function addTile( e:MouseEvent ):Void
	{
		switch ( m_tileToAdd )
		{				
			case 1:
				m_testTileManager.addTile( 1, 0, 0 );
				
			case 2:
				m_testTileManager.addTile( 0, 1, 0 );
				
			case 3:
				m_testTileManager.addTile( 1, 1, 0 );
				
			case 4:
				m_testTileManager.addTile( 1, 1, 1 );
				
			case 5:
				m_testTileManager.addTile( 0, 2, 0 );
				m_testTileManager.addTile( 0, 2, 1 );
				
			case 6:
				m_testTileManager.addTile( 1, 2, 0 );
				m_testTileManager.addTile( 1, 2, 1 );
				
			case 7:
				m_testTileManager.addTile( 2, 2, 0 );
				m_testTileManager.addTile( 2, 2, 1 );
				
			case 8:
				m_testTileManager.addTile( 2, 1, 0 );
				m_testTileManager.addTile( 2, 1, 1 );
				
			case 9:
				m_testTileManager.addTile( 2, 0, 0 );
				m_testTileManager.addTile( 2, 0, 1 );
			
			case 10:
				m_testTileManager.addTile( 2, 2, 2 );
				
		}
		
		m_testTileManager.redrawTiles( stage );
		
		m_tileToAdd += 1;
	}
}
