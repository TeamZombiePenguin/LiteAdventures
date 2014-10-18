package game.display;
import openfl._v2.events.MouseEvent;
import openfl._v2.geom.Point;
import openfl.display.DisplayObject;
import openfl.display.DisplayObjectContainer;
import openfl.Vector;

/**
 * ...
 * @author Josh Elliott
 */
class TileManager
{
	private static var BASE_POS:Point = new Point( 400, 250 );
	
	private var m_selectedTile:Tile;
	private var m_tileList:Vector<Tile>;
	
	public function new() 
	{
		
		
		m_tileList = new Vector<Tile>( );
	}
	
	public function addTile( xPos:UInt, yPos:UInt, zPos:UInt ):Tile
	{
		var newTile:Tile = new Tile( xPos, yPos, zPos );
		//trace( "Tile Added At X: " + xPos + " Y: " + yPos + " Z: " + zPos );
		
		newTile.x = BASE_POS.x;
		newTile.y = BASE_POS.y;
		
		//Handle the X coord
		newTile.x += xPos * 32;
		newTile.y -= xPos * 16;
		
		//Handle the Y coord
		newTile.x -= yPos * 32;
		newTile.y -= yPos * 16;
		
		//newTile.y -= ( xPos + yPos ) * 32;
		newTile.y -= zPos * 16;
		
		m_tileList.push( newTile );
		m_tileList.sort( DisplayUtils.compareEntityDepth );
		
		newTile.addEventListener( MouseEvent.MOUSE_OVER, onTileClick );
		
		return newTile;
	}
	
	public function redrawTiles( surface:DisplayObjectContainer ):Void
	{
		for ( tile in m_tileList )
		{
			surface.addChild( tile );
		}
	}
	
	public function getTileAt( xPos:Int, yPos:Int, zPos:Int ):Tile
	{
		for ( tile in m_tileList )
		{
			if ( tile.xCoord == xPos && tile.yCoord == yPos && tile.zCoord == zPos )
			{
				return tile;
			}
		}
		return null;
	}
	
	public function onTileClick( e:MouseEvent ):Void
	{
		trace( "CLICK" );
		
		if ( m_selectedTile != null )
		{
			m_selectedTile.deselect( );
		}
		
		m_selectedTile = e.target;
		m_selectedTile.select();
	}
	
}