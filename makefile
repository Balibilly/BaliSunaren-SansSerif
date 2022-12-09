otfDIR=EXPORTS/OTF/*.otf
ttfDIR=EXPORTS/TTF/*.ttf
vfDIR=EXPORTS/VARIABLE/*.ttf
WOFF2=EXPORTS/WOFF2/
woff2File=EXPORTS/OTF/*.woff2
woff2DIR=EXPORTS/WOFF2/*.woff2

checkOTF : $(otfDIR)
	$(foreach font,$(wildcard $(otfDIR)), fontbakery check-universal $(font) --html $(font).html;)

checkTTF : $(ttfDIR)
	$(foreach font,$(wildcard $(ttfDIR)), fontbakery check-universal $(font) --html $(font).html;)

checkVF : $(vfDIR)
	$(foreach font,$(wildcard $(ttfDIR)), fontbakery check-universal $(font) --html $(font).html;)

removeHTML :
	rm -f EXPORTS/OTF/*.html
	rm -f EXPORTS/TTF/*.html

convertWOFF2 : $(otfDIR) $(ttfDIR) $(vfDIR)
	$(foreach font,$(wildcard $(otfDIR)), woff2_compress $(font);)
	mkdir -p $(WOFF2)
	$(foreach font,$(wildcard $(woff2File)), mv $(font) $(WOFF2);)

uploadFolder : $(otfDIR) $(ttfDIR)
	echo "Copying files to web folder..."
	$(foreach font,$(wildcard $(otfDIR)), mkdir -p $(firstword $(subst ., ,$(font)));)
	$(foreach font,$(wildcard $(otfDIR)), cp $(font) $(firstword $(subst ., ,$(font)));)

	$(foreach font,$(wildcard $(ttfDIR)), mkdir -p $(firstword $(subst ., ,$(font)));)
	$(foreach font,$(wildcard $(ttfDIR)), cp $(font) $(firstword $(subst ., ,$(font)));)

	$(foreach font,$(wildcard $(vfDIR)), mkdir -p $(firstword $(subst ., ,$(font)));)
	$(foreach font,$(wildcard $(vfDIR)), cp $(font) $(firstword $(subst ., ,$(font)));)

	$(foreach font,$(wildcard $(woff2DIR)), mkdir -p $(firstword $(subst ., ,$(font)));)
	$(foreach font,$(wildcard $(woff2DIR)), cp $(font) $(firstword $(subst ., ,$(font)));)