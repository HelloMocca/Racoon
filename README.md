# Racoon Chart Library  

## How to use  

### Step 1. Init graph view with frame. 
` RCGauge *gaugeChart = [RCGauge alloc] init]; `   
` [gaugeChart setFrame: customeFrame]; `  

### Step 2. Input data using setData Interface.  
` [gaugeChart setData:0.65f];`

### Step 3. Add Subview the graph view.
` [view addSubView:gaugeChart]; `

## Graphs  
  
### Single Bar Chart 
* Input data type: Float
* Value Range : 0 ~ 1.0
* Animation : Supported 
* wiki : [Single Bar Chart](https://github.com/HelloMocca/Racoon/wiki/SingleBar)

### Stack Bar Chart
* Input data type: Array of float
* Values Range : 0 ~ 1.0 and Sum of values must be 1.
* Animation : Supported
* wiki : [Stack Bar Chart](https://github.com/HelloMocca/Racoon/wiki/StackBar)

### Gauge Chart
* Input data type: Float
* Value Range: 0 ~ 1.0
* Animation : Supported
* wiki : [Gauge Chart](https://github.com/HelloMocca/Racoon/wiki/Gauge)

### Line Chart
* Input data type: Array of float
* Value Range: 0 ~ 100
* Animation : Not Supported

### Polar Chart 
* Input data type: Array of float
* Value Range: 0 ~ 100
* Animation : Supported

### Pie Chart [NOT COMPLETED]

