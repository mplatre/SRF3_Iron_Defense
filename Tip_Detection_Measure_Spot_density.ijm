 run("Clear Results");
 
 dir1 = getDirectory("Choose Source Directory for Stacked ");
 dir2 = getDirectory("Choose Source Directory for Saved_detected_root");
 dir3 = getDirectory("Choose Source Directory for Spot");

 list1 = getFileList(dir1);
 list2 = getFileList(dir2);

 for (i=0; i<list1.length; i++) {
open(dir1+list1[i]);
    name1= getTitle();
   rename("channel1");  

makeRectangle(120, 12, 609, 2412);
run("Crop");

Stack.getDimensions(width, height, channels, slices, frames);
		title=getTitle();
		//run("Duplicate...", "title=*");
		//setBatchMode(true);
		roiManager("reset");	
		run("Set Measurements...", "area mean integrated display redirect=None decimal=5");
		makeRectangle((width/4), (height/4), (width/2), (height/2));
		run("Find Maxima...", "noise=200 output=[Point Selection]");
		//Xmax= getResult("X", 0);
		//Ymax= getResult("Y", 0);
		//toUnscaled (Xmax, Ymax);
		run("Select All");

  
			run("Duplicate...", "title=Wave");
			run("Select All");
			roiManager("Add");
			run("Wavelet A Trou");
			run("Stack to Images");
			close("coeff-5");
			close("coeff-4");
			close("coeff-2");
			close("coeff-3");
			close("coeff-1");
			roiManager("reset");
			selectWindow("plan");
			setAutoThreshold("Otsu dark");
			run("Convert to Mask");
	setOption("BlackBackground", true);
run("Create Selection");


selectWindow("channel1");
run("Restore Selection");
run("Measure");
saveAs("Tiff", dir2+list1[i]);



close("wave");
close("plan");
run("Close");
			
open(dir3+list1[i]);
   name1= getTitle();
   
run("Convert to Mask");
   run("Analyze Particles...", "size=0.1-200.00 circularity=0.15-1.00 show=Masks summarize");

run("Close");
run("Close");

}


	
                                                                                                                                                                                                                                                                                                                                                                            