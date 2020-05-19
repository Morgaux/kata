#
# Configuration for katas and unit tests
#

KATAS = alphabet_cipher fizzbuzz roman_numerals sort palindrome leap_year
LANGS = awk c haskell java python shell
TMOUT = 30s
TESTS = ${KATAS:%=test_%}

_JAVA_FLAGS  = -enablesystemassertions          \
               -XX:MaxRAM=2048m                 \
               -XX:+UnlockExperimentalVMOptions \
               -XX:+UseSerialGC                 \
               -XX:+TieredCompilation           \
               -XX:TieredStopAtLevel=1          \
               -XX:ActiveProcessorCount=1
_JAVAC_FLAGS = -Xlint:all -Werror ${_JAVA_FLAGS:%=-J%}

