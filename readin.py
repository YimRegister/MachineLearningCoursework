
import csv
import numpy as np
with open('links.txt') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    links = []
    for row in csv_reader:
        links.append(row)
print(links)
'''import scipy.sparse as sparse
arr = np.array(links)
shape = tuple(arr.max(axis=0)[:2]+1)
coo = sparse.coo_matrix((arr[:, 2], (arr[:, 0], arr[:, 1])), shape=shape,
                        dtype=arr.dtype)

print(repr(coo))'''
