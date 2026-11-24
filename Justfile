clean:
    rm -r book

build-en:
    typst compile typ/book.typ --input lang=en --input target=html book --features bundle,html -f bundle
    typst compile typ/book.typ --input lang=en --input target=pdf book/book_en.pdf

build: build-en

check-links:
    linkchecker book

format-html:
    for file in `find book -name "*.html"`; do \
        echo $file; \
        tidy -qim --alt-text "inlined image" --tidy-mark no --warn-proprietary-attributes no -w 120 --custom-tags blocklevel $file; \
    done
