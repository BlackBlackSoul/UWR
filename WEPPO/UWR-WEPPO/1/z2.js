for (var i = 1; i <= 100000; i++) {
    var x = (i).toString(10).split("").map(function(t){return parseInt(t)})
    var status=true;
    for (var j=0; j<x.length; j++){
        if(x[j]!=0){
           if( i%x[j]!=0){
                status=false;
                break;
           }
        }
        
    }
    if(status && (i%x.reduce((a, b) => a + b, 0))==0  ){
        console.log(i);
    }

}
   
