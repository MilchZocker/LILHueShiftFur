#if defined(LIL_FUR) && defined(LIL_FEATURE_MAIN_TONE_CORRECTION)
    // Ensure fur pass also receives Main HSVG tone correction (Hue Shift etc.).
    #define BEFORE_FUR fd.col.rgb = lilToneCorrection(fd.col.rgb, _MainTexHSVG);
#endif

#if defined(LIL_FUR) && defined(LIL_FEATURE_MAIN_TONE_CORRECTION)
	// Make fur color follow the same Hue Shift/Saturation/Value/Gamma as main color.
	// Capture the original uniform or optimized constant before redefining its name.
	float4 HueShiftFurGetRimColor()
	{
		return float4(lilToneCorrection(_FurRimColor.rgb, _MainTexHSVG), _FurRimColor.a);
	}
	#define LIL_CUSTOM_FUR_RIM_COLOR HueShiftFurGetRimColor()
	#undef _FurRimColor
	#define _FurRimColor LIL_CUSTOM_FUR_RIM_COLOR
#endif
