#include "UnityCG.cginc"
#include "Lighting.cginc"

struct appdata
{
	float4 vertex : POSITION;
	float2 uv : TEXCOORD0;
	float2 uvLightmap : TEXCOORD1;
	float4 normal : NORMAL;
};

struct v2f
{
	float4 vertex : SV_POSITION;
	UNITY_FOG_COORDS(0)
	float3 worldPosition : TEXCOORD1;
	float3 worldNormal : TEXCOORD2;
	float2 uvLightmap : TEXCOORD3;
	float2 uvFur : TEXCOORD4;
	float2 uvFurHeight : TEXCOORD5;
	float2 uvFurLength : TEXCOORD6;
	float2 uvFurAlpha : TEXCOORD7;
	float2 uvFurEmmission : TEXCOORD8;
	float2 uvFurUVBrushMask : TEXCOORD9;
	float2 uvFurUVWindMask : TEXCOORD10;
};

sampler _CameraDepthTexture;
sampler2D _FurTexture, _FurHeightTexture, _FurLengthTexture, _FurAlphaTexture, _FurUVBrushMaskTexture, _FurUVWindMaskTexture, _FurEmmissionTexture;
float4 _FurTexture_ST, _FurHeightTexture_ST, _FurLengthTexture_ST, _FurAlphaTexture_ST, _FurUVBrushMaskTexture_ST, _FurUVWindMaskTexture_ST, _FurEmmissionTexture_ST, _FurColor, _FurLayerFadeStart, _FurLayerFadeEnd, _FurLightingDirectionalSpecularColor, _FurEmmissionColor;
float _FurTextureOffset, _FurHeightCutoff, _FurHeightCutoffChangeBase, _FurHeightCutoffStart, _FurHeightCutoffEnd, _FurLength, _FurLayerFade, _FurLayerFadeChangeBase, _FurLayers,
_FurLighting, _FurLightingStrength,
_FurLightingAmbient, _FurLightingAmbientStrength,
_FurLightingDirectional, _FurLightingDirectionalStrength, _FurLightingDirectionalSpecular, _FurLightingDirectionalShininess,
_FurLightingLightmap, _FurLightingLightmapStrength,
_FurEmmission, _FurEmmissionTextureOffset,
_FurBrush, _FurBrushX, _FurBrushY, _FurBrushZ,
_FurUVBrush, _FurUVBrushX, _FurUVBrushY,
_FurWind, _FurWindStrengthX, _FurWindStrengthY, _FurWindStrengthZ, _FurWindSpeedX, _FurWindSpeedY, _FurWindSpeedZ,
_FurUVWind, _FurUVWindStrengthX, _FurUVWindStrengthY, _FurUVWindSpeedX, _FurUVWindSpeedY;


v2f vert(appdata v)
{
	float offset = _FURLAYER * _FurLength;
	float3 positionOffset = float3(0, 0, 0);
	
	// Brush
	if (_FurBrush)
		positionOffset += float3(_FurBrushX, _FurBrushY, _FurBrushZ);

	// Wind
	if (_FurWind)
		positionOffset += float3(_FurWindStrengthX * sin(_Time.y * _FurWindSpeedX), _FurWindStrengthY * sin(_Time.y * _FurWindSpeedY), _FurWindStrengthZ * sin(_Time.y * _FurWindSpeedZ));

	v2f o;
	o.vertex = UnityObjectToClipPos(v.vertex + normalize(v.normal) * offset + positionOffset * pow(offset, 2));
	o.worldPosition = mul(unity_ObjectToWorld, v.vertex);
	o.worldNormal = UnityObjectToWorldNormal(v.normal);
	o.uvLightmap = v.uvLightmap.xy * unity_LightmapST.xy + unity_LightmapST.zw;
	o.uvFur = TRANSFORM_TEX(v.uv, _FurTexture);
	o.uvFurHeight = TRANSFORM_TEX(v.uv, _FurHeightTexture);
	o.uvFurLength = TRANSFORM_TEX(v.uv, _FurLengthTexture);
	o.uvFurAlpha = TRANSFORM_TEX(v.uv, _FurAlphaTexture);
	o.uvFurEmmission = TRANSFORM_TEX(v.uv, _FurEmmissionTexture);
	o.uvFurUVBrushMask = TRANSFORM_TEX(v.uv, _FurUVBrushMaskTexture);
	o.uvFurUVWindMask = TRANSFORM_TEX(v.uv, _FurUVWindMaskTexture);

	UNITY_TRANSFER_FOG(o, o.vertex);

	return o;
}

