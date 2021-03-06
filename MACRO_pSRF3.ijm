 run("Clear Results");
roiManager("reset");
 
 dir1 = getDirectory("Choose Source Directory for Channel1 ");
 dir2 = getDirectory("Choose Source Directory for Detected channel1_Spot");

 list1 = getFileList(dir1);
 list2 = getFileList(dir2);

 for (i=0; i<list1.length; i++) {
open(dir1+list1[i]);
    name1= getTitle();
   rename("channel1");  


run("Stack to Images");
close();
rename("channel1");  
run("Enhance Contrast", "saturated=0.35");
run("Duplicate...", "duplicate");
selectWindow("channel1");

// boite de dialogue pour trouver les parametres

run("8-bit");
run("Auto Local Threshold", "method=Bernsen radius=15 parameter_1=0 parameter_2=0 white");
setOption("BlackBackground", true);
run("Make Binary");
run("Despeckle");
run("Despeckle");
run("Erode");
    
setTool("Polygone Selections");
waitForUser("dessiner contour zone");
run("Clear Outside");
	

roiManager("reset");
selectWindow("channel1");
run("Analyze Particles...", "size=40-700 circularity=0.25-1.00 show=Masks add");
saveAs("Tiff", dir2+list1[i]);
close("channel1");
rename("channel1-2");  
close("channel1-2");

selectWindow("channel1-1");
roiManager("Measure");
close("channel1-1");


close("All");
}



                                                                                                                                                                                                                                                                                                                                                               