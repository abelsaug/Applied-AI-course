# mis = {'10': 0.43, '20': 0.3, '140': 0.15, '120': 0.2, '30': 0.3, '50': 0.4, '40': 0.4, '60': 0.3, '70': 0.2, '90': 0.2, '80': 0.2, '100': 0.1}

# sdc = 0.1

# cannot_be_together_list = [('20', '40'), ('70', '80')]

# must_haves_list = ['20', '40', '50'])

# txn_list = [('20', '30', '80', '70', '50', '90'), ('20', '10', '80', '70'), ('10', '20', '80'), ('20', '30', '80'), ('20', '80'), ('20', '30', '80', '70', '50', '90', '100', '120', '140')]


import re
from collections import Counter
import itertools

def parse_params():
    params_file = open('parameter-file.txt')
    mis = {}
    cannot_be_together_list = []
    must_haves_list = []
    sdc = None
    for line in params_file:
        m = re.search('MIS\((\d+)\)\s=\s(\d*\.\d*)', line)
        if m is not None:
            # print "%s : %s" % (m.group(1), m.group(2))
            mis[m.group(1)] = float(m.group(2))
        else:
            m = re.search('SDC\s=\s(\d*.\d)', line)
            if m is not None:
                # print "sdc : %s" % m.group(1)
                sdc = float(m.group(1))
            else:
                m = re.search('cannot_be_together:\s(.*)\r', line)
                if m is not None:
                    items_str = m.group(1).replace('}, {', '};{')
                    item_sets = items_str.split(';')
                    for i in item_sets:
                        # print i
                        p = i.replace('{', '')
                        q = p.replace('}', '')
                        cannot_be_together_list.append(tuple(q.split(', ')))
                        # print cannot_be_together_list
                else:
                    m = re.search('must-have:\s(.*)\r', line)
                    if m is not None:
                        must_haves = m.group(1).split(' or ')
                        for i in must_haves:
                            # print i
                            must_haves_list.append(i)
                            # print must_haves_list

    return mis, sdc, cannot_be_together_list, must_haves_list


def parse_txns():
    txns_file = open('input-data.txt')
    transactions = txns_file.read().replace('{', '').replace('}', '').split('\r\n')
    txn_list = []
    for t in transactions:
        txn_list.append(tuple(t.split(', ')))
    return txn_list

def sort(mis):
    M = []
    for key, value in sorted(mis.iteritems(), key=lambda (k,v): (v,k)):
        M.append(key)
    return M

def init_pass(T,M, mis, N):
    L = []
    noItemInL = True
    single_list = [item for itemSet in T for item in itemSet]
    sup_count = Counter(single_list)
    for element in M:
        if noItemInL:
            if float(sup_count[element])/N >= mis[element]:
                noItemInL = False
                L.append(element)
                i = element
        elif float(sup_count[element])/N >= mis[i]:
            L.append(element)
    return L, sup_count

def frequent_itemSets_1(L, sup_count, N):
    F1 = []
    for i in L:
        if float(sup_count[i])/N >= mis[i]:
            F1.append(i)
    return F1

def level2CandidateGen(L, phi, sup_count, N, mis):
    C2 = []
    for i in L:
        if float(sup_count[i])/N>= mis[i]:
            indexOfI = L.index(i)
            postL = L[indexOfI+1:]
            for h in postL:
                if float(sup_count[h])/N >= mis[i] and  abs(float(sup_count[h]) - float(sup_count[i]))<= sdc:
                        C2.append([i,h])
    return C2

def MSCandidateGen(Fk1,sdc,sup_count,mis):
    Ck = []
    Fk = []
    for f1 in Fk1:
        indexOfF1 = Fk1.index(f1)
        postF1 = Fk1[indexOfF1+1:]
        for f2 in postF1:
            if f1[:-1] == f2[:-1]:
                if f1 and f2 and f1[-1]<f2[-1] and abs(float(sup_count[f1[-1]]) - float(sup_count[f2[-1]]))<=sdc:
                    c = f1
                    c.append(f2[-1])
                    Ck.append(c)
                    for s in list(itertools.combinations(c,len(c)-1)):
                        if c[0] in s or mis[c[1]]==mis[c[0]]:
                            if s not in Fk1:
                                Ck.remove(s)
    print Ck
    return Ck





if __name__ == '__main__':
    mis, sdc, cannot_be_together_list, must_haves_list =  parse_params()
    # print mis
    # print "\n"
    T  =parse_txns()
    # print T
    # print "\n"
    M =  sort(mis)
    # print M
    # print "\n"
    N= len(T)
    L, sup_count = init_pass(T,M, mis, N)
    F = []
    F.append(frequent_itemSets_1(L, sup_count, N))
    C = [F]
    k =1  #NOTE: k run one number lower as array index start from 0 
    while F[k-1]:
        print k
        Fk = []
        if k == 1:
            C.append(level2CandidateGen(L, sdc, sup_count, N, mis))
        else:
            C.append(MSCandidateGen(F[k-1],sdc, sup_count, mis))
        for c in C[k]:
            if ccount/N >= mis[c[1]]: #Update this
                Fk.append(C[k])
        F.append(Fk)
        k+=1
    print F