float ColorValue(float4 color)
{
	return (color.r + color.g + color.b) / 3 * color.a;
}

float4 frag(v2f i) : SV_Target
{
	if (_FurLayers < _FURLAYER)
		discard;

	float2 offset = float2(0, 0);

	// UV Brush
	if (_FurUVBrush)
	{
		fixed4 color = tex2D(_FurUVBrushMaskTexture, i.uvFurUVBrushMask);
		offset += float2(_FurUVBrushX, _FurUVBrushY) * ColorValue(color);
	}

	// UV Wind
	if (_FurUVWind)
		offset += float2(_FurUVWindStrengthX * sin(_Time.y * _FurUVWindSpeedX), _FurUVWindStrengthY * sin(_Time.y * _FurUVWindSpeedY)) * tex2D(_FurUVWindMaskTexture, i.uvFurUVWindMask);

	offset *= pow(_FURLAYER, 2);

	fixed4 col = fixed4(1, 1, 1, 1);
	col *= tex2D(_FurTexture, i.uvFur + (_FurTextureOffset ? offset : 0)) * _FurColor;
	
	// Length
	float length = ColorValue(tex2D(_FurLengthTexture, i.uvFurLength + offset));

	if (_FURLAYER > length)
		discard;

	float layer = _FURLAYER;
	if (length > 0)
		layer /= length;

	// Alpha
	col.a *= ColorValue(tex2D(_FurAlphaTexture, i.uvFurAlpha + offset));

	// Height Cutoff
	if (_FurHeightCutoff && (_FurHeightCutoffChangeBase || layer > 0))
	{
		float cutoff = lerp(_FurHeightCutoffStart, _FurHeightCutoffEnd, layer);
		col.a -= (1 - ColorValue(tex2D(_FurHeightTexture, i.uvFurHeight + offset))) * cutoff + cutoff;
	}

	// Layer Fade
	if (_FurLayerFade && (_FurLayerFadeChangeBase || layer > 0))
		col *= lerp(_FurLayerFadeStart, _FurLayerFadeEnd, layer);
	
	if (col.a <= 0)
		discard;

	// Lighting
	if (_FurLighting)
	{
		fixed3 worldNormal = normalize(i.worldNormal);
		fixed3 worldLight = normalize(_WorldSpaceLightPos0.xyz);
		fixed3 worldView = normalize(_WorldSpaceCameraPos.xyz - i.worldPosition.xyz);
		fixed3 worldHalf = normalize(worldView + worldLight);

		fixed3 lighting = fixed3(0, 0, 0);

		// Ambient
		if (_FurLightingAmbient)
			lighting += UNITY_LIGHTMODEL_AMBIENT.xyz * col.rgb * _FurLightingAmbientStrength;

		// Directional
		if (_FurLightingDirectional)
		{
			lighting += _LightColor0.rgb * col.rgb * saturate(dot(worldNormal, worldLight)) * _FurLightingDirectionalStrength;
		
			// Specular
			if (_FurLightingDirectionalSpecular)
				lighting += _LightColor0.rgb * _FurLightingDirectionalSpecularColor.rgb * pow(saturate(dot(worldNormal, worldHalf)), _FurLightingDirectionalShininess);
		}

		// Lightmap
		if (_FurLightingLightmap)
			lighting.rgb += DecodeLightmap(UNITY_SAMPLE_TEX2D(unity_Lightmap, i.uvLightmap)) * col.rgb * _FurLightingLightmapStrength;
		
		col.rgb = lerp(col.rgb, lighting, _FurLightingStrength);
	}

	// Emmission
	if (_FurEmmission)
		col.rgb += tex2D(_FurEmmissionTexture, i.uvFurEmmission + (_FurEmmissionTextureOffset ? offset : 0)) * _FurEmmissionColor;

	UNITY_APPLY_FOG(i.fogCoord, col);

	return col;
}