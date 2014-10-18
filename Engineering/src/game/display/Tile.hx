package game.display;

import openfl.display.Sprite;
import openfl.geom.Point;

/**
 * ...
 * @author Josh Elliott
 */
class Tile extends Sprite
{
	private static inline var TILE_HEIGHT:UInt = 32;
	private static inline var TILE_WIDTH:UInt = 64;
	
	private static inline var CUBE_HEIGHT:UInt = 16;
	
	public var yCoord:Int;
	public var xCoord:Int;
	public var zCoord:Int;
	
	public function new( xPos:Int, yPos:Int, zPos:Int ) 
	{
		super();
		
		xCoord = xPos;
		yCoord = yPos;
		zCoord = zPos;
		
		drawDebug( false );
	}
	
	public function select( ):Void
	{
		this.graphics.clear();
		drawDebug( true );
	}
	
	public function deselect( ):Void
	{
		this.graphics.clear();
		drawDebug( false );
	}
	
	private function drawDebug( selected:Bool ):Void
	{
		var lineColor:UInt = selected ? 0xFF0000 : 0x000000;
		
		//Draw top
		this.graphics.beginFill( 0x00FF59 );
		this.graphics.lineStyle( 1, lineColor, 1, false );
		this.graphics.moveTo( 0, TILE_HEIGHT / 2 );
		this.graphics.lineTo( TILE_WIDTH / 2, 0 );
		this.graphics.lineTo( TILE_WIDTH, TILE_HEIGHT / 2 );
		this.graphics.lineTo( TILE_WIDTH / 2, TILE_HEIGHT );
		this.graphics.lineTo( 0, TILE_HEIGHT / 2 );
		this.graphics.endFill( );
		
		//Draw left
		this.graphics.beginFill( 0x734700 );
		this.graphics.moveTo( 0, TILE_HEIGHT / 2 );
		this.graphics.lineTo( TILE_WIDTH / 2, TILE_HEIGHT );
		this.graphics.lineTo( TILE_WIDTH / 2, TILE_HEIGHT + CUBE_HEIGHT );
		this.graphics.lineTo( 0, TILE_HEIGHT / 2 + CUBE_HEIGHT );
		this.graphics.lineTo( 0, TILE_HEIGHT / 2 );
		this.graphics.endFill( );
		
		//Draw left
		this.graphics.beginFill( 0xA36500 );
		this.graphics.moveTo( TILE_WIDTH, TILE_HEIGHT / 2 );
		this.graphics.lineTo( TILE_WIDTH / 2, TILE_HEIGHT );
		this.graphics.lineTo( TILE_WIDTH / 2, TILE_HEIGHT + CUBE_HEIGHT );
		this.graphics.lineTo( TILE_WIDTH, TILE_HEIGHT / 2 + CUBE_HEIGHT );
		this.graphics.lineTo( TILE_WIDTH, TILE_HEIGHT / 2 );
		this.graphics.endFill( );
	}
}