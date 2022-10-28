clean:
	rm -rf figures
	rm -rf derived_data
	rm -rf .created-dirs
	rm -f report.html

.created-dirs:
	mkdir -p figures
	mkdir -p derived_data
	touch .created-dirs


derived_data/derived_data_avg.csv: .created-dirs derived_data.R source_data/dogdata.csv
	Rscript derived_data.R

figures/energy_bar.png: source_data/dogdata.csv energy_bar.R 
	Rscript energy_bar.R

figures/demeanor_bar.png: source_data/dogdata.csv demeanor_bar.R 
	Rscript demeanor_bar.R

figures/shedding_bar.png: source_data/dogdata.csv shedding_bar.R 
	Rscript shedding_bar.R

figures/trainability_bar.png: source_data/dogdata.csv trainability_bar.R 
	Rscript trainability_bar.R


figures/grooming_bar.png: source_data/dogdata.csv grooming_bar.R 
	Rscript grooming_bar.R

figures/group_bar.png: source_data/dogdata.csv group_bar.R 
	Rscript group_bar.R

figures/hw_scatter.png: source_data/dogdata.csv derived_data/derived_data_avg.csv grooming_bar.R source_data/dogdata.csv
	Rscript hw_scatter.R

report.html: figures/energy_bar.png figures/demeanor_bar.png figures/trainability_bar.png figures/grooming_bar.png figures/group_bar.png figures/shedding_bar.png
	R -e "rmarkdown::render(\"Report.Rmd\", output_format = \"html_document\")"