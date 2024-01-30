Shader "Galaktikos/Fur/50 Layers"
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
				#define _FURLAYER 0.02040816326530612
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.04081632653061224
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.061224489795918366
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.08163265306122448
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.1020408163265306
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.12244897959183673
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.14285714285714285
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.16326530612244897
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.18367346938775508
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.2040816326530612
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.22448979591836732
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.24489795918367346
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.26530612244897955
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.2857142857142857
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3061224489795918
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.32653061224489793
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3469387755102041
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.36734693877551017
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.3877551020408163
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4081632653061224
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.42857142857142855
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.44897959183673464
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4693877551020408
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.4897959183673469
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5102040816326531
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5306122448979591
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5510204081632653
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5714285714285714
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.5918367346938775
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6122448979591836
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6326530612244897
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6530612244897959
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.673469387755102
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.6938775510204082
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7142857142857142
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7346938775510203
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7551020408163265
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7755102040816326
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.7959183673469387
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8163265306122448
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.836734693877551
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8571428571428571
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8775510204081632
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.8979591836734693
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9183673469387754
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9387755102040816
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9591836734693877
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9795918367346939
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
			Pass {
				CGPROGRAM
				#define _FURLAYER 0.9999999999999999
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				#include "FurHelper.cginc"
				ENDCG
			}
		}
	}
}