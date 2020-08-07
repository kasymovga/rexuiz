//**********************************************************************
//
//	Title  : egyptsoc.shader
//	Author : Sock
//	Date   : 1st July 2001
//	Email  : sock@planetquake.com
//	URL    : http://www.planetquake.com/simland
//	Version: 1.6
//
//  If you use any of these Egyptian shader/textures I kindly ask
//  YOU to give me credit for my work within your README file or
//  TEXT file distributed with your map/mod.
//
//**********************************************************************
//
// Index of shaders (128) :-
//
// (32) 32x32 light sources : 01 = Cross, 02 = Triangle, 03 = Star, 04 = Flower
//
// lig_032-01b1-2k  lig_032-02b1-2k  lig_032-03b1-2k  lig_032-04b1-2k  - Blue + grey bckgrd
// lig_032-01b2-2k  lig_032-02b2-2k  lig_032-03b2-2k  lig_032-04b2-2k  - Blue + yellow bckgrd
// lig_032-01r1-2k  lig_032-02r1-2k  lig_032-03r1-2k  lig_032-04r1-2k  - Red + grey bckgrd
// lig_032-01r2-2k  lig_032-02r2-2k  lig_032-03r2-2k  lig_032-04r2-2k  - Red + yellow bckgrd
// lig_032-01y1-2k  lig_032-02y1-2k  lig_032-03y1-2k  lig_032-04y1-2k  - Yellow + grey bckgrd
// lig_032-01y2-2k  lig_032-02y2-2k  lig_032-03y2-2k  lig_032-04y2-2k  - Yellow + yellow bckgrd
// lig_032-01w1-2k  lig_032-02w1-2k  lig_032-03w1-2k  lig_032-04w1-2k  - White + grey bckgrd
// lig_032-01w2-2k  lig_032-02w2-2k  lig_032-03w2-2k  lig_032-04w2-2k  - White + yellow bckgrd
//
// (40) 64x64 light sources : 01 = Anhk, 02 = Circle, 04 = Cross, 05 = Square, 06 = Triangle
//
// lig_064-01b1-2k  lig_064-02b1-2k  lig_064-04b1-2k  lig_064-05b1-2k  lig_064-06b1-2k  - Blue + grey bckgrd
// lig_064-01b2-2k  lig_064-02b2-2k  lig_064-04b2-2k  lig_064-05b2-2k  lig_064-06b2-2k  - Blue + yellow bckgrd
// lig_064-01r1-2k  lig_064-02r1-2k  lig_064-04r1-2k  lig_064-05r1-2k  lig_064-06r1-2k  - Red + grey bckgrd
// lig_064-01r2-2k  lig_064-02r2-2k  lig_064-04r2-2k  lig_064-05r2-2k  lig_064-06r2-2k  - Red + yellow bckgrd
// lig_064-01y1-2k  lig_064-02y1-2k  lig_064-04y1-2k  lig_064-05y1-2k  lig_064-06y1-2k  - Yellow + grey bckgrd
// lig_064-01y2-2k  lig_064-02y2-2k  lig_064-04y2-2k  lig_064-05y2-2k  lig_064-06y2-2k  - Yellow + yellow bckgrd
// lig_064-01w1-2k  lig_064-02w1-2k  lig_064-04w1-2k  lig_064-05w1-2k  lig_064-06w1-2k  - White + grey bckgrd
// lig_064-01w2-2k  lig_064-02w2-2k  lig_064-04w2-2k  lig_064-05w2-2k  lig_064-06w2-2k  - White + yellow bckgrd
//
// (18) 256x64 Band style light : 01 = Single, 02 = ZigZag, 03 = Triangle
//
// lig_b064-01a  lig_b064-02a  lig_b064-03a  - Blue + grey bckgrd
// lig_b064-01b  lig_b064-02b  lig_b064-03b  - Blue + yellow bckgrd
// lig_b064-01c  lig_b064-02c  lig_b064-03c  - Yellow + grey bckgrd
// lig_b064-01d	 lig_b064-02d  lig_b064-03d  - Yellow + yellow bckgrd
// lig_b064-01e  lig_b064-02e  lig_b064-03e  - Red + grey bckgrd
// lig_b064-01f	 lig_b064-02f  lig_b064-03f  - Red + yellow bckgrd
//
// (06) Vertical style light - 2 bar with additional border 96x192
//
// lig_v192-01ba  - Blue + grey bckgrd
// lig_v192-01bb  - Blue + yellow bckgrd
// lig_v192-01ya  - Yellow + grey bckgrd
// lig_v192-01yb  - Yellow + yellow bckgrd
// lig_v192-01wa  - White + grey bckgrd
// lig_v192-01wb  - White + yellow bckgrd
//
// (06) Weapon Markers 1 - 2 rot swirls + FAST glowing symbols
//
// wmblue_floor1a  wmblue_floor1b  - Blue symbols and swirls
// wmgold_floor1a  wmgold_floor1b  - Gold symbols and swirls
// wmred_floor1a   wmred_floor1b   - Red symbols and swirls
//
// (06) Jump Pads 1 - 1 rot swirl + 1 jumppad stretch + SLOW glowing symbols
//
// jpblue_floor1a  jpblue_floor1b  - Blue symbols and swirls
// jpgold_floor1a  jpgold_floor1b  - Gold symbols and swirls
// jpred_floor1a   jpred_floor1b   - Red symbols and swirls
//
// (12) Weapon Markers with Glowing central areas
//
// s128-01wc  s128-02wc  - Blue + grey bckgrd
// s128-01wd  s128-02wd  - Blue + yellow bckgrd
// s128-01we  s128-02we  - Gold + grey bckgrd
// s128-01wcr s128-02wcr - Red + grey bckgrd
// s128-01wdr s128-02wdr - Red + yellow bckgrd
//
// (08) Grates in grey/yellow to match other tiles
//
// grate1a  grate1b  - square 32x32 design
// grate2a  grate2b  - small rectangle design
// grate3a  grate3b  - ring 32x32 design
// grate4a  grate4b  - detail version of ring design
//

