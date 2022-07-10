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
			Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }

			Blend[_SrcBlend][_DstBlend]
			ZTest[_ZTest]
			ZWrite[_ZWrite]
			Cull[_Cull]
			ColorMask[_ColorWriteMask]

SubShader{Pass{CGPROGRAM#define _FURLAYER.0
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.00390625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.0078125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.01171875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.015625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.01953125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.0234375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.02734375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.03125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.03515625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.0390625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.04296875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.046875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.05078125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.0546875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.05859375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.0625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.06640625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.0703125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.07421875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.078125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.08203125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.0859375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.08984375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.09375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.09765625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.1015625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.10546875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.109375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.11328125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.1171875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.12109375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.12890625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.1328125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.13671875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.140625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.14453125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.1484375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.15234375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.15625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.16015625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.1640625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.16796875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.171875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.17578125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.1796875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.18359375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.1875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.19140625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.1953125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.19921875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.203125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.20703125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.2109375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.21484375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.21875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.22265625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.2265625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.23046875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.234375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.23828125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.2421875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.24609375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.25
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.25390625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.2578125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.26171875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.265625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.26953125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.2734375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.27734375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.28125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.28515625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.2890625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.29296875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.296875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.30078125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.3046875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.30859375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.3125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.31640625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.3203125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.32421875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.328125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.33203125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.3359375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.33984375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.34375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.34765625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.3515625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.35546875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.359375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.36328125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.3671875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.37109375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.37890625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.3828125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.38671875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.390625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.39453125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.3984375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.40234375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.40625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.41015625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.4140625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.41796875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.421875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.42578125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.4296875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.43359375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.4375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.44140625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.4453125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.44921875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.453125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.45703125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.4609375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.46484375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.46875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.47265625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.4765625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.48046875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.484375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.48828125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.4921875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.49609375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.5
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.50390625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.5078125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.51171875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.515625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.51953125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.5234375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.52734375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.53125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.53515625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.5390625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.54296875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.546875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.55078125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.5546875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.55859375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.5625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.56640625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.5703125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.57421875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.578125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.58203125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.5859375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.58984375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.59375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.59765625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.6015625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.60546875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.609375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.61328125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.6171875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.62109375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.62890625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.6328125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.63671875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.640625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.64453125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.6484375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.65234375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.65625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.66015625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.6640625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.66796875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.671875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.67578125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.6796875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.68359375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.6875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.69140625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.6953125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.69921875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.703125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.70703125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.7109375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.71484375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.71875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.72265625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.7265625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.73046875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.734375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.73828125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.7421875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.74609375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.75
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.75390625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.7578125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.76171875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.765625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.76953125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.7734375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.77734375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.78125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.78515625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.7890625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.79296875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.796875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.80078125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.8046875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.80859375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.8125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.81640625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.8203125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.82421875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.828125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.83203125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.8359375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.83984375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.84375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.84765625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.8515625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.85546875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.859375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.86328125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.8671875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.87109375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.87890625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.8828125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.88671875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.890625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.89453125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.8984375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.90234375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.90625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.91015625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.9140625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.91796875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.921875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.92578125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.9296875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.93359375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.9375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.94140625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.9453125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.94921875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.953125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.95703125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.9609375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.96484375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.96875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.97265625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.9765625
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.98046875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.984375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.98828125
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.9921875
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}Pass{CGPROGRAM#define _FURLAYER.99609375
#pragma vertex vert
#pragma fragment frag
#pragma multi_compile_fog
#include"FurHelper.cginc"ENDCG}}
Fallback "VertexLit"}}