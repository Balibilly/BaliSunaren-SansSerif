# Folder Structure
**FOLDER** | *file*

- **BACKUP**
- **EXPORTS**
  - **OTF**
  - **TTF**
  - **VARIABLE**
- *makefile*
- *.glyphs file*

## Modules
- [**Python 3+**](https://www.python.org/)
- [**Google Woff2**](https://github.com/google/woff2)
- [**Font Bakery**](https://github.com/googlefonts/fontbakery)

## Makefile Command
**check OTF files**
``` bash
make checkOTF
```

**check TTF files**
``` bash
make checkTTF
```

**check Variable Fonts**
``` bash
make checkVF
```

**remove HTML check files**
``` bash
make removeHTML
```

**convert to WOFF2**
``` bash
make convertWOFF2
```

**generate Folder for web upload**
``` bash
make uploadFolder
```
