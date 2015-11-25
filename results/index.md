<center>
<h1>Project 3 results visualization</h1>
<img src="confusion_matrix.png">

<br>
Accuracy (mean of diagonal of confusion matrix) is 0.6
<p>


#Experiment 
*Tiny image + k nearest neighbor
By iterating over k from 5 to 15, Found an optimized parameter k=14 with accuracy : 0.08
<img src="cm_tinynn.jpg">

* Method explanation :
1. Tiny image function resizes the original image into 16 * 16 pixels although it losses a lot of information but is is an easy way to serve as features, because it doesn't cause much computation resources.
2. k nearest neighbor merely compares the test data features to each of the train data and find the top k nearest data points. After we select k nearest data, each of the data represents a catagory such as "kitchen". Then vote for the most likely catagory


* Vocabulary building
* bag of sift + k nearest neighbor:
In bag of sift + k nearest neighbor, I iterated the step in the vl_dsift(img,'step',step) and found it reach the optimal value at step = 20
with accuracy : 0.1287
<img src="cm_bownn.jpg">

* Method explanation :
bag of sift method first build a vocabulary by classifying the descriptors (default: 400 dimensions)
then in the testing pattern count the porpotion of the 

#tried extra credits
##Experimental design extra credit:
Experiment with many different vocabulary sizes and report performance:
(with setting :
sift_sample_bow=0.9;
sift_sample_vocab=0.3;
lambda=0.00001;
)
the confusion matrix result given order:
<table border=0 cellpadding=4 cellspacing=1>
<tr>
<th><th colspan=2><img src="extra1\10.jpg" width=100 height=75> with accuracy 0.348</th>
<th><img src="extra1\20.jpg" width=10 height=75> 0.442</th>
<th colspan=2><img src="extra1\50.jpg" width=100 height=75>with accuracy 0.514</th>
<th colspan=2><img src="extra1\100.jpg" width=100 height=75>with accuracy 0.547</th>
<th colspan=2><img src="extra1\200.jpg" width=100 height=75>with accuracy 0.561</th>
<th colspan=2><img src="extra1\400.jpg" width=100 height=75>with accuracy 0.573</th>
<th colspan=2><img src="extra1\1000.jpg" width=100 height=75>with accuracy 0.589</th>
</tr>
</table>
##Randomly pick 100 training and 100 testing images for each iteration 
Accuracy of 30 trails of randomly picking 100 testing and training samples (the random method is used in the  get_image_paths_rand.m function which outputs 100 sets of both test set and train set)

