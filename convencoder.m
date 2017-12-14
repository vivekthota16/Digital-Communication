clc;clear all;close all
g =[1 1 1;1 0 1]
[n,k] = size(g)
m = k-1
state = zeros(1,m)
inputx = [0 1 0 1]
outputy= []
for x = 1:length(inputx)
    input = inputx(1,x)
    for i=1:n
        output(i) = g(i,1) * input
        for j=2:k
            z = g(i,j) *state(j-1)
            output(i) = xor(output(i),z)
        end
    end
    state=[input, state(1:m-1)]
    outputy = [outputy,output]
end
outputy