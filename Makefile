build:
	@nimble build
run:
	@nimble run raytracing_in_one_weekend
out:
	@make run > test.ppm && open test.ppm