<table border=0 cellpadding=4 cellspacing=1>
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
</table>

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
<td>0.380</td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0077.jpg" width=57 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Kitchen_image_0082.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0022.jpg" width=57 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Kitchen_image_0070.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/LivingRoom_image_0058.jpg" width=101 height=75><br><small>LivingRoom</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Bedroom_image_0024.jpg" width=95 height=75><br><small>Bedroom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0040.jpg" width=57 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Kitchen_image_0010.jpg" width=100 height=75><br><small>Bedroom</small></td>
</tr>
<tr>
<td>Store</td>
<td>0.350</td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0132.jpg" width=101 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Store_image_0243.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0052.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Store_image_0030.jpg" width=100 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0008.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0111.jpg" width=100 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0135.jpg" width=114 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Store_image_0115.jpg" width=100 height=75><br><small>LivingRoom</small></td>
</tr>
<tr>
<td>Bedroom</td>
<td>0.380</td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0181.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Bedroom_image_0167.jpg" width=55 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0067.jpg" width=70 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Bedroom_image_0035.jpg" width=115 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0118.jpg" width=57 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0138.jpg" width=100 height=75><br><small>Kitchen</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0053.jpg" width=110 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Bedroom_image_0141.jpg" width=101 height=75><br><small>Office</small></td>
</tr>
<tr>
<td>LivingRoom</td>
<td>0.260</td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0267.jpg" width=100 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/LivingRoom_image_0139.jpg" width=94 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0013.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/LivingRoom_image_0045.jpg" width=115 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0141.jpg" width=51 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0118.jpg" width=77 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0043.jpg" width=100 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/LivingRoom_image_0101.jpg" width=101 height=75><br><small>Store</small></td>
</tr>
<tr>
<td>Office</td>
<td>0.700</td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0051.jpg" width=110 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Office_image_0149.jpg" width=108 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0138.jpg" width=96 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Office_image_0135.jpg" width=108 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0039.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0069.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0048.jpg" width=118 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Office_image_0050.jpg" width=97 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Industrial</td>
<td>0.360</td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0183.jpg" width=54 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Industrial_image_0301.jpg" width=54 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0106.jpg" width=100 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Industrial_image_0007.jpg" width=117 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Office_image_0048.jpg" width=118 height=75><br><small>Office</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Suburb_image_0120.jpg" width=113 height=75><br><small>Suburb</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0140.jpg" width=100 height=75><br><small>InsideCity</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Industrial_image_0083.jpg" width=106 height=75><br><small>OpenCountry</small></td>
</tr>
<tr>
<td>Suburb</td>
<td>0.850</td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0145.jpg" width=113 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Suburb_image_0150.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0033.jpg" width=113 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Suburb_image_0028.jpg" width=113 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0012.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Industrial_image_0026.jpg" width=97 height=75><br><small>Industrial</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0003.jpg" width=113 height=75><br><small>LivingRoom</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Suburb_image_0139.jpg" width=113 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>InsideCity</td>
<td>0.390</td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0112.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/InsideCity_image_0234.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0100.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/InsideCity_image_0117.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0026.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0027.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0059.jpg" width=75 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/InsideCity_image_0134.jpg" width=75 height=75><br><small>Coast</small></td>
</tr>
<tr>
<td>TallBuilding</td>
<td>0.590</td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0293.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/TallBuilding_image_0089.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0098.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/TallBuilding_image_0104.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Kitchen_image_0071.jpg" width=100 height=75><br><small>Kitchen</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0002.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0092.jpg" width=75 height=75><br><small>Office</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/TallBuilding_image_0024.jpg" width=75 height=75><br><small>Kitchen</small></td>
</tr>
<tr>
<td>Street</td>
<td>0.480</td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0212.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Street_image_0019.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0111.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Street_image_0006.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/InsideCity_image_0126.jpg" width=75 height=75><br><small>InsideCity</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Store_image_0106.jpg" width=85 height=75><br><small>Store</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0090.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Street_image_0109.jpg" width=75 height=75><br><small>Store</small></td>
</tr>
<tr>
<td>Highway</td>
<td>0.740</td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0059.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Highway_image_0202.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0116.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Highway_image_0124.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0046.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0049.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0031.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Highway_image_0026.jpg" width=75 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>OpenCountry</td>
<td>0.360</td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0129.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/OpenCountry_image_0390.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0077.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/OpenCountry_image_0016.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/Street_image_0143.jpg" width=75 height=75><br><small>Street</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Coast_image_0122.jpg" width=75 height=75><br><small>Coast</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0021.jpg" width=75 height=75><br><small>Mountain</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/OpenCountry_image_0061.jpg" width=75 height=75><br><small>Mountain</small></td>
</tr>
<tr>
<td>Coast</td>
<td>0.620</td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0267.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Coast_image_0091.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0017.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Coast_image_0094.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0069.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=LightCoral><img src="thumbnails/Highway_image_0070.jpg" width=75 height=75><br><small>Highway</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0112.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Coast_image_0004.jpg" width=75 height=75><br><small>Industrial</small></td>
</tr>
<tr>
<td>Mountain</td>
<td>0.620</td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0054.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Mountain_image_0271.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0072.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Mountain_image_0095.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/TallBuilding_image_0099.jpg" width=75 height=75><br><small>TallBuilding</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0076.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0103.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Mountain_image_0005.jpg" width=75 height=75><br><small>Office</small></td>
</tr>
<tr>
<td>Forest</td>
<td>0.880</td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0287.jpg" width=75 height=75></td>
<td bgcolor=LightBlue><img src="thumbnails/Forest_image_0193.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0142.jpg" width=75 height=75></td>
<td bgcolor=LightGreen><img src="thumbnails/Forest_image_0098.jpg" width=75 height=75></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0065.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=LightCoral><img src="thumbnails/OpenCountry_image_0041.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0093.jpg" width=75 height=75><br><small>OpenCountry</small></td>
<td bgcolor=#FFBB55><img src="thumbnails/Forest_image_0109.jpg" width=75 height=75><br><small>Mountain</small></td>
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


