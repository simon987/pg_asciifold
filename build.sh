LIB_PATH="'/usr/lib/libasciifolding.so'"

POSTGRES_DB="postgres"
POSTGRES_USER="postgres"
cmake . && make && mv ./libasciifolding.so /usr/lib/

psql -U $POSTGRES_USER $POSTGRES_DB <<EOF
CREATE OR REPLACE FUNCTION asciifold(text) RETURNS text
     AS $LIB_PATH, 'asciifold' LANGUAGE C STRICT;
CREATE OR REPLACE FUNCTION asciifold_lower(text) RETURNS text
     AS $LIB_PATH, 'asciifold_lower' LANGUAGE C STRICT;
EOF