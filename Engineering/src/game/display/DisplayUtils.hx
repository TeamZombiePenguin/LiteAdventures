package game.display;

/**
 * ...
 * @author Josh Elliott
 */
class DisplayUtils
{

	public static function compareEntityDepth( tile1:Tile, tile2:Tile ):Int
	{
		var tile1Sum:Int = tile1.xCoord + tile1.yCoord;
		var tile2Sum:Int = tile2.xCoord + tile2.yCoord;
		
		if ( tile1Sum != tile2Sum )
		{
			return tile1Sum < tile2Sum ? 1 : -1;
		}
		else
		{
			return tile1.zCoord > tile2.zCoord ? 1 : -1;
		}
	}
	
}