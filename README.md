# CP Violation by I.I.BIGI and A.I.SANDA - Notes and Solutions to the problems
## Usage
### Github
1. Resister an account(If in case you don't have one).
1. Fork the repository(Click the button `fork` on the upper right).
2. Clone the repository and edit(You should follow some instructions).
3. Submit a pull request.

### Makefile
+ From the Makefile you can find the pdf files to compile.
+ Please use `make projectname.pdf` or `make all` to make pdf.

### Symbol definition
+ The symbol definition is written in my-symbols-def.tex.
Please follow this file and add more symbol definitions for convenience.
+ run `./listsymbols my-symbols` will generate a tex file named my-symbols-list.tex and it will be included in the symbol-list.tex. 
   
   **Notice**:`% SectionName` will generate a section, `%% SubsectionName will generate a subsection` and `%%%%(or more %) perline = number` will define the number of columns in the table, whose default value is 3. if a definiton has arguments, please write the arguments behind it in the format `% arg1 arg2 ...`

+ use `make symbol-list.pdf` and if the compile is successful, you will see the symbol-list.pdf

# Fonts
+ myfonts.tex contains fonts definition for my ubuntu, please change this.
+ `fc-list | grep something` may be helpful to find the fonts you have.
