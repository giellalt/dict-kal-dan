# This is an ad-hoc makefile for an ad-hoc solution to
# the need for a Greenlandic dictionary.
# The direct link to Eckhards original (in kal/src/ is broken.
# Also here, we need abn xml format.

# For the record: This was the ad-hoc oneliner:
# ~/gtsvn/st/kal$cat src/kaldan-lex.txt | perl -pe 's/eo:[^\/]*\///g;' | tr ' ' ' ' | grep -v "#" | perl -pe 's/_[NV]//g;' | sed 's/$/ # ;/g;' | tr '\t' ':' | sed 's/</%</g;' | sed 's/>/%>/g;' | grep '[a-z]' | sed 's/\;/%\;/g;' | sed 's/# %\;/# \;/;' > ~/gtsvn/words/dicts/kaldan/src/kaldan.lexc


LEXC = lexc #-utf8
XFST = xfst #-utf8

bin/kaldan.fst: src/kaldan.lexc
	@echo
	@echo "*** Building kaldan.fst ***" 
	@echo
	@echo "*** Calling xfst to compile lexc ***"
	@printf "read lexc < src/kaldan.lexc \n\
	invert net \n\
	save bin/kaldan.fst\n" > ../tmp/kaldan-lexc-script
	$(XFST) < ../tmp/kaldan-lexc-script

clean:
	@rm -f bin/kaldan.fst
