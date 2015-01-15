var total = 0;

function average(myarray){
  var final_total =0;
  var final_average = 0;
  for(var i = 0;len = myarray.length, i<len; i++){
     final_total = total += myarray[i];
     final_average = final_total/ myarray.length;
     console.log(final_average);
  } 
  return final_average;
}

function maximum(myarray){
	var max = Number.MIN_VALUE;
	for(var i = 0;len = myarray.length, i<len; i++){		
		if(myarray[i] > max){
			max = myarray[i];
			console.log(max);
		}
	}
	return max;
}

function minimum(myarray){
	var min = Number.MAX_VALUE;
	for(var i = 0;len = myarray.length, i<len; i++){		
		if(myarray[i] < min){
			min = myarray[i];
			console.log(min);
		}
	}
	return min;
}