# encoding:utf8
import urllib

import sys
reload(sys)
sys.setdefaultencoding('utf8')

# todo 完成测试

# todo 完成测试
def stock_day_history_Yahoo(code, market):
	"""
	雅虎股票数据接口
	得到yahoo股票的历史数据信息
	深市数据链接：http://table.finance.yahoo.com/table.csv?s=000001.sz
	上市数据链接：http://table.finance.yahoo.com/table.csv?s=600000.ss
	Date 日期
	Open 开盘价格
	High 最高价格
	Low  最低价格
	Close 结束价格
	Volume 量
	Adj Close 收盘加权价格
	"""
	if market not in ('sz', 'ss'):
		return
	url = "http://table.finance.yahoo.com/table.csv?s=%s.%s" % (code, market)
	content = urllib.urlopen(url)
	hgh = -1
	low = -1
	lst = []
	if content:
		content.readline()
		for i, row in enumerate(content.readlines()):
			row = row.split(',')
			cc = float(row[4])
			lst.append(cc)
			if i == 0:
				hgh = low = cc
			else:
				if cc>hgh:
					hgh = cc
				if cc<low:
					low = cc
			if i > 200:
				break
	lst.reverse()
	return hgh, low, lst

def getNm(hh,ll,cc):
	return int((cc-ll)/(hh-ll)*40)

num = sys.argv[1]
ma = "sz"
if (num[0]=='6'):
	ma = "ss"

#h, l, socks = stock_day_history_Yahoo('600362','ss')
h, l, socks = stock_day_history_Yahoo(num,ma)
# print str(h) + " " + str(l)
# print socks

ss = socks
for i,sock in enumerate(socks):
	ss[i] = getNm(h,l,sock)
# print ss
iss = iter(ss)
bef = -1
sss = []
for i,sock in enumerate(ss):
	if i == 0:
		sss.append(sock)
	else:
		if sock != sss[-1]:
			sss.append(sock)
# print sss

ssss = []
for i,sock in enumerate(sss):
	if i == 0:
		ssss.append(sock)
	if i == 1:
		ssss.append(sock-sss[0])
	else:
		sock2 = sss[i] - sss[i-1]
		if (sock2 * ssss[-1] > 0):
			ssss[-1] += sock2
		else:
			if sock2==1 or sock2==-1 or sock2==0 or  sock2==2 or sock2==-2:
				ssss[-1] += sock2
			else:
				ssss.append(sock2)
ssss[0]=sss[0]
# print ssss

sss=ssss
ssss = []
for i,sock in enumerate(sss):
	if i == 0:
		ssss.append(sock)
	else:
		sock2 = sock
		if (sock2 * ssss[-1] > 0):
			ssss[-1] += sock2
		else:
			if sock2==1 or sock2==-1 or sock2==0 or  sock2==2 or sock2==-2:
				pass
			else:
				ssss.append(sock2)
ssss[0]=sss[0]
# print ssss

mlist = []
slist = [' '] * 50
cur = ssss[0]

for i,sock in enumerate(ssss):
	if i == 0:
		cur = ssss[0]
	else:
		if ssss[i] > 0:
			sl = [' ']*(cur+1)+ ['x']*(ssss[i]-1)
			mlist.append(sl)
			cur += ssss[i]
		else:
			sl = [' ']*(cur+ssss[i]) + ['o']*(-ssss[i]-1)
			mlist.append(sl)
			cur += ssss[i]

for i,lst in enumerate(mlist):
	str1 = ''
	print str1.join(lst)

print "\n"
#print str(l) + " "*12 + str((h+l)/2) + " "*12 + str(h)
print ("%.2f"%l) + " "*12 + ("%.2f"%((h+l)/2)) + " "*12 + ("%.2f"%h)
