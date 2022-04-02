Shader "Galaktikos/Fur/10 Layers"
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
		_FurHeightCutoff("Height Cutoff", Range(0, 1)) = 0
		_FurLength("Length", Float) = .2
		_FurLayers("Layers", Range(0, 1)) = 1

		[Header(Layer Fade)]
		[Toggle] _FurLayerFade("Enabled", Float) = 1
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

SubShader{Pass{CGPROGRAM#define _FURLAYER.0
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.1
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.2
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.3
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.4
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.5
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.6
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.7
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.8
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.9
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}}}}