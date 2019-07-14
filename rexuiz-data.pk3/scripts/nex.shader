
textures/rm_nex
{
    surfaceparm nomipmaps
    {
        map textures/rm_nex.tga
        rgbgen lightingDiffuse
    }
}

textures/rm_nex_scope_glass
{
    surfaceparm trans
    cull none
    {
        map textures/rm_nex_scope_glass.tga
        blendfunc add
        rgbgen lightingDiffuse
        tcgen environment
        tcmod scale 7 7
    }   
}

textures/rm_nex_scope_overlay
{
    {
        map textures/rm_nex_scope_overlay.tga
        blendfunc add
        tcmod scale 0.5 0.5
        tcmod scroll -0.75 0.35
    }
}

textures/rm_nex_thingie
{
    {
        map textures/rm_nex_thingie.tga
        blendfunc add
    }
}

textures/rm_nex_scope_anim
{
    {
        // generated code
        animmap 32 textures/rm_nex_scope_anim/00.tga textures/rm_nex_scope_anim/01.tga textures/rm_nex_scope_anim/02.tga textures/rm_nex_scope_anim/03.tga textures/rm_nex_scope_anim/04.tga textures/rm_nex_scope_anim/05.tga textures/rm_nex_scope_anim/06.tga textures/rm_nex_scope_anim/07.tga textures/rm_nex_scope_anim/08.tga textures/rm_nex_scope_anim/09.tga textures/rm_nex_scope_anim/10.tga textures/rm_nex_scope_anim/11.tga textures/rm_nex_scope_anim/12.tga textures/rm_nex_scope_anim/13.tga textures/rm_nex_scope_anim/14.tga textures/rm_nex_scope_anim/15.tga textures/rm_nex_scope_anim/16.tga textures/rm_nex_scope_anim/17.tga textures/rm_nex_scope_anim/18.tga textures/rm_nex_scope_anim/19.tga textures/rm_nex_scope_anim/20.tga textures/rm_nex_scope_anim/21.tga textures/rm_nex_scope_anim/22.tga textures/rm_nex_scope_anim/23.tga textures/rm_nex_scope_anim/24.tga textures/rm_nex_scope_anim/25.tga textures/rm_nex_scope_anim/26.tga textures/rm_nex_scope_anim/27.tga textures/rm_nex_scope_anim/28.tga textures/rm_nex_scope_anim/29.tga textures/rm_nex_scope_anim/30.tga textures/rm_nex_scope_anim/31.tga textures/rm_nex_scope_anim/32.tga textures/rm_nex_scope_anim/33.tga textures/rm_nex_scope_anim/34.tga textures/rm_nex_scope_anim/35.tga textures/rm_nex_scope_anim/36.tga textures/rm_nex_scope_anim/37.tga textures/rm_nex_scope_anim/38.tga textures/rm_nex_scope_anim/39.tga textures/rm_nex_scope_anim/40.tga textures/rm_nex_scope_anim/41.tga textures/rm_nex_scope_anim/42.tga textures/rm_nex_scope_anim/43.tga textures/rm_nex_scope_anim/44.tga textures/rm_nex_scope_anim/45.tga textures/rm_nex_scope_anim/46.tga textures/rm_nex_scope_anim/47.tga textures/rm_nex_scope_anim/48.tga textures/rm_nex_scope_anim/49.tga textures/rm_nex_scope_anim/50.tga textures/rm_nex_scope_anim/51.tga textures/rm_nex_scope_anim/52.tga textures/rm_nex_scope_anim/53.tga textures/rm_nex_scope_anim/54.tga textures/rm_nex_scope_anim/55.tga textures/rm_nex_scope_anim/56.tga textures/rm_nex_scope_anim/57.tga textures/rm_nex_scope_anim/58.tga textures/rm_nex_scope_anim/59.tga textures/rm_nex_scope_anim/60.tga textures/rm_nex_scope_anim/61.tga textures/rm_nex_scope_anim/62.tga textures/rm_nex_scope_anim/63.tga
        rgbgen identity
    }
}

textures/rm_shotgun_barrel
{
    {
        map textures/zapper_fx_txt
        tcMod scroll 1.5 0.231
        blendfunc add
        rgbgen identity
    }
}
