<center>
<h1>Project 3 results visualization</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.6
<p>

#Experiment 
*Tiny image + k nearest neighbor
By iterating over k from 5 to 15, Found an optimized parameter k=14
* Vocabulary building
* bag of sift + k nearest neighbor:
In bag of sift + k nearest neighbor, I iterated the step in the vl_dsift(img,'step',step) and found it reach the optimal value at step = 20

#tried extra credits
Experimental design extra credit:
##Experiment with many different vocabulary sizes and report performance:
(with setting :
sift_sample_bow=0.9;
sift_sample_vocab=0.3;
lambda=0.00001;
)
the confusion matrix result given order:
<table border=0 cellpadding=4 cellspacing=1>
<tr>
<th><th colspan=2><img src="C:\Users\JackChen\Documents\GitHub\homework3\results\extra1\10.jpg" width=100 height=75> with accuracy 0.348</th>
<th><img src="C:\Users\JackChen\Documents\GitHub\homework3\results\extra1\20.jpg" width=10 height=75> 0.442</th>
<th colspan=2><img src="C:\Users\JackChen\Documents\GitHub\homework3\results\extra1\50.jpg" width=100 height=75>with accuracy 0.514</th>
<th colspan=2><img src="C:\Users\JackChen\Documents\GitHub\homework3\results\extra1\100.jpg" width=100 height=75>with accuracy 0.547</th>
<th colspan=2><img src="C:\Users\JackChen\Documents\GitHub\homework3\results\extra1\200.jpg" width=100 height=75>with accuracy 0.561</th>
<th colspan=2><img src="C:\Users\JackChen\Documents\GitHub\homework3\results\extra1\400.jpg" width=100 height=75>with accuracy 0.573</th>
<th colspan=2><img src="C:\Users\JackChen\Documents\GitHub\homework3\results\extra1\1000.jpg" width=100 height=75>with accuracy 0.589</th>
</tr>

##Randomly pick 100 training and 100 testing images for each iteration 
Accuracy of 30 trails of randomly picking 100 testing and training samples (the random method is used in the  get_image_paths_rand.m function which outputs 100 sets of both test set and train set)

<tr>
<th>0.50</th>
<th>0.46</th>
<th colspan=2>0.64</th>
<th colspan=2>0.54</th>
<th colspan=2>0.66</th>
<th colspan=2>0.65</th>
</tr>
<tr>
<th>0.57</th>
<th>0.52</th>
<th colspan=2>0.68</th>
<th colspan=2>0.67</th>
<th colspan=2>0.73</th>
<th colspan=2>0.61</th>
</tr>
<tr>
<th>0.55</th>
<th>0.53</th>
<th colspan=2>0.66</th>
<th colspan=2>0.62</th>
<th colspan=2>0.49</th>
<th colspan=2>0.69</th>
</tr>
<tr>
<th>0.74</th>
<th>0.61</th>
<th colspan=2>0.42</th>
<th colspan=2>0.58</th>
<th colspan=2>0.63</th>
<th colspan=2>0.56</th>
</tr>
<tr>
<th>0.74</th>
<th>0.63</th>
<th colspan=2>0.53</th>
<th colspan=2>0.57</th>
<th colspan=2>0.66</th>
<th colspan=2>0.68</th>
</tr>
then get average : 0.6013
std: 0.0828
Not a bad result but merely for a pilot test

##Train the SVM with more sophisticated kernels
with the use of function:
primal_svm(1,trainy(:,i),lambda,opt);

* kernel types:
nonlinear conjugate gradients: accuracy=0.5340
newton step:0.5507
linear newton step: 0.5307

<table border=0 cellpadding=4 cellspacing=1>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
<tr>
<td>Kitchen</td>
<td>0.310</td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0047.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0131.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0184.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0154.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0069.jpg" width=100 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0056.jpg" width=100 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0016.jpg" width=100 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0071.jpg" width=100 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.240</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0173.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0007.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0022.jpg" width=88 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0112.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0095.jpg" width=101 height=75><br><small>Bedroom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Suburb_image_0014.jpg" width=113 height=75><br><small>Suburb</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0122.jpg" width=74 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0083.jpg" width=100 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.120</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0147.jpg" width=101 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0099.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0170.jpg" width=93 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0059.jpg" width=110 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0022.jpg" width=57 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0073.jpg" width=101 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0152.jpg" width=106 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0160.jpg" width=111 height=75><br><small>Store</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.090</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0271.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0236.jpg" width=114 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0122.jpg" width=120 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0023.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0061.jpg" width=100 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0117.jpg" width=71 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0096.jpg" width=100 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0003.jpg" width=114 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.070</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0051.jpg" width=110 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0202.jpg" width=107 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0058.jpg" width=118 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0150.jpg" width=92 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Forest_image_0110.jpg" width=75 height=75><br><small>Forest</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0102.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0072.jpg" width=113 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0011.jpg" width=119 height=75><br><small>Store</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.060</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0215.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0266.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0124.jpg" width=112 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0123.jpg" width=120 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0065.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0157.jpg" width=116 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0037.jpg" width=100 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0079.jpg" width=101 height=75><br><small>Office</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.120</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0235.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0224.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0117.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0031.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0103.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0056.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0162.jpg" width=113 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0024.jpg" width=113 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.120</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0212.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0177.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0019.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0038.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0084.jpg" width=110 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0067.jpg" width=110 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0096.jpg" width=75 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0006.jpg" width=75 height=75><br><small>Suburb</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.100</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0280.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0215.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0121.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0037.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Suburb_image_0152.jpg" width=113 height=75><br><small>Suburb</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0113.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0131.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0112.jpg" width=75 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.040</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0265.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0217.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0106.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0101.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0148.jpg" width=100 height=75><br><small>Industrial</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0104.jpg" width=95 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0087.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0069.jpg" width=75 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.060</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0050.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0254.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0034.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0035.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Suburb_image_0009.jpg" width=113 height=75><br><small>Suburb</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0128.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0011.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0067.jpg" width=75 height=75><br><small>Office</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.100</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0223.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0214.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0045.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0061.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0089.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0089.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0073.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0112.jpg" width=75 height=75><br><small>Forest</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.150</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0032.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0275.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0078.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0093.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0054.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0009.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0118.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0031.jpg" width=75 height=75><br><small>Highway</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.080</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0102.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0220.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0010.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0106.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0085.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0092.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0042.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0103.jpg" width=75 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.160</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0279.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0193.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0102.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0117.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0027.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0050.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0101.jpg" width=75 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0068.jpg" width=75 height=75><br><small>TallBuilding</small></td>
</tr>
<tr>
<th>Category name</th>
<th>Accuracy</th>
<th colspan=2>Sample training images</th>
<th colspan=2>Sample true positives</th>
<th colspan=2>False positives with true label</th>
<th colspan=2>False negatives with wrong predicted label</th>
</tr>
</table>
</center>