//**********************************************************************//
// LIGHT 32 - 01 : Cross design light source				//
//**********************************************************************//
textures/egyptsoc_sfx/lig_032-01b1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-01b1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-01b1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-01b1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/egyptsoc_sfx/lig_032-01b2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-01b2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-01b2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-01b2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-01r1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-01r1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-01r1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-01r1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/egyptsoc_sfx/lig_032-01r2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-01r2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-01r2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-01r2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-01y1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-01y1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-01y1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-01y1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-01y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-01y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-01y2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-01y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-01w1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-01w1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-01w1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-01w1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-01w2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-01w2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-01w2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-01w2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//**********************************************************************//
// LIGHT 32 - 02 : Triangle light source				//
//**********************************************************************//
textures/egyptsoc_sfx/lig_032-02b1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-02b1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-02b1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-02b1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/egyptsoc_sfx/lig_032-02b2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-02b2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-02b2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-02b2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-02r1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-02r1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-02r1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-02r1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/egyptsoc_sfx/lig_032-02r2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-02r2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-02r2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-02r2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-02y1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-02y1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-02y1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-02y1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-02y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-02y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-02y2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-02y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-02w1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-02w1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-02w1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-02w1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-02w2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-02w2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-02w2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-02w2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//**********************************************************************//
// LIGHT 32 - 03 : Star design light source				//
//**********************************************************************//
textures/egyptsoc_sfx/lig_032-03b1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-03b1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-03b1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-03b1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/egyptsoc_sfx/lig_032-03b2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-03b2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-03b2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-03b2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-03r1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-03r1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-03r1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-03r1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/egyptsoc_sfx/lig_032-03r2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-03r2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-03r2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-03r2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-03y1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-03y1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-03y1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-03y1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-03y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-03y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-03y2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-03y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-03w1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-03w1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-03w1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-03w1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-03w2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-03w2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-03w2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-03w2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//**********************************************************************//
// LIGHT 32 - 04 : Flower design light source				//
//**********************************************************************//
textures/egyptsoc_sfx/lig_032-04b1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-04b1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-04b1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-04b1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/egyptsoc_sfx/lig_032-04b2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-04b2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-04b2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-04b2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-04r1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-04r1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-04r1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-04r1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/egyptsoc_sfx/lig_032-04r2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-04r2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-04r2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-04r2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-04y1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-04y1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-04y1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-04y1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-04y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-04y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-04y2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-04y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-04w1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-04w1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-04w1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-04w1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_032-04w2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_032-04w2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_032-04w2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_032-04w2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//**********************************************************************//
// LIGHT 64 - 01 : Standard Ankh light source				//
//**********************************************************************//
textures/egyptsoc_sfx/lig_064-01b1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-01b1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-01b1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-01b1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/egyptsoc_sfx/lig_064-01b2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-01b2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-01b2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-01b2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-01r1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-01r1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-01r1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-01r1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/egyptsoc_sfx/lig_064-01r2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-01r2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-01r2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-01r2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-01y1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-01y1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-01y1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-01y1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-01y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-01y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-01y2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-01y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-01w1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-01w1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-01w1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-01w1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-01w2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-01w2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-01w2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-01w2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//**********************************************************************//
// LIGHT 64 - 02 : Standard Circle light source				//
//**********************************************************************//
textures/egyptsoc_sfx/lig_064-02b1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-02b1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-02b1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02b1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/egyptsoc_sfx/lig_064-02b2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-02b2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-02b2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02b2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-02r1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-02r1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-02r1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02r1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/egyptsoc_sfx/lig_064-02r2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-02r2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-02r2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02r2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-02y1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-02y1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-02y1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02y1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-02y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-02y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-02y2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-02w1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-02w1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-02w1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02w1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-02w2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-02w2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-02w2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02w2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//**********************************************************************//
// LIGHT 64 - 04 : Circle template with cross bars across light source  //
//**********************************************************************//
textures/egyptsoc_sfx/lig_064-04b1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-04b1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-04b1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-04b1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-04b2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-04b2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-04b2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-04b2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-04r1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-04r1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-04r1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-04r1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-04r2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-04r2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-04r2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-04r2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-04y1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-04y1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-04y1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-04y1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-04y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-04y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-04y2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-04y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-04w1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-04w1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-04w1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-04w1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-04w2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-04w2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-04w2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-04w2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//**********************************************************************//
// LIGHT 64 - 05 : Standard Square light source				//
//**********************************************************************//
textures/egyptsoc_sfx/lig_064-05b1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-05b1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-05b1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-05b1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-05b2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-05b2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-05b2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-05b2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-05r1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-05r1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-05r1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-05r1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-05r2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-05r2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-05r2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-05r2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-05y1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-05y1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-05y1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-05y1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-05y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-05y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-05y2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-05y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-05w1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-05w1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-05w1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-05w1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-05w2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-05w2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-05w2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-05w2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//**********************************************************************//
// LIGHT 64 - 06 : Triangle light source				//
//**********************************************************************//
textures/egyptsoc_sfx/lig_064-06b1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-06b1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-06b1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-06b1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-06b2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-06b2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-06b2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-06b2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-06r1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-06r1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-06r1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-06r1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-06r2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-06r2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-06r2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-06r2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-06y1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-06y1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-06y1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-06y1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-06y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-06y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-06y2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-06y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-06w1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-06w1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-06w1_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-06w1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/lig_064-06w2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-06w2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-06w2_glow.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-06w2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//**********************************************************************//
// LIGHT BAND 64 - 01 : Single glowing stripe 256x64			//
//**********************************************************************//
textures/egyptsoc_sfx/lig_b064-01a
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-01a.tga
	{
		map textures/egyptsoc_sfx/lig_b064-01a.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-01b
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-01b.tga
	{
		map textures/egyptsoc_sfx/lig_b064-01b.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-01c
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-01c.tga
	{
		map textures/egyptsoc_sfx/lig_b064-01c.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-01d
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-01d.tga
	{
		map textures/egyptsoc_sfx/lig_b064-01d.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-01e
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-01e.tga
	{
		map textures/egyptsoc_sfx/lig_b064-01e.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-01f
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-01f.tga
	{
		map textures/egyptsoc_sfx/lig_b064-01f.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

//**********************************************************************//
// LIGHT BAND 64 - 02 : ZigZag glowing stripe 256x64			//
//**********************************************************************//
textures/egyptsoc_sfx/lig_b064-02a
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-02a.tga
	{
		map textures/egyptsoc_sfx/lig_b064-02a.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-02b
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-02b.tga
	{
		map textures/egyptsoc_sfx/lig_b064-02b.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-02c
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-02c.tga
	{
		map textures/egyptsoc_sfx/lig_b064-02c.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-02d
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-02d.tga
	{
		map textures/egyptsoc_sfx/lig_b064-02d.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-02e
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-02e.tga
	{
		map textures/egyptsoc_sfx/lig_b064-02e.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-02f
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-02f.tga
	{
		map textures/egyptsoc_sfx/lig_b064-02f.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

//**********************************************************************//
// LIGHT BAND 64 - 03 : Triangle glowing pattern 256x64			//
//**********************************************************************//
textures/egyptsoc_sfx/lig_b064-03a
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-03a.tga
	{
		map textures/egyptsoc_sfx/lig_b064-03a.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-03b
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-03b.tga
	{
		map textures/egyptsoc_sfx/lig_b064-03b.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-03c
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-03c.tga
	{
		map textures/egyptsoc_sfx/lig_b064-03c.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-03d
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-03d.tga
	{
		map textures/egyptsoc_sfx/lig_b064-03d.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-03e
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-03e.tga
	{
		map textures/egyptsoc_sfx/lig_b064-03e.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_b064-03f
{
	qer_editorimage textures/egyptsoc_sfx/lig_b064-03f.tga
	{
		map textures/egyptsoc_sfx/lig_b064-03f.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

//**********************************************************************//
// BLUE LIGHT 192 - 01 : 2 bar with additional border 96x192		//
//**********************************************************************//
textures/egyptsoc_sfx/lig_v192-01ba
{       
	qer_editorimage textures/egyptsoc_sfx/lig_v192-01ba.tga
	{
		map textures/egyptsoc_sfx/lig_v192-01ba.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_v192-01bb
{       
	qer_editorimage textures/egyptsoc_sfx/lig_v192-01bb.tga
	{
		map textures/egyptsoc_sfx/lig_v192-01bb.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

//**********************************************************************//
// YELLOW LIGHT 192 - 01 : 2 bar with additional border 96x192		//
//**********************************************************************//
textures/egyptsoc_sfx/lig_v192-01ya
{       
	qer_editorimage textures/egyptsoc_sfx/lig_v192-01ya.tga
	{
		map textures/egyptsoc_sfx/lig_v192-01ya.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_v192-01yb
{       
	qer_editorimage textures/egyptsoc_sfx/lig_v192-01yb.tga
	{
		map textures/egyptsoc_sfx/lig_v192-01yb.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

//**********************************************************************//
// WHITE LIGHT 192 - 01 : 2 bar with additional border 96x192		//
//**********************************************************************//
textures/egyptsoc_sfx/lig_v192-01wa
{       
	qer_editorimage textures/egyptsoc_sfx/lig_v192-01wa.tga
	{
		map textures/egyptsoc_sfx/lig_v192-01wa.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

textures/egyptsoc_sfx/lig_v192-01wb
{       
	qer_editorimage textures/egyptsoc_sfx/lig_v192-01wb.tga
	{
		map textures/egyptsoc_sfx/lig_v192-01wb.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
}

//**********************************************************************//
//									//
// FLOOR 1A								//
//									//
// Weapon Markers 1 - 2 rot swirls + FAST glowing symbols		//
//**********************************************************************//
textures/egyptsoc_sfx/wmblue_floor1a
{
	qer_editorimage textures/egyptsoc_floor/jumppad1ab.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1ab_glow.tga	
	q3map_surfacelight 100
	{
		map textures/egyptsoc_floor/jumppad1ab.tga
		rgbgen identity
	}
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/egyptsoc_sfx/wmgold_floor1a
{
	qer_editorimage textures/egyptsoc_floor/jumppad1ag.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1ag_glow.tga	
	q3map_surfacelight 100
	{
		map textures/egyptsoc_floor/jumppad1ag.tga
		rgbgen identity
	}
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/egyptsoc_sfx/wmred_floor1a
{
	qer_editorimage textures/egyptsoc_floor/jumppad1ar.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1ar_glow.tga	
	q3map_surfacelight 100
	{
		map textures/egyptsoc_floor/jumppad1ar.tga
		rgbgen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

//**********************************************************************//
//									//
// FLOOR 1B								//
//									//
// Weapon Markers 1 - 2 rot swirls + FAST glowing symbols		//
//**********************************************************************//
textures/egyptsoc_sfx/wmblue_floor1b
{
	qer_editorimage textures/egyptsoc_floor/jumppad1bb.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1b_glow.tga	
	q3map_surfacelight 100
	{
		map textures/egyptsoc_floor/jumppad1bb.tga
		rgbgen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/egyptsoc_sfx/wmgold_floor1b
{
	qer_editorimage textures/egyptsoc_floor/jumppad1bg.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1gg_glow.tga	
	q3map_surfacelight 100
	{
		map textures/egyptsoc_floor/jumppad1bg.tga
		rgbgen identity
	}
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/egyptsoc_sfx/wmred_floor1b
{
	qer_editorimage textures/egyptsoc_floor/jumppad1br.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1br_glow.tga	
	q3map_surfacelight 100
	{
		map textures/egyptsoc_floor/jumppad1br.tga
		rgbgen identity
	}
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

//**********************************************************************//
//									//
// FLOOR 1A								//
//									//
// Jump Pads 1 - 1 rot swirl + 1 jumppad stretch + SLOW glowing symbols //
//**********************************************************************//
textures/egyptsoc_sfx/jpblue_floor1a
{
	qer_editorimage textures/egyptsoc_floor/jumppad1ab.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1ab_glow.tga	
	q3map_surfacelight 400
	{
		map textures/egyptsoc_floor/jumppad1ab.tga
		rgbgen identity
	}
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/egyptsoc_sfx/jpgold_floor1a
{
	qer_editorimage textures/egyptsoc_floor/jumppad1ag.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1ag_glow.tga	
	q3map_surfacelight 400
	{
		map textures/egyptsoc_floor/jumppad1ag.tga
		rgbgen identity
	}
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/egyptsoc_sfx/jpred_floor1a
{
	qer_editorimage textures/egyptsoc_floor/jumppad1ar.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1ar_glow.tga	
	q3map_surfacelight 400
	{
		map textures/egyptsoc_floor/jumppad1ar.tga
		rgbgen identity
	}
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

//**********************************************************************//
//									//
// FLOOR 1B								//
//									//
// Jump Pads 1 - 1 rot swirl + 1 jumppad stretch + SLOW glowing symbols //
//**********************************************************************//
textures/egyptsoc_sfx/jpblue_floor1b
{
	qer_editorimage textures/egyptsoc_floor/jumppad1bb.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1bb_glow.tga	
	q3map_surfacelight 400
	{
		map textures/egyptsoc_floor/jumppad1bb.tga
		rgbgen identity
	}
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/egyptsoc_sfx/jpgold_floor1b
{
	qer_editorimage textures/egyptsoc_floor/jumppad1bg.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1bg_glow.tga	
	q3map_surfacelight 400
	{
		map textures/egyptsoc_floor/jumppad1bg.tga
		rgbgen identity
	}
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/egyptsoc_sfx/jpred_floor1b
{
	qer_editorimage textures/egyptsoc_floor/jumppad1br.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1br_glow.tga	
	q3map_surfacelight 400
	{
		map textures/egyptsoc_floor/jumppad1br.tga
		rgbgen identity
	}
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

//**********************************************************************//
// S128-01 : Weapon Markers with glowing central area's			//
//**********************************************************************//
textures/egyptsoc_sfx/s128-01wc
{
	qer_editorimage textures/egyptsoc_trim/s128-01c.tga
	q3map_lightimage textures/egyptsoc_trim/s128-01c_glow.tga
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_trim/s128-01c.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/s128-01wd
{
	qer_editorimage textures/egyptsoc_trim/s128-01d.tga
	q3map_lightimage textures/egyptsoc_trim/s128-01d_glow.tga
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_trim/s128-01d.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/s128-01we
{
	qer_editorimage textures/egyptsoc_trim/s128-01e.tga
	q3map_lightimage textures/egyptsoc_trim/s128-01e_glow.tga
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_trim/s128-01e.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/s128-01wcr
{
	qer_editorimage textures/egyptsoc_trimd/s128-01cr.tga
	q3map_lightimage textures/egyptsoc_trimd/s128-01cr_glow.tga
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_trimd/s128-01cr.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/egyptsoc_sfx/s128-01wdr
{
	qer_editorimage textures/egyptsoc_trimd/s128-01dr.tga
	q3map_lightimage textures/egyptsoc_trimd/s128-01dr_glow.tga
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_trimd/s128-01dr.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//**********************************************************************//
// GRATE : 128x128 designs						//
//**********************************************************************//
// grate1a  grate1b  - square 32x32 design
// grate2a  grate2b  - small rectangle design
// grate3a  grate3b  - ring 32x32 design
// grate4a  grate4b  - detail version of ring design
//
textures/egyptsoc_floor/grate1a
{
	surfaceparm	metalsteps		
	surfaceparm trans
	cull none
	nopicmip
	{
		map textures/egyptsoc_floor/grate1a.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
		rgbGen identity
	}
}

textures/egyptsoc_floor/grate1b
{
	surfaceparm	metalsteps		
	surfaceparm trans
	cull none
	nopicmip
	{
		map textures/egyptsoc_floor/grate1b.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
		rgbGen identity
	}
}

textures/egyptsoc_floor/grate2a
{
	surfaceparm	metalsteps		
	surfaceparm trans
	cull none
	nopicmip
	{
		map textures/egyptsoc_floor/grate2a.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
		rgbGen identity
	}
}

textures/egyptsoc_floor/grate2b
{
	surfaceparm	metalsteps		
	surfaceparm trans
	cull none
	nopicmip
	{
		map textures/egyptsoc_floor/grate2b.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
		rgbGen identity
	}
}

textures/egyptsoc_floor/grate3a
{
	surfaceparm	metalsteps		
	surfaceparm trans
	cull none
	nopicmip
	{
		map textures/egyptsoc_floor/grate3a.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
		rgbGen identity
	}
}

textures/egyptsoc_floor/grate3b
{
	surfaceparm	metalsteps		
	surfaceparm trans
	cull none
	nopicmip
	{
		map textures/egyptsoc_floor/grate3b.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
		rgbGen identity
	}
}

textures/egyptsoc_floor/grate4a
{
	surfaceparm	metalsteps		
	surfaceparm trans
	cull none
	nopicmip
	{
		map textures/egyptsoc_floor/grate4a.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
		rgbGen identity
	}
}

textures/egyptsoc_floor/grate4b
{
	surfaceparm	metalsteps		
	surfaceparm trans
	cull none
	nopicmip
	{
		map textures/egyptsoc_floor/grate4b.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
		rgbGen identity
	}
}
