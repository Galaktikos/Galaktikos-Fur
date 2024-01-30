Shader "Galaktikos/Fur/256 Layers"
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
				#define _FURLAYER 0.00392156862745098
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.00784313725490196
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.011764705882352941
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.01568627450980392
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.0196078431372549
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.023529411764705882
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.027450980392156862
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.03137254901960784
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.03529411764705882
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.0392156862745098
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.043137254901960784
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.047058823529411764
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.050980392156862744
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.054901960784313725
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.058823529411764705
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.06274509803921569
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.06666666666666667
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.07058823529411765
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.07450980392156863
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.0784313725490196
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.08235294117647059
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.08627450980392157
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.09019607843137255
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.09411764705882353
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.09803921568627451
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.10196078431372549
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.10588235294117647
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.10980392156862745
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.11372549019607843
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.11764705882352941
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.12156862745098039
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.12549019607843137
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.12941176470588234
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.13333333333333333
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.13725490196078433
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.1411764705882353
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.14509803921568626
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.14901960784313725
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.15294117647058825
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.1568627450980392
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.16078431372549018
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.16470588235294117
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.16862745098039217
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.17254901960784313
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.1764705882352941
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.1803921568627451
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.1843137254901961
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.18823529411764706
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.19215686274509802
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.19607843137254902
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.2
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.20392156862745098
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.20784313725490194
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.21176470588235294
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.21568627450980393
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.2196078431372549
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.22352941176470587
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.22745098039215686
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.23137254901960785
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.23529411764705882
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.2392156862745098
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.24313725490196078
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.24705882352941178
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.25098039215686274
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.2549019607843137
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.2588235294117647
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.2627450980392157
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.26666666666666666
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.27058823529411763
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.27450980392156865
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.2784313725490196
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.2823529411764706
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.28627450980392155
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.2901960784313725
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.29411764705882354
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.2980392156862745
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.30196078431372547
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3058823529411765
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.30980392156862746
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3137254901960784
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3176470588235294
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.32156862745098036
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3254901960784314
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.32941176470588235
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3333333333333333
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.33725490196078434
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3411764705882353
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.34509803921568627
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.34901960784313724
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3529411764705882
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3568627450980392
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3607843137254902
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.36470588235294116
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3686274509803922
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.37254901960784315
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3764705882352941
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3803921568627451
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.38431372549019605
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.38823529411764707
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.39215686274509803
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.396078431372549
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.403921568627451
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.40784313725490196
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4117647058823529
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4156862745098039
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4196078431372549
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4235294117647059
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.42745098039215684
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.43137254901960786
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.43529411764705883
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4392156862745098
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.44313725490196076
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.44705882352941173
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.45098039215686275
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4549019607843137
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4588235294117647
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4627450980392157
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4666666666666667
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.47058823529411764
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4745098039215686
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4784313725490196
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4823529411764706
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.48627450980392156
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.49019607843137253
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.49411764705882355
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4980392156862745
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5019607843137255
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5058823529411764
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5098039215686274
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5137254901960784
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5176470588235293
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5215686274509804
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5254901960784314
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5294117647058824
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5333333333333333
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5372549019607843
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5411764705882353
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5450980392156862
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5490196078431373
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5529411764705883
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5568627450980392
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5607843137254902
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5647058823529412
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5686274509803921
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5725490196078431
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5764705882352941
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.580392156862745
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5843137254901961
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5882352941176471
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.592156862745098
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.596078431372549
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6039215686274509
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6078431372549019
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.611764705882353
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.615686274509804
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6196078431372549
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6235294117647059
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6274509803921569
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6313725490196078
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6352941176470588
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6392156862745098
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6431372549019607
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6470588235294118
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6509803921568628
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6549019607843137
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6588235294117647
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6627450980392157
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6666666666666666
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6705882352941176
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6745098039215687
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6784313725490196
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6823529411764706
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6862745098039216
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6901960784313725
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6941176470588235
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6980392156862745
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7019607843137254
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7058823529411764
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7098039215686275
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7137254901960784
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7176470588235294
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7215686274509804
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7254901960784313
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7294117647058823
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7333333333333333
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7372549019607844
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7411764705882353
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7450980392156863
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7490196078431373
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7529411764705882
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7568627450980392
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7607843137254902
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7647058823529411
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7686274509803921
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7725490196078432
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7764705882352941
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7803921568627451
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7843137254901961
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.788235294117647
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.792156862745098
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.796078431372549
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.803921568627451
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.807843137254902
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8117647058823529
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8156862745098039
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8196078431372549
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8235294117647058
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8274509803921568
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8313725490196078
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8352941176470589
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8392156862745098
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8431372549019608
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8470588235294118
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8509803921568627
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8549019607843137
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8588235294117647
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8627450980392157
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8666666666666667
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8705882352941177
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8745098039215686
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8784313725490196
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8823529411764706
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8862745098039215
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8901960784313725
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8941176470588235
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8980392156862745
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9019607843137255
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9058823529411765
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9098039215686274
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9137254901960784
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9176470588235294
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9215686274509803
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9254901960784314
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9294117647058824
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9333333333333333
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9372549019607843
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9411764705882353
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9450980392156862
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9490196078431372
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9529411764705882
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9568627450980391
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9607843137254902
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9647058823529412
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9686274509803922
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9725490196078431
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9764705882352941
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9803921568627451
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.984313725490196
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9882352941176471
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9921568627450981
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.996078431372549
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