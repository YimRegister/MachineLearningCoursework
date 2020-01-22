
import pandas as pd
import numpy as np
from scipy.sparse import coo_matrix

data = pd.read_csv("links.txt",header=None)


nodes = data.iloc[:, 0].tolist() + data.iloc[:, 1].tolist()
print(nodes)

#nodes = sorted(list(set(nodes)))

nodes = [(i,nodes[i]) for i in range(len(nodes))]


for i in range(len(nodes)):

    data = data.replace(nodes[i][1], nodes[i][0])
    print(nodes[i][1],nodes[i][0])
M = coo_matrix((data.iloc[:,2], (data.iloc[:,0],data.iloc[:,1])), shape=(len(nodes), len(nodes)))
M = M.todense()
M
pd.DataFrame(M).to_csv("adjacency.csv")

# https://stackoverflow.com/questions/49095067/how-to-convert-weighted-edge-list-to-adjacency-matrix-in-python
