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

derived_data/derived_data_reps.csv: .created-dirs source_data/reps_data.csv derived_data_reps.R
	Rscript derived_data_reps.R

derived_data/derived_data_corr.csv: .created-dirs derived_data_corr.R derived_data/derived_data_reps.csv source_data/reps_data.csv
	Rscript derived_data_corr.R 

figures/energy_bar.png: .created-dirs source_data/dogdata.csv energy_bar.R 
	Rscript energy_bar.R

figures/demeanor_bar.png: .created-dirs source_data/dogdata.csv demeanor_bar.R 
	Rscript demeanor_bar.R

figures/shedding_bar.png: .created-dirs source_data/dogdata.csv shedding_bar.R 
	Rscript shedding_bar.R

figures/trainability_bar.png: .created-dirs source_data/dogdata.csv trainability_bar.R 
	Rscript trainability_bar.R

figures/grooming_bar.png: .created-dirs source_data/dogdata.csv grooming_bar.R 
	Rscript grooming_bar.R

figures/group_bar.png: .created-dirs source_data/dogdata.csv group_bar.R 
	Rscript group_bar.R

figures/hw_scatter.png: .created-dirs derived_data/derived_data_avg.csv hw_scatter.R 
	Rscript hw_scatter.R

figures/corr_1.png: .created-dirs derived_data/derived_data_corr.csv corr_matrix_1.R
	Rscript corr_matrix_1.R

figures/corr_2.png: .created-dirs derived_data/derived_data_corr.csv corr_matrix_2.R
	Rscript corr_matrix_2.R

figures/groom_height_box.png: .created-dirs derived_data/derived_data_avg.csv groom_height_box.R 
	Rscript groom_height_box.R

figures/groom_weight_box.png: .created-dirs derived_data/derived_data_avg.csv groom_weight_box.R 
	Rscript groom_weight_box.R

figures/h_exp_scatter.png: .created-dirs derived_data/derived_data_avg.csv h_exp_scatter.R 
	Rscript h_exp_scatter.R

figures/w_exp_scatter.png: .created-dirs derived_data/derived_data_avg.csv w_exp_scatter.R 
	Rscript w_exp_scatter.R

figures/h_reps_scatter.png: .created-dirs derived_data/derived_data_reps.csv h_reps_scatter.R 
	Rscript h_reps_scatter.R

figures/w_reps_scatter.png: .created-dirs derived_data/derived_data_reps.csv w_reps_scatter.R 
	Rscript w_reps_scatter.R

figures/heaviest_dogs.png: .created-dirs derived_data/derived_data_reps.csv heaviest_dogs.R 
	Rscript heaviest_dogs.R

figures/lightest_dogs.png: .created-dirs derived_data/derived_data_reps.csv lightest_dogs.R 
	Rscript lightest_dogs.R

figures/tallest_dogs.png: .created-dirs derived_data/derived_data_reps.csv tallest_dogs.R 
	Rscript tallest_dogs.R

figures/shortest_dogs.png: .created-dirs derived_data/derived_data_reps.csv shortest_dogs.R 
	Rscript shortest_dogs.R

figures/not_smart_dogs.png: .created-dirs derived_data/derived_data_reps.csv not_smart_dogs.R 
	Rscript not_smart_dogs.R

figures/smart_dogs.png: .created-dirs derived_data/derived_data_reps.csv smart_dogs.R 
	Rscript smart_dogs.R

figures/mosaic_plot.png: .created-dirs derived_data/derived_data_avg.csv mosaic_plot.R 
	Rscript mosaic_plot.R

figures/log_reg_height.png: .created-dirs derived_data/derived_data_reps.csv log_reg_height.R 
	Rscript log_reg_height.R

figures/log_reg_weight.png: .created-dirs derived_data/derived_data_reps.csv log_reg_weight.R 
	Rscript log_reg_weight.R

report.html: figures/energy_bar.png figures/demeanor_bar.png figures/trainability_bar.png figures/grooming_bar.png figures/group_bar.png figures/shedding_bar.png figures/hw_scatter.png figures/corr_1.png figures/corr_2.png figures/groom_height_box.png figures/groom_weight_box.png figures/h_exp_scatter.png figures/w_exp_scatter.png figures/h_reps_scatter.png figures/w_reps_scatter.png figures/heaviest_dogs.png figures/lightest_dogs.png figures/tallest_dogs.png figures/shortest_dogs.png figures/not_smart_dogs.png figures/smart_dogs.png figures/mosaic_plot.png figures/log_reg_height.png figures/log_reg_weight.png
	R -e "rmarkdown::render(\"Report.Rmd\", output_format = \"html_document\")"