function action(input, output_means,output_avi, filename) {
        print(filename);
        open(input + filename);
        run("8-bit");
        run("Z Project...", "projection=[Average Intensity]");
        imageCalculator("Subtract create stack", filename,"AVG_"+filename);
        selectWindow("Result of "+filename);
        setAutoThreshold("Default dark");
		run("Threshold...");
		setThreshold(62, 255);
		setOption("BlackBackground", true);
		run("Convert to Mask", "method=Default background=Dark black");
		saveAs("avi", output_avi + filename);
		run("ROI Manager...");
		makeRectangle(0, 0, 512, 2048);
		roiManager("Add");
		makeRectangle(512, 0, 512, 2048);
		roiManager("Add");
		makeRectangle(1024, 0, 512, 2048);
		roiManager("Add");
		makeRectangle(1536, 0, 512, 2048);
		roiManager("Add");
		run("Set Measurements...", "mean redirect=None decimal=3");
		roiManager("Multi Measure");
		roiManager("Measure");
		roiManager("Multi Measure");
		// applyMacro doesn't work 
		//Table.applyMacro("Sum12 = Mean1 + Mean2 Sum34 = Mean3 + Mean4 Index12 = (Mean1 - Mean2)/(Mean1 + Mean2) Index34 = (Mean3 - Mean4)/(Mean3 + Mean4)");
		saveAs("Results", output_means +  filename + ".csv");
		roiManager("delete");
		run("Close All");
		
}
// Modify this path
path = "/User/DROSOPHILA/Drosophila_Tracking_Analysis/light avoidance data/wt x tshgal80; uaskir/"

input = path + "avi/";

File.makeDirectory(path + "means/");
File.makeDirectory(path + "avi_masked/");

output_means = path + "means/";
output_avi = path + "avi_masked/";

// reprocess images

//setBatchMode(true);
 
list = getFileList(input);
for (i = 0; i < list.length; i++){
        action(input, output_means,output_avi, list[i]);
}
//setBatchMode(false);

