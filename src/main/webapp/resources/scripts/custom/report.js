
$(function() {
   
var monthsX = [ "January", "February", "March", "April", "May", "June", "July" ,"August", "September", "October", "November", "December" ];
    
var rupeeValueY = [ 61.745, 53.515, 62.685, 67.735, 60.745, 56.745, 69.453, 59.561, 51.416, 67.544, 58.465, 44.475 ];
    
 var thetooltips = new Array(rupeeValueY.length);
 var thelabels = new Array(rupeeValueY.length); 
 var thevalues = new Array(rupeeValueY.length); 
  
for ( var i = 0; i < rupeeValueY.length; i++) {
	  thelabels[i] = monthsX[i];
	  thevalues[i] = rupeeValueY[i];
	  thetooltips[i] = "<table><tr><td style='color:red;padding:0'>"
							+ monthsX[i]
							+ " : </td></tr><tr><td><span  style='color:#4897f1;padding:0'> 1USD= Value in INR : </span><span><b>"
							+ rupeeValueY[i]
							+ " INR</b></span></td></tr></table>";
      }
    
     $("#chart").chart({
					template : "line_basic_5",
					tooltips : thetooltips,
					values : {
						serie1 : thevalues
					},
					defaultSeries : {
						type : "bar"
					},
					axis : {
						l : {
							title : "Values in INR"
						}
					},
					barMargins : 10,
					labels : thelabels
				});
});

$.elycharts.templates['line_basic_5'] = {
  type : "line",
		margins : [10, 35, 70, 70],
		defaultSeries : {
			plotProps : {
				opacity : 1
						},
			startAnimation : {
				active : true,
				type : 'grow'
			},
			highlight : { 
				overlayProps : {
					fill : "#0276FA",
					opacity : 1
				}
			},
			tooltip : {
				height : 50,
				width : 200,
				padding : [ 7, 10 ],
				offset : [ -10, 0 ],
				frameProps : {
					opacity : 0.95,
					fill : "white",
					stroke : "#000"
				}
			}
		},
		series : {
			serie1 : {
				color : "#4897f1"
			}
		},
		defaultAxis : {
			labels : true,
			labelsProps : {
				fill : "#000",
				"font-size" : "13px"
			},
			labelsAnchor : "start",
			labelsRotate : 45,
			labelsMargin : 0,
			labelsDistance : 15,
			labelsHideCovered : false
		},
		axis : {

			l : {
				titleProps : {
					fill : "RED"
				},
				titleDistance : 55,
				labelsMargin : 10,
				labelsDistance : 35
			}
		},
		features : {
			tooltip : {
				positionHandler : function(env, tooltipConf, mouseAreaData,suggestedX, suggestedY) {
					return [ mouseAreaData.event.pageX,	mouseAreaData.event.pageY, true ]
				}
			},
			mousearea : {
				type : 'axis'
			},
			grid : {
				draw : true, 
				forceBorder : [ true, false, true, false ],
				ny : 7,
				nx : "auto",
				plotProps : {
					"stroke-width" : 4
				},
				props : {
					stroke : "#FAF5F7"
				},
				evenHProps : {
					fill : "#FFFFFF",
				},
				oddHProps : {
					fill : "#FAF5F7",
				},
				ticks : {
					active : [ true, true, false ],
					size : [ 10, 5 ],
					props : {
						stroke : "black"
					}
				}
			}
		}
};

