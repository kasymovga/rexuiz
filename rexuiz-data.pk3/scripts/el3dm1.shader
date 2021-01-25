textures/e8/e8alphaspawn
{
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm pointlight
	nopicmip
	{
		map textures/e8/e8alphaspawn.tga
		blendfunc add
		rgbGen Vertex
	}
}

textures/e8/e8yarrow
{
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm pointlight
	nopicmip
	{
		map textures/e8/e8yarrow.tga
		blendfunc add
		rgbGen Vertex
	}
}

textures/e8/e8lightblue_flicker
{
	qer_editorimage textures/e8/e8tinylightblue.tga
	surfaceparm nomarks
	q3map_surfacelight 950
	{
		map textures/e8/e8tinylightblue.tga
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}

//id shader modified..

textures/e8/zap_e8
{
	qer_editorimage textures/sfx/zap_scroll.tga
//q3map_surfacelight	300
	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	nopicmip
	cull none
	{
		Map textures/sfx/zap_scroll.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle .8 2 0 7
		tcMod scroll 0 1
	}
	{
		Map textures/sfx/zap_scroll.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle 1 1.4 0 5
		tcMod scale  -1 1
		tcMod scroll 0 1
	}
	{
		Map textures/sfx/zap_scroll2.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle 1 1.4 0 6.3
		tcMod scale  -1 1
		tcMod scroll 2 1
	}
	{
		Map textures/sfx/zap_scroll2.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle 1 1.4 0 7.7
		tcMod scroll -1.3 1
	}
}
//end id shader modify

textures/e8/e8lighttrim_static
{
	qer_editorimage textures/e8/e8lighttrim.tga
	surfaceparm nomarks
	q3map_surfacelight 400
	{
		map textures/e8/e8lighttrim.tga
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}

textures/e8/e8lighttrim_glow
{
	qer_editorimage textures/e8/e8lighttrim.tga
	surfaceparm nomarks
	q3map_surfacelight 400
	{
		map textures/e8/e8lighttrim.tga
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}

textures/e8/e8lighttrim_b_static
{
	qer_editorimage textures/e8/e8lighttrim_b.tga
	surfaceparm nomarks
	q3map_surfacelight 400
	{
		map textures/e8/e8lighttrim_b.tga
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
	}

textures/e8/e8lighttrim_b_glow
{
	qer_editorimage textures/e8/e8lighttrim_b.tga
	surfaceparm nomarks
	q3map_surfacelight 400
	{
		map textures/e8/e8lighttrim_b.tga
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}

textures/e8/e8_launchpad1
{
	surfaceparm metalsteps
	q3map_surfacelight 100
	{
		map textures/e8/e8_launchpad1_fx.tga
		rgbGen identity
		tcMod scroll 0 3
	}
	{
		map textures/e8/e8_launchpad1.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap
	}
}

textures/e8/e8xgirder
{
	surfaceparm alphashadow
	surfaceparm metalsteps
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	nopicmip
	{
		map textures/e8/e8xgirder.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
		tcGen lightmap
		depthFunc equal
	}
}

textures/e8/e8xgirder_small
{
	cull disable
	{
		map textures/e8/e8xgirder_small.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
		tcGen lightmap
		depthFunc equal
	}
}

textures/e8/e8xgirder_small2
{
	cull disable
	nopicmip
	{
		map textures/e8/e8xgirder_small2.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
		tcGen lightmap
		depthFunc equal
	}
}

textures/e8/e8rail2
{
	surfaceparm alphashadow
	cull disable
	nopicmip
	nomipmaps
	{
		map textures/e8/e8rail2.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
		tcGen lightmap
		depthFunc equal
	}
}

textures/e8/e8evilspacetxt
{
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm pointlight
	nopicmip
	{
		map textures/e8/e8evilspacetxt.tga
		blendfunc add
		rgbGen Vertex
	}
}

textures/e8/e8beam_blue
{
	qer_editorimage textures/e8/e8beam_blue.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	nopicmip
	qer_trans 0.6
	{
		map textures/e8/e8beam_blue.tga
		blendfunc add
		tcMod scroll 0.3 0
	}
}

textures/e8/e8metal03c_shiney
{
	qer_editorimage textures/e8/e8metal03c.tga
	{
		map textures/effects/tinfx.tga
		rgbGen identity
		tcGen environment
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap
	}
}

textures/e8/ctf_e8stars
{
	qer_editorimage textures/e8/e8stars.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_surfacelight 10
	q3map_sun 1 0.98 0.9 15 0 90
	skyParms textures/e8/env/e8 - -
}

textures/e8/dm_e8stars
{
	qer_editorimage textures/e8/e8stars.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_surfacelight 30
	q3map_sun 1 0.98 0.9 55 0 90
	skyParms textures/e8/env/e8 - -
}

textures/e8/dm_e8stars2
{
	qer_editorimage textures/e8/e8stars.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_surfacelight 70
	q3map_sun 1 0.98 0.9 100 0 90
	skyParms textures/e8/env/e8 - -
}

textures/e8/e8metal_blue_shiney
{
	qer_editorimage textures/e8/e8metal_blue.tga
	{
		map textures/effects/tinfx.tga
		rgbGen identity
		tcGen environment
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap
	}
}

textures/e8/e8metal_red_shiney
{
	qer_editorimage textures/e8/e8metal_red.tga
	{
		map textures/effects/tinfx.tga
		rgbGen identity
		tcGen environment
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap
	}
}

//broken shader D:

textures/e8/e8trimlight
{
	q3map_lightimage textures/e8/e8trimlight_fx.tga
	q3map_surfacelight 100
	{
		map $lightmap
		rgbGen identity
		tcGen lightmap
	}
	{
		map textures/e8/e8trimlight.tga
		blendfunc filter
		rgbGen identity
	}
	{
		map textures/e8/e8trimlight_fx.tga
		blendfunc add
		tcMod scroll -2 0
	}
}

textures/e8/e8trimlight2
{
	qer_editorimage textures/e8/e8trimlight2.tga
	surfaceparm nomarks
	q3map_surfacelight 400
	{
		map textures/e8/e8trimlight2.tga
	}
	{
		map $lightmap
		blendfunc filter
		tcGen lightmap
	}
}
