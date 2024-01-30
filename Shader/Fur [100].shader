Shader "Galaktikos/Fur/100 Layers"
{
	Properties
	{
		[Header(Fallback)]
		_Color("Color", Color) = (1, 1, 1, 1)
		_MainTex("Albedo", 2D) = "white" {}
		_Glossiness("Smoothness", Range(0, 1)) = .5
		_Metallic("Metallic", Range(0, 1)) = 0

		[Header(Fur)]
		[HDR] _FurColor("Color", Color) = (1, 1, 1, 1)
		[Toggle] _FurTextureOffset("Use Offsets", Float) = 0
		_FurTexture("Texture", 2D) = "white" {}
		_FurHeightTexture("Height", 2D) = "white" {}
		[Toggle] _FurLengthTextureOffset("Use Offsets", Float) = 0
		_FurLengthTexture("Length", 2D) = "white" {}
		[Toggle] _FurAlphaTextureOffset("Use Offsets", Float) = 0
		_FurAlphaTexture("Alpha", 2D) = "white" {}
		_FurLength("Length", Float) = .2
		_FurInset("Inset", Range(0, 1)) = 0
		_FurLayers("Layers", Range(0, 1)) = 1

		[Header(Height Cutoff)]
		[Toggle] _FurHeightCutoff("Enabled", Float) = 1
		[Toggle] _FurHeightCutoffChangeBase("Change Base", Float) = 0
		_FurHeightCutoffStart("Height Cutoff Start", Range(0, 1)) = 0
		_FurHeightCutoffEnd("Height Cutoff End", Range(0, 1)) = 1

		[Header(Layer Fade)]
		[Toggle] _FurLayerFade("Enabled", Float) = 1
		[Toggle] _FurLayerFadeChangeBase("Change Base", Float) = 0
		[HDR] _FurLayerFadeStart("Start", Color) = (0, 0, 0, 1)
		[HDR] _FurLayerFadeEnd("End", Color) = (1, 1, 1, 1)

		[Header(Lighting)]
		[Toggle] _FurLighting("Enabled", Float) = 1
		_FurLightingStrength("Strength", Range(0, 1)) = 1

		[Header(Ambient)]
		[Toggle] _FurLightingAmbient("Enabled", Float) = 1
		_FurLightingAmbientStrength("Strength", Range(0, 1)) = 1

		[Header(Directional Lighting)]
		[Toggle] _FurLightingDirectional("Enabled", Float) = 1
		_FurLightingDirectionalStrength("Strength", Range(0, 1)) = 1
		[Toggle] _FurLightingDirectionalSpecular("Specular", Float) = 0
		[HDR] _FurLightingDirectionalSpecularColor("Specular", Color) = (1, 1, 1, 1)
		_FurLightingDirectionalShininess("Shininess", Range(.01, 128)) = 5

		[Header(Lightmap)]
		[Toggle] _FurLightingLightmap("Enabled", Float) = 1
		_FurLightingLightmapStrength("Strength", Range(0, 1)) = 1

		[Header(Emmission)]
		[Toggle] _FurEmmission("Enabled", Float) = 0
		[HDR] _FurEmmissionColor("Color", Color) = (1, 1, 1, 1)
		[Toggle] _FurEmmissionTextureOffset("Use Offsets", Float) = 0
		_FurEmmissionTexture("Texture", 2D) = "white" {}

		[Header(Brush)]
		[Toggle] _FurBrush("Enabled", Float) = 0
		_FurBrushX("Brush X", Range(-1, 1)) = 0
		_FurBrushY("Brush Y", Range(-1, 1)) = 0
		_FurBrushZ("Brush Z", Range(-1, 1)) = 0

		[Header(UV Brush)]
		[Toggle] _FurUVBrush("Enabled", Float) = 0
		_FurUVBrushMaskTexture("Mask", 2D) = "white" {}
		_FurUVBrushX("X", Float) = 0
		_FurUVBrushY("Y", Float) = 0

		[Header(Wind)]
		[Toggle] _FurWind("Enabled", Float) = 0
		_FurWindStrengthX("Strength X", Range(0, 1)) = 0
		_FurWindStrengthY("Strength Y", Range(0, 1)) = 0
		_FurWindStrengthZ("Strength Z", Range(0, 1)) = 0
		_FurWindSpeedX("Speed X", Float) = 0
		_FurWindSpeedY("Speed Y", Float) = 0
		_FurWindSpeedZ("Speed Z", Float) = 0

		[Header(UV Wind)]
		[Toggle] _FurUVWind("Enabled", Float) = 0
		_FurUVWindMaskTexture("Mask", 2D) = "white" {}
		_FurUVWindStrengthX("Strength X", Float) = 0
		_FurUVWindStrengthY("Strength Y", Float) = 0
		_FurUVWindSpeedX("Speed X", Float) = 0
		_FurUVWindSpeedY("Speed Y", Float) = 0

		[Header(Render Settings)]
		[Enum(UnityEngine.Rendering.CullMode)] _Cull("Cull", Float) = 2
		[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest("ZTest", Float) = 4
		[Enum(Off, 0, On, 1)] _ZWrite("ZWrite", Float) = 1
		[Enum(UnityEngine.Rendering.ColorWriteMask)] _ColorWriteMask("ColorWriteMask", Float) = 15
		[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend("SrcBlend", Float) = 5
		[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend("DestBlend", Float) = 10
	}

	Category
	{
		Tags{"RenderType"="Transparent" "IgnoreProjector"="True" "Queue"="Transparent"}
		Blend[_SrcBlend][_DstBlend]
		ZTest[_ZTest]
		ZWrite[_ZWrite]
		Cull[_Cull]
		ColorMask[_ColorWriteMask]

		SubShader {
      Pass {
        CGPROGRAM
        #define _FURLAYER 0
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.010101010101010102
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.020202020202020204
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.030303030303030304
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.04040404040404041
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.05050505050505051
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.06060606060606061
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.07070707070707072
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.08080808080808081
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.09090909090909091
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.10101010101010102
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.11111111111111112
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.12121212121212122
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.13131313131313133
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.14141414141414144
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.15151515151515152
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.16161616161616163
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.17171717171717174
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.18181818181818182
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.19191919191919193
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.20202020202020204
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.21212121212121213
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.22222222222222224
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.23232323232323235
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.24242424242424243
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.25252525252525254
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.26262626262626265
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.27272727272727276
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.2828282828282829
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.29292929292929293
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.30303030303030304
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.31313131313131315
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.32323232323232326
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.33333333333333337
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.3434343434343435
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.3535353535353536
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.36363636363636365
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.37373737373737376
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.38383838383838387
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.393939393939394
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.4040404040404041
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.4141414141414142
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.42424242424242425
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.43434343434343436
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.4444444444444445
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.4545454545454546
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.4646464646464647
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.4747474747474748
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.48484848484848486
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.494949494949495
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.5050505050505051
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.5151515151515152
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.5252525252525253
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.5353535353535354
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.5454545454545455
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.5555555555555556
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.5656565656565657
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.5757575757575758
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.5858585858585859
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.595959595959596
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.6060606060606061
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.6161616161616162
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.6262626262626263
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.6363636363636365
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.6464646464646465
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.6565656565656566
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.6666666666666667
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.6767676767676768
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.686868686868687
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.696969696969697
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.7070707070707072
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.7171717171717172
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.7272727272727273
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.7373737373737375
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.7474747474747475
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.7575757575757577
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.7676767676767677
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.7777777777777778
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.787878787878788
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.797979797979798
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.8080808080808082
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.8181818181818182
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.8282828282828284
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.8383838383838385
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.8484848484848485
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.8585858585858587
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.8686868686868687
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.8787878787878789
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.888888888888889
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.8989898989898991
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.9090909090909092
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.9191919191919192
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.9292929292929294
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.9393939393939394
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.9494949494949496
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.9595959595959597
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.9696969696969697
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.9797979797979799
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 0.98989898989899
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
      Pass {
        CGPROGRAM
        #define _FURLAYER 1
        #pragma vertex vert
        #pragma fragment frag
        #pragma multi_compile_fog
        #include "FurHelper.cginc"
        ENDCG
      }
    }
	}
}