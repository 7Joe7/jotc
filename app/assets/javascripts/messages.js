var displayArray = function(array) {
    textFont(createFont("monospace"), 12);
    text("ahoj", 15, 50);
    text(array, 15, 50)
};

var swap = function(array, index1, index2) {
    var mem = array[index1];
    array[index1] = array[index2];
    array[index2] = mem;
};

var findMin = function(array, startIndex) {
var minValue = array[startIndex];
var minIndex = startIndex;
for (var i = startIndex + 1; i < array.length; i++) {
	if (array[i] < minValue) {
	minValue = array[i];
		minIndex = i;
}
}
return minIndex;
};

var selectionSort = function(array) {
	for (var j = 0; j < array.length; j++) {
	displayArray(array);
swap(array, j, findMin(array, j));
}
return array;
};

var array = [2, 1];
array = selectionSort(array);