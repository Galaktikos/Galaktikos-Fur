#include "UnityCG.cginc"
#include "Lighting.cginc"

// General
half4 _FurColor;
float _FurTextureOffset;
sampler2D _FurTexture; float4 _FurTexture_ST;
sampler2D _FurHeightTexture; float4 _FurHeightTexture_ST;
float _FurLengthTextureOffset;
sampler2D _FurLengthTexture; float4 _FurLengthTexture_ST;
float _FurAlphaTextureOffset;
sampler2D _FurAlphaTexture; float4 _FurAlphaTexture_ST;
float _FurLength;
float _FurLayers;

// Height Cutoff
float _FurHeightCutoff;
float _FurHeightCutoffChangeBase;
float _FurHeightCutoffStart;
float _FurHeightCutoffEnd;

// Layer Fade
float _FurLayerFade;
float _FurLayerFadeChangeBase;
half4 _FurLayerFadeStart;
half4 _FurLayerFadeEnd;

// Lighting
float _FurLighting;
float _FurLightingStrength;

	// Ambient
	float _FurLightingAmbient;
	float _FurLightingAmbientStrength;

	// Directional
	float _FurLightingDirectional;
	float _FurLightingDirectionalStrength;
	float _FurLightingDirectionalSpecular;
	half4 _FurLightingDirectionalSpecularColor;
	float _FurLightingDirectionalShininess;

	// Lightmap
	float _FurLightingLightmap;
	float _FurLightingLightmapStrength;

// Emmission
float _FurEmmission;
half4 _FurEmmissionColor;
float _FurEmmissionTextureOffset;
sampler2D _FurEmmissionTexture; float4 _FurEmmissionTexture_ST;

// Brush
float _FurBrush;
float _FurBrushX;
float _FurBrushY;
float _FurBrushZ;

// UV Brush
float _FurUVBrush;
sampler2D _FurUVBrushMaskTexture; float4 _FurUVBrushMaskTexture_ST;
float _FurUVBrushX;
float _FurUVBrushY;

// Wind
float _FurWind;
float _FurWindStrengthX;
float _FurWindStrengthY;
float _FurWindStrengthZ;
float _FurWindSpeedX;
float _FurWindSpeedY;
float _FurWindSpeedZ;

// UV Wind
float _FurUVWind;
sampler2D _FurUVWindMaskTexture; float4 _FurUVWindMaskTexture_ST;
float _FurUVWindStrengthX;
float _FurUVWindStrengthY;
float _FurUVWindSpeedX;
float _FurUVWindSpeedY;

// Other
sampler _CameraDepthTexture;


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
	float length = ColorValue(tex2D(_FurLengthTexture, i.uvFurLength + (_FurLengthTextureOffset ? offset : 0)));

	if (_FURLAYER > length)
		discard;

	float layer = _FURLAYER;
	if (length > 0)
		layer /= length;

	// Alpha
	col.a *= ColorValue(tex2D(_FurAlphaTexture, i.uvFurAlpha + (_FurAlphaTextureOffset ? offset : 0)));

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
			lighting += DecodeLightmap(UNITY_SAMPLE_TEX2D(unity_Lightmap, i.uvLightmap)) * col.rgb * _FurLightingLightmapStrength;
		
		col.rgb = lerp(col.rgb, lighting, _FurLightingStrength);
	}

	// Emmission
	if (_FurEmmission)
		col.rgb += tex2D(_FurEmmissionTexture, i.uvFurEmmission + (_FurEmmissionTextureOffset ? offset : 0)) * _FurEmmissionColor;

	UNITY_APPLY_FOG(i.fogCoord, col);

	return col;
}