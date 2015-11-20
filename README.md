# Racoon Graph Library  

## How to use  

### Step 1. Init graph view with frame. 
` RCDoughnut *donutGraph = [RCDoughnut alloc] init]; ` 
` [donutGraph setFrame: customeFrame]; `  

### Step 2. Input data using setData Interface.  
` [donutGraph setData:0.65f];`

### Step 3. Add Subview the graph view.
` [view addSubView:donutGraph]; `

## Graphs  
  
### Single Bar Graph 
* Input data type: Float
* Value Range : 0 ~ 1.0
* Animation : Supported 

### Stack Bar Graph
* Input data type: Array of float
* Values Range : 0 ~ 1.0 and Sum of values must be 1.
* Animation : Supported

### Doughnut Graph
* Input data type: Float
* Value Range: 0 ~ 1.0
* Animation : Supported

### Line Graph 
* Input data type: Array of float
* Value Range: 0 ~ 100
* Animation : Not Supported

### Polar Graph 
* Input data type: Array of float
* Value Range: 0 ~ 100
* Animation : Supported

