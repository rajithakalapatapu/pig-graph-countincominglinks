/*

Project Description:

You are asked to implement a simple graph algorithm using Apache Pig. Your Pig script should read an input graph as in project 3: a directed graph is represented in the input text file using one line per graph vertex. For example, the line

1,2,3,4,5,6,7

represents the vertex with ID 1, which is linked to the vertices with IDs 2, 3, 4, 5, 6, and 7.
Then, your Pig script should calculate the number of incoming links for each graph vertex and should sort the nodes by the number of their incoming links in descending order, so that the first node is the one that has the most incoming links. Your output should be written in a text file where each line contains a node ID and the number of its incoming links.

In your Pig script, you can access the path of the input graph as '$G' and the output path as '$O'. That is, you can use LOAD '$G' USING ..., to load the graph and STORE X INTO '$O' ..., to write the relation X to the output directory.

*/

G = LOAD '$G' USING PigStorage(',') AS (x:int,y:int);
GROUPING = GROUP G BY y;
GROUPING_COUNT = FOREACH GROUPING GENERATE group, COUNT($1);
GROUPING_SORT = ORDER GROUPING_COUNT BY $1 DESC;
STORE GROUPING_SORT INTO '$O' USING PigStorage(',');

