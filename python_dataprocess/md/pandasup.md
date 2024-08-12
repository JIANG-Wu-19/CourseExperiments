```python
import numpy as np
import pandas as pd
```


```python
data = pd.Series(np.random.randn(9), index=[['a', 'a', 'a', 'b', 'b', 'c', 'c', 'd', 'd'], [1, 2, 3, 1, 3, 1, 2, 2, 3]])
data
```




    a  1   -0.018841
       2    0.291057
       3   -0.869647
    b  1    0.500437
       3   -1.678710
    c  1   -1.957127
       2   -0.563527
    d  2    0.454833
       3   -0.343765
    dtype: float64




```python
data.index
```




    MultiIndex([('a', 1),
                ('a', 2),
                ('a', 3),
                ('b', 1),
                ('b', 3),
                ('c', 1),
                ('c', 2),
                ('d', 2),
                ('d', 3)],
               )




```python
data['b']
```




    1    0.500437
    3   -1.678710
    dtype: float64




```python
data['b':'c']
```




    b  1    0.500437
       3   -1.678710
    c  1   -1.957127
       2   -0.563527
    dtype: float64




```python
data.loc[['b','d']]
```




    b  1    0.500437
       3   -1.678710
    d  2    0.454833
       3   -0.343765
    dtype: float64




```python
data.loc[:,2]
```




    a    0.291057
    c   -0.563527
    d    0.454833
    dtype: float64




```python
frame = pd.DataFrame(np.arange(12).reshape((4, 3)), index=[['a', 'a', 'b', 'b'], [1, 2, 1, 2]],                 columns=[['Ohio', 'Ohio', 'Colorado'], ['Green', 'Red', 'Green']])
```


```python
frame
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th></th>
      <th colspan="2" halign="left">Ohio</th>
      <th>Colorado</th>
    </tr>
    <tr>
      <th></th>
      <th></th>
      <th>Green</th>
      <th>Red</th>
      <th>Green</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2" valign="top">a</th>
      <th>1</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>4</td>
      <td>5</td>
    </tr>
    <tr>
      <th rowspan="2" valign="top">b</th>
      <th>1</th>
      <td>6</td>
      <td>7</td>
      <td>8</td>
    </tr>
    <tr>
      <th>2</th>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
frame.index.names = ['key1', 'key2']
frame.columns.names = ['state', 'color']
frame
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th>state</th>
      <th colspan="2" halign="left">Ohio</th>
      <th>Colorado</th>
    </tr>
    <tr>
      <th></th>
      <th>color</th>
      <th>Green</th>
      <th>Red</th>
      <th>Green</th>
    </tr>
    <tr>
      <th>key1</th>
      <th>key2</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2" valign="top">a</th>
      <th>1</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>4</td>
      <td>5</td>
    </tr>
    <tr>
      <th rowspan="2" valign="top">b</th>
      <th>1</th>
      <td>6</td>
      <td>7</td>
      <td>8</td>
    </tr>
    <tr>
      <th>2</th>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
frame['Ohio']
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>color</th>
      <th>Green</th>
      <th>Red</th>
    </tr>
    <tr>
      <th>key1</th>
      <th>key2</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2" valign="top">a</th>
      <th>1</th>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>4</td>
    </tr>
    <tr>
      <th rowspan="2" valign="top">b</th>
      <th>1</th>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>2</th>
      <td>9</td>
      <td>10</td>
    </tr>
  </tbody>
</table>
</div>




```python
from pandas import *
MultiIndex.from_arrays([['Ohio', 'Ohio', 'Colorado'], ['Green', 'Red', 'Green']], names=['state', 'color'])
```




    MultiIndex([(    'Ohio', 'Green'),
                (    'Ohio',   'Red'),
                ('Colorado', 'Green')],
               names=['state', 'color'])




```python
frame.swaplevel('key1', 'key2')
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th>state</th>
      <th colspan="2" halign="left">Ohio</th>
      <th>Colorado</th>
    </tr>
    <tr>
      <th></th>
      <th>color</th>
      <th>Green</th>
      <th>Red</th>
      <th>Green</th>
    </tr>
    <tr>
      <th>key2</th>
      <th>key1</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <th>a</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <th>a</th>
      <td>3</td>
      <td>4</td>
      <td>5</td>
    </tr>
    <tr>
      <th>1</th>
      <th>b</th>
      <td>6</td>
      <td>7</td>
      <td>8</td>
    </tr>
    <tr>
      <th>2</th>
      <th>b</th>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
frame.sort_index(level=1)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th>state</th>
      <th colspan="2" halign="left">Ohio</th>
      <th>Colorado</th>
    </tr>
    <tr>
      <th></th>
      <th>color</th>
      <th>Green</th>
      <th>Red</th>
      <th>Green</th>
    </tr>
    <tr>
      <th>key1</th>
      <th>key2</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <th>1</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>b</th>
      <th>1</th>
      <td>6</td>
      <td>7</td>
      <td>8</td>
    </tr>
    <tr>
      <th>a</th>
      <th>2</th>
      <td>3</td>
      <td>4</td>
      <td>5</td>
    </tr>
    <tr>
      <th>b</th>
      <th>2</th>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
frame.swaplevel(0, 1).sort_index(level=0)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th>state</th>
      <th colspan="2" halign="left">Ohio</th>
      <th>Colorado</th>
    </tr>
    <tr>
      <th></th>
      <th>color</th>
      <th>Green</th>
      <th>Red</th>
      <th>Green</th>
    </tr>
    <tr>
      <th>key2</th>
      <th>key1</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2" valign="top">1</th>
      <th>a</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>b</th>
      <td>6</td>
      <td>7</td>
      <td>8</td>
    </tr>
    <tr>
      <th rowspan="2" valign="top">2</th>
      <th>a</th>
      <td>3</td>
      <td>4</td>
      <td>5</td>
    </tr>
    <tr>
      <th>b</th>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
frame.sum(level='key2')
```

    C:\Users\HP\AppData\Local\Temp\ipykernel_21392\2004046222.py:1: FutureWarning: Using the level keyword in DataFrame and Series aggregations is deprecated and will be removed in a future version. Use groupby instead. df.sum(level=1) should use df.groupby(level=1).sum().
      frame.sum(level='key2')
    




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th>state</th>
      <th colspan="2" halign="left">Ohio</th>
      <th>Colorado</th>
    </tr>
    <tr>
      <th>color</th>
      <th>Green</th>
      <th>Red</th>
      <th>Green</th>
    </tr>
    <tr>
      <th>key2</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>6</td>
      <td>8</td>
      <td>10</td>
    </tr>
    <tr>
      <th>2</th>
      <td>12</td>
      <td>14</td>
      <td>16</td>
    </tr>
  </tbody>
</table>
</div>




```python
frame.sum(level='color', axis=1)
```

    C:\Users\HP\AppData\Local\Temp\ipykernel_21392\4133796543.py:1: FutureWarning: Using the level keyword in DataFrame and Series aggregations is deprecated and will be removed in a future version. Use groupby instead. df.sum(level=1) should use df.groupby(level=1).sum().
      frame.sum(level='color', axis=1)
    




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>color</th>
      <th>Green</th>
      <th>Red</th>
    </tr>
    <tr>
      <th>key1</th>
      <th>key2</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2" valign="top">a</th>
      <th>1</th>
      <td>2</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>8</td>
      <td>4</td>
    </tr>
    <tr>
      <th rowspan="2" valign="top">b</th>
      <th>1</th>
      <td>14</td>
      <td>7</td>
    </tr>
    <tr>
      <th>2</th>
      <td>20</td>
      <td>10</td>
    </tr>
  </tbody>
</table>
</div>




```python
frame.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th>state</th>
      <th colspan="2" halign="left">Ohio</th>
      <th>Colorado</th>
    </tr>
    <tr>
      <th>color</th>
      <th>Green</th>
      <th>Red</th>
      <th>Green</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>4.000000</td>
      <td>4.000000</td>
      <td>4.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>4.500000</td>
      <td>5.500000</td>
      <td>6.500000</td>
    </tr>
    <tr>
      <th>std</th>
      <td>3.872983</td>
      <td>3.872983</td>
      <td>3.872983</td>
    </tr>
    <tr>
      <th>min</th>
      <td>0.000000</td>
      <td>1.000000</td>
      <td>2.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>2.250000</td>
      <td>3.250000</td>
      <td>4.250000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>4.500000</td>
      <td>5.500000</td>
      <td>6.500000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>6.750000</td>
      <td>7.750000</td>
      <td>8.750000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>9.000000</td>
      <td>10.000000</td>
      <td>11.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
frame = pd.DataFrame({'a': range(7), 'b': range(7, 0, -1), 'c': ['one', 'one', 'one', 'two', 'two', 'two', 'two'], 'd': [0, 1, 2, 0, 1, 2, 3]})
```


```python
frame
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>7</td>
      <td>one</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>6</td>
      <td>one</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>5</td>
      <td>one</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>4</td>
      <td>two</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>3</td>
      <td>two</td>
      <td>1</td>
    </tr>
    <tr>
      <th>5</th>
      <td>5</td>
      <td>2</td>
      <td>two</td>
      <td>2</td>
    </tr>
    <tr>
      <th>6</th>
      <td>6</td>
      <td>1</td>
      <td>two</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>




```python
frame2 = frame.set_index(['c', 'd'])
frame2
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th></th>
      <th>a</th>
      <th>b</th>
    </tr>
    <tr>
      <th>c</th>
      <th>d</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="3" valign="top">one</th>
      <th>0</th>
      <td>0</td>
      <td>7</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>6</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>5</td>
    </tr>
    <tr>
      <th rowspan="4" valign="top">two</th>
      <th>0</th>
      <td>3</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4</td>
      <td>3</td>
    </tr>
    <tr>
      <th>2</th>
      <td>5</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>6</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
frame.set_index(['c', 'd'], drop=False)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
    </tr>
    <tr>
      <th>c</th>
      <th>d</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="3" valign="top">one</th>
      <th>0</th>
      <td>0</td>
      <td>7</td>
      <td>one</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>6</td>
      <td>one</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>5</td>
      <td>one</td>
      <td>2</td>
    </tr>
    <tr>
      <th rowspan="4" valign="top">two</th>
      <th>0</th>
      <td>3</td>
      <td>4</td>
      <td>two</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4</td>
      <td>3</td>
      <td>two</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>5</td>
      <td>2</td>
      <td>two</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>6</td>
      <td>1</td>
      <td>two</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>




```python
frame2.reset_index()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>c</th>
      <th>d</th>
      <th>a</th>
      <th>b</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>one</td>
      <td>0</td>
      <td>0</td>
      <td>7</td>
    </tr>
    <tr>
      <th>1</th>
      <td>one</td>
      <td>1</td>
      <td>1</td>
      <td>6</td>
    </tr>
    <tr>
      <th>2</th>
      <td>one</td>
      <td>2</td>
      <td>2</td>
      <td>5</td>
    </tr>
    <tr>
      <th>3</th>
      <td>two</td>
      <td>0</td>
      <td>3</td>
      <td>4</td>
    </tr>
    <tr>
      <th>4</th>
      <td>two</td>
      <td>1</td>
      <td>4</td>
      <td>3</td>
    </tr>
    <tr>
      <th>5</th>
      <td>two</td>
      <td>2</td>
      <td>5</td>
      <td>2</td>
    </tr>
    <tr>
      <th>6</th>
      <td>two</td>
      <td>3</td>
      <td>6</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
import pandas as pd
import numpy as np
df1 = pd.DataFrame({'key': ['b', 'b', 'a', 'c', 'a', 'a', 'b'], 'data1': range(7)})
df2 = pd.DataFrame({'key': ['a', 'b', 'd'], 'data2': range(3)})
```


```python
df1
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>data1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>b</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>a</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>c</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>a</td>
      <td>4</td>
    </tr>
    <tr>
      <th>5</th>
      <td>a</td>
      <td>5</td>
    </tr>
    <tr>
      <th>6</th>
      <td>b</td>
      <td>6</td>
    </tr>
  </tbody>
</table>
</div>




```python
df2
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>data2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>a</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>d</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.merge(df1,df2)

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>data1</th>
      <th>data2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>b</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>b</td>
      <td>6</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>a</td>
      <td>2</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>a</td>
      <td>4</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>a</td>
      <td>5</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.merge(df1,df2,on='key')
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>data1</th>
      <th>data2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>b</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>b</td>
      <td>6</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>a</td>
      <td>2</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>a</td>
      <td>4</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>a</td>
      <td>5</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df3 = pd.DataFrame({'lkey': ['b', 'b', 'a', 'c', 'a', 'a', 'b'], 'data1': range(7)})
df4 = pd.DataFrame({'rkey': ['a', 'b', 'd'], 'data2': range(3)})
pd.merge(df3, df4, left_on='lkey', right_on='rkey')  #分别指定列名
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>lkey</th>
      <th>data1</th>
      <th>rkey</th>
      <th>data2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>b</td>
      <td>0</td>
      <td>b</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1</td>
      <td>b</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>b</td>
      <td>6</td>
      <td>b</td>
      <td>1</td>
    </tr>
    <tr>
      <th>3</th>
      <td>a</td>
      <td>2</td>
      <td>a</td>
      <td>0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>a</td>
      <td>4</td>
      <td>a</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>a</td>
      <td>5</td>
      <td>a</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df3
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>lkey</th>
      <th>data1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>b</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>a</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>c</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>a</td>
      <td>4</td>
    </tr>
    <tr>
      <th>5</th>
      <td>a</td>
      <td>5</td>
    </tr>
    <tr>
      <th>6</th>
      <td>b</td>
      <td>6</td>
    </tr>
  </tbody>
</table>
</div>




```python
df4
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>rkey</th>
      <th>data2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>a</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>d</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.merge(df1,df2,how='outer') 
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>data1</th>
      <th>data2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>b</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>b</td>
      <td>6.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>a</td>
      <td>2.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>a</td>
      <td>4.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>a</td>
      <td>5.0</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>c</td>
      <td>3.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>7</th>
      <td>d</td>
      <td>NaN</td>
      <td>2.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.merge(df1,df2,how='left')

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>data1</th>
      <th>data2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>b</td>
      <td>0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>a</td>
      <td>2</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>c</td>
      <td>3</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>a</td>
      <td>4</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>a</td>
      <td>5</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>b</td>
      <td>6</td>
      <td>1.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.merge(df1,df2,how='right') 

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>data1</th>
      <th>data2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>a</td>
      <td>2.0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>a</td>
      <td>4.0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>a</td>
      <td>5.0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>b</td>
      <td>0.0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>b</td>
      <td>1.0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>5</th>
      <td>b</td>
      <td>6.0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>6</th>
      <td>d</td>
      <td>NaN</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>




```python
df1
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>data1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>b</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>a</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>c</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>a</td>
      <td>4</td>
    </tr>
    <tr>
      <th>5</th>
      <td>a</td>
      <td>5</td>
    </tr>
    <tr>
      <th>6</th>
      <td>b</td>
      <td>6</td>
    </tr>
  </tbody>
</table>
</div>




```python
df2
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>data2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>a</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>d</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>




```python
left = pd.DataFrame({'key1': ['foo', 'foo', 'bar'], 'key2': ['one', 'two', 'one'], 'lval': [1, 2, 3]})
right = pd.DataFrame({'key1': ['foo', 'foo', 'bar', 'bar'], 'key2': ['one', 'one', 'one', 'two'], 'rval': [4, 5, 6, 7]})
pd.merge(left, right, on=['key1', 'key2'], how='outer')

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2</th>
      <th>lval</th>
      <th>rval</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>foo</td>
      <td>one</td>
      <td>1.0</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>foo</td>
      <td>one</td>
      <td>1.0</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>foo</td>
      <td>two</td>
      <td>2.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>bar</td>
      <td>one</td>
      <td>3.0</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>bar</td>
      <td>two</td>
      <td>NaN</td>
      <td>7.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.merge(left, right, on='key1')

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2_x</th>
      <th>lval</th>
      <th>key2_y</th>
      <th>rval</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>foo</td>
      <td>one</td>
      <td>1</td>
      <td>one</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>foo</td>
      <td>one</td>
      <td>1</td>
      <td>one</td>
      <td>5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>foo</td>
      <td>two</td>
      <td>2</td>
      <td>one</td>
      <td>4</td>
    </tr>
    <tr>
      <th>3</th>
      <td>foo</td>
      <td>two</td>
      <td>2</td>
      <td>one</td>
      <td>5</td>
    </tr>
    <tr>
      <th>4</th>
      <td>bar</td>
      <td>one</td>
      <td>3</td>
      <td>one</td>
      <td>6</td>
    </tr>
    <tr>
      <th>5</th>
      <td>bar</td>
      <td>one</td>
      <td>3</td>
      <td>two</td>
      <td>7</td>
    </tr>
  </tbody>
</table>
</div>




```python
left
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2</th>
      <th>lval</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>foo</td>
      <td>one</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>foo</td>
      <td>two</td>
      <td>2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>bar</td>
      <td>one</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>




```python
right
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2</th>
      <th>rval</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>foo</td>
      <td>one</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>foo</td>
      <td>one</td>
      <td>5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>bar</td>
      <td>one</td>
      <td>6</td>
    </tr>
    <tr>
      <th>3</th>
      <td>bar</td>
      <td>two</td>
      <td>7</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.merge(left, right, on='key1', suffixes=('_left', '_right')) 

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2_left</th>
      <th>lval</th>
      <th>key2_right</th>
      <th>rval</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>foo</td>
      <td>one</td>
      <td>1</td>
      <td>one</td>
      <td>4</td>
    </tr>
    <tr>
      <th>1</th>
      <td>foo</td>
      <td>one</td>
      <td>1</td>
      <td>one</td>
      <td>5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>foo</td>
      <td>two</td>
      <td>2</td>
      <td>one</td>
      <td>4</td>
    </tr>
    <tr>
      <th>3</th>
      <td>foo</td>
      <td>two</td>
      <td>2</td>
      <td>one</td>
      <td>5</td>
    </tr>
    <tr>
      <th>4</th>
      <td>bar</td>
      <td>one</td>
      <td>3</td>
      <td>one</td>
      <td>6</td>
    </tr>
    <tr>
      <th>5</th>
      <td>bar</td>
      <td>one</td>
      <td>3</td>
      <td>two</td>
      <td>7</td>
    </tr>
  </tbody>
</table>
</div>




```python
import pandas as pd
left1 = pd.DataFrame({'key': ['a', 'b', 'a', 'a', 'b', 'c'], 'value': range(6)})
right1 = pd.DataFrame({'group_val': [3.5, 7]}, index=['a', 'b'])
left1


```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>a</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>a</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>a</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>b</td>
      <td>4</td>
    </tr>
    <tr>
      <th>5</th>
      <td>c</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
right1
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>group_val</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>3.5</td>
    </tr>
    <tr>
      <th>b</th>
      <td>7.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.merge(left1, right1, left_on='key', right_index=True)

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>value</th>
      <th>group_val</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>a</td>
      <td>0</td>
      <td>3.5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>a</td>
      <td>2</td>
      <td>3.5</td>
    </tr>
    <tr>
      <th>3</th>
      <td>a</td>
      <td>3</td>
      <td>3.5</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>b</td>
      <td>4</td>
      <td>7.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
import pandas as pd
```


```python
import numpy as np
lefth = pd.DataFrame({'key1': ['Ohio', 'Ohio', 'Ohio', 'Nevada', 'Nevada'], 'key2': [2000, 2001, 2002, 2001, 2002], 'data': np.arange(5.)})
righth = pd.DataFrame(np.arange(12).reshape((6, 2)),  index=[['Nevada', 'Nevada', 'Ohio', 'Ohio', 'Ohio', 'Ohio'], [2001, 2000, 2000, 2000, 2001, 2002]], columns=['event1', 'event2'])
lefth

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2</th>
      <th>data</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Ohio</td>
      <td>2000</td>
      <td>0.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Ohio</td>
      <td>2001</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Ohio</td>
      <td>2002</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Nevada</td>
      <td>2001</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Nevada</td>
      <td>2002</td>
      <td>4.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
righth
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th></th>
      <th>event1</th>
      <th>event2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2" valign="top">Nevada</th>
      <th>2001</th>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2000</th>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th rowspan="4" valign="top">Ohio</th>
      <th>2000</th>
      <td>4</td>
      <td>5</td>
    </tr>
    <tr>
      <th>2000</th>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>2001</th>
      <td>8</td>
      <td>9</td>
    </tr>
    <tr>
      <th>2002</th>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.merge(lefth, righth, left_on=['key1', 'key2'], right_index=True)

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2</th>
      <th>data</th>
      <th>event1</th>
      <th>event2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Ohio</td>
      <td>2000</td>
      <td>0.0</td>
      <td>4</td>
      <td>5</td>
    </tr>
    <tr>
      <th>0</th>
      <td>Ohio</td>
      <td>2000</td>
      <td>0.0</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Ohio</td>
      <td>2001</td>
      <td>1.0</td>
      <td>8</td>
      <td>9</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Ohio</td>
      <td>2002</td>
      <td>2.0</td>
      <td>10</td>
      <td>11</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Nevada</td>
      <td>2001</td>
      <td>3.0</td>
      <td>0</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.merge(lefth, righth, left_on=['key1', 'key2'], right_index=True, how='outer')

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2</th>
      <th>data</th>
      <th>event1</th>
      <th>event2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Ohio</td>
      <td>2000</td>
      <td>0.0</td>
      <td>4.0</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>0</th>
      <td>Ohio</td>
      <td>2000</td>
      <td>0.0</td>
      <td>6.0</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Ohio</td>
      <td>2001</td>
      <td>1.0</td>
      <td>8.0</td>
      <td>9.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Ohio</td>
      <td>2002</td>
      <td>2.0</td>
      <td>10.0</td>
      <td>11.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Nevada</td>
      <td>2001</td>
      <td>3.0</td>
      <td>0.0</td>
      <td>1.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Nevada</td>
      <td>2002</td>
      <td>4.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Nevada</td>
      <td>2000</td>
      <td>NaN</td>
      <td>2.0</td>
      <td>3.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
left2 = pd.DataFrame([[1., 2.], [3., 4.], [5., 6.]], index=['a', 'c', 'e'], columns=['Ohio', 'Nevada'])
right2 = pd.DataFrame([[7., 8.], [9., 10.], [11., 12.], [13, 14]], index=['b', 'c', 'd', 'e'], columns=['Missouri', 'Alabama'])
left2         

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Ohio</th>
      <th>Nevada</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>1.0</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>c</th>
      <td>3.0</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>e</th>
      <td>5.0</td>
      <td>6.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
right2
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Missouri</th>
      <th>Alabama</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>b</th>
      <td>7.0</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>c</th>
      <td>9.0</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>d</th>
      <td>11.0</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>e</th>
      <td>13.0</td>
      <td>14.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.merge(left2, right2, how='outer', left_index=True, right_index=True)

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Ohio</th>
      <th>Nevada</th>
      <th>Missouri</th>
      <th>Alabama</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>1.0</td>
      <td>2.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>b</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>7.0</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>c</th>
      <td>3.0</td>
      <td>4.0</td>
      <td>9.0</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>d</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>11.0</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>e</th>
      <td>5.0</td>
      <td>6.0</td>
      <td>13.0</td>
      <td>14.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
left2.join(right2, how='outer')

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Ohio</th>
      <th>Nevada</th>
      <th>Missouri</th>
      <th>Alabama</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>1.0</td>
      <td>2.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>b</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>7.0</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>c</th>
      <td>3.0</td>
      <td>4.0</td>
      <td>9.0</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>d</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>11.0</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>e</th>
      <td>5.0</td>
      <td>6.0</td>
      <td>13.0</td>
      <td>14.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
another = pd.DataFrame([[7., 8.], [9., 10.], [11., 12.], [16., 17.]], index=['a', 'c', 'e', 'f'],                     columns=['New York', 'Oregon'])
another

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>New York</th>
      <th>Oregon</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>7.0</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>c</th>
      <td>9.0</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>e</th>
      <td>11.0</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>f</th>
      <td>16.0</td>
      <td>17.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
left2.join(right2)

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Ohio</th>
      <th>Nevada</th>
      <th>Missouri</th>
      <th>Alabama</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>1.0</td>
      <td>2.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>c</th>
      <td>3.0</td>
      <td>4.0</td>
      <td>9.0</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>e</th>
      <td>5.0</td>
      <td>6.0</td>
      <td>13.0</td>
      <td>14.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
left2.join([right2, another])

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Ohio</th>
      <th>Nevada</th>
      <th>Missouri</th>
      <th>Alabama</th>
      <th>New York</th>
      <th>Oregon</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>1.0</td>
      <td>2.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>7.0</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>c</th>
      <td>3.0</td>
      <td>4.0</td>
      <td>9.0</td>
      <td>10.0</td>
      <td>9.0</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>e</th>
      <td>5.0</td>
      <td>6.0</td>
      <td>13.0</td>
      <td>14.0</td>
      <td>11.0</td>
      <td>12.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
left2.join([right2, another], how='outer')

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Ohio</th>
      <th>Nevada</th>
      <th>Missouri</th>
      <th>Alabama</th>
      <th>New York</th>
      <th>Oregon</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>1.0</td>
      <td>2.0</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>7.0</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>c</th>
      <td>3.0</td>
      <td>4.0</td>
      <td>9.0</td>
      <td>10.0</td>
      <td>9.0</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>e</th>
      <td>5.0</td>
      <td>6.0</td>
      <td>13.0</td>
      <td>14.0</td>
      <td>11.0</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>b</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>7.0</td>
      <td>8.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>d</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>11.0</td>
      <td>12.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>f</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>16.0</td>
      <td>17.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
s1 = pd.Series([0, 1], index=['a', 'b'])
s2 = pd.Series([2, 3, 4], index=['c', 'd', 'e'])
s3 = pd.Series([5, 6], index=['f', 'g'])
pd.concat([s1, s2, s3])

```




    a    0
    b    1
    c    2
    d    3
    e    4
    f    5
    g    6
    dtype: int64




```python
pd.concat([s1, s2, s3], axis=1) #变为DataFrame

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
      <th>2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>b</th>
      <td>1.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>c</th>
      <td>NaN</td>
      <td>2.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>d</th>
      <td>NaN</td>
      <td>3.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>e</th>
      <td>NaN</td>
      <td>4.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>f</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>g</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>6.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
s4 = pd.concat([s1, s3])
s4

```




    a    0
    b    1
    f    5
    g    6
    dtype: int64




```python
pd.concat([s1, s4], axis=1)

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0.0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>b</th>
      <td>1.0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>f</th>
      <td>NaN</td>
      <td>5</td>
    </tr>
    <tr>
      <th>g</th>
      <td>NaN</td>
      <td>6</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.concat([s1, s4], axis=1, join='inner')

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>b</th>
      <td>1</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.concat([s1, s4], axis=1, join_axes=[['a', 'c', 'b', 'e']])

```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    Input In [20], in <cell line: 1>()
    ----> 1 pd.concat([s1, s4], axis=1, join_axes=[['a', 'c', 'b', 'e']])
    

    File E:\anaconda\lib\site-packages\pandas\util\_decorators.py:311, in deprecate_nonkeyword_arguments.<locals>.decorate.<locals>.wrapper(*args, **kwargs)
        305 if len(args) > num_allow_args:
        306     warnings.warn(
        307         msg.format(arguments=arguments),
        308         FutureWarning,
        309         stacklevel=stacklevel,
        310     )
    --> 311 return func(*args, **kwargs)
    

    TypeError: concat() got an unexpected keyword argument 'join_axes'



```python
result = pd.concat([s1, s1, s3], keys=['one', 'two', 'three'])
result

```




    one    a    0
           b    1
    two    a    0
           b    1
    three  f    5
           g    6
    dtype: int64




```python
result.unstack()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>f</th>
      <th>g</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>one</th>
      <td>0.0</td>
      <td>1.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>two</th>
      <td>0.0</td>
      <td>1.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>three</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>5.0</td>
      <td>6.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.concat([s1, s2, s3], axis=1, keys=['one', 'two', 'three'])

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>one</th>
      <th>two</th>
      <th>three</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>b</th>
      <td>1.0</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>c</th>
      <td>NaN</td>
      <td>2.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>d</th>
      <td>NaN</td>
      <td>3.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>e</th>
      <td>NaN</td>
      <td>4.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>f</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>g</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>6.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df1 = pd.DataFrame(np.arange(6).reshape(3, 2), index=['a', 'b', 'c'], columns=['one', 'two'])
df2 = pd.DataFrame(5 + np.arange(4).reshape(2, 2), index=['a', 'c'], columns=['three', 'four'])
df1

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>one</th>
      <th>two</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>b</th>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>c</th>
      <td>4</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
df2
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>three</th>
      <th>four</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>5</td>
      <td>6</td>
    </tr>
    <tr>
      <th>c</th>
      <td>7</td>
      <td>8</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.concat([df1, df2], axis=1, keys=['level1', 'level2'])

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th colspan="2" halign="left">level1</th>
      <th colspan="2" halign="left">level2</th>
    </tr>
    <tr>
      <th></th>
      <th>one</th>
      <th>two</th>
      <th>three</th>
      <th>four</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0</td>
      <td>1</td>
      <td>5.0</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>b</th>
      <td>2</td>
      <td>3</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>c</th>
      <td>4</td>
      <td>5</td>
      <td>7.0</td>
      <td>8.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.concat({'level1': df1, 'level2': df2}, axis=1)

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th colspan="2" halign="left">level1</th>
      <th colspan="2" halign="left">level2</th>
    </tr>
    <tr>
      <th></th>
      <th>one</th>
      <th>two</th>
      <th>three</th>
      <th>four</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0</td>
      <td>1</td>
      <td>5.0</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>b</th>
      <td>2</td>
      <td>3</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>c</th>
      <td>4</td>
      <td>5</td>
      <td>7.0</td>
      <td>8.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.concat([df1, df2], axis=1, keys=['level1', 'level2'], names=['upper', 'lower'])

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th>upper</th>
      <th colspan="2" halign="left">level1</th>
      <th colspan="2" halign="left">level2</th>
    </tr>
    <tr>
      <th>lower</th>
      <th>one</th>
      <th>two</th>
      <th>three</th>
      <th>four</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0</td>
      <td>1</td>
      <td>5.0</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>b</th>
      <td>2</td>
      <td>3</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>c</th>
      <td>4</td>
      <td>5</td>
      <td>7.0</td>
      <td>8.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df1 = pd.DataFrame(np.random.randn(3, 4), columns=['a', 'b', 'c', 'd'])
df2 = pd.DataFrame(np.random.randn(2, 3), columns=['b', 'd', 'a'])
df1

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.527674</td>
      <td>2.145525</td>
      <td>1.979097</td>
      <td>1.702063</td>
    </tr>
    <tr>
      <th>1</th>
      <td>-0.350557</td>
      <td>-0.511584</td>
      <td>-1.061349</td>
      <td>-0.702928</td>
    </tr>
    <tr>
      <th>2</th>
      <td>-1.239068</td>
      <td>-1.240555</td>
      <td>-0.295705</td>
      <td>0.209181</td>
    </tr>
  </tbody>
</table>
</div>




```python
df2
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>b</th>
      <th>d</th>
      <th>a</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.718647</td>
      <td>-2.931403</td>
      <td>0.129779</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1.482412</td>
      <td>-1.022705</td>
      <td>-1.186445</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.concat([df1, df2], ignore_index=True)

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.527674</td>
      <td>2.145525</td>
      <td>1.979097</td>
      <td>1.702063</td>
    </tr>
    <tr>
      <th>1</th>
      <td>-0.350557</td>
      <td>-0.511584</td>
      <td>-1.061349</td>
      <td>-0.702928</td>
    </tr>
    <tr>
      <th>2</th>
      <td>-1.239068</td>
      <td>-1.240555</td>
      <td>-0.295705</td>
      <td>0.209181</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0.129779</td>
      <td>1.718647</td>
      <td>NaN</td>
      <td>-2.931403</td>
    </tr>
    <tr>
      <th>4</th>
      <td>-1.186445</td>
      <td>1.482412</td>
      <td>NaN</td>
      <td>-1.022705</td>
    </tr>
  </tbody>
</table>
</div>




```python
a = pd.Series([np.nan, 2.5, np.nan, 3.5, 4.5, np.nan], index=['f', 'e', 'd', 'c', 'b', 'a'])
b = pd.Series(np.arange(len(a), dtype=np.float64), index=['f', 'e', 'd', 'c', 'b', 'a'])
b[-1] = np.nan

```


```python
a
```




    f    NaN
    e    2.5
    d    NaN
    c    3.5
    b    4.5
    a    NaN
    dtype: float64




```python
b
```




    f    0.0
    e    1.0
    d    2.0
    c    3.0
    b    4.0
    a    NaN
    dtype: float64




```python
np.where(pd.isnull(a), b, a)
```




    array([0. , 2.5, 2. , 3.5, 4.5, nan])




```python
b[:-2].combine_first(a[2:])
```




    a    NaN
    b    4.5
    c    3.0
    d    2.0
    e    1.0
    f    0.0
    dtype: float64




```python
df1 = pd.DataFrame({'a': [1., np.nan, 5., np.nan], 'b': [np.nan, 2., np.nan, 6.], 'c': range(2, 18, 4)})
df2 = pd.DataFrame({'a': [5., 4., np.nan, 3., 7.], 'b': [np.nan, 3., 4., 6., 8.]})
df1

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>NaN</td>
      <td>2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>NaN</td>
      <td>2.0</td>
      <td>6</td>
    </tr>
    <tr>
      <th>2</th>
      <td>5.0</td>
      <td>NaN</td>
      <td>10</td>
    </tr>
    <tr>
      <th>3</th>
      <td>NaN</td>
      <td>6.0</td>
      <td>14</td>
    </tr>
  </tbody>
</table>
</div>




```python
df2
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4.0</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>NaN</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3.0</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>7.0</td>
      <td>8.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
df1.combine_first(df2)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1.0</td>
      <td>NaN</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4.0</td>
      <td>2.0</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>5.0</td>
      <td>4.0</td>
      <td>10.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3.0</td>
      <td>6.0</td>
      <td>14.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>7.0</td>
      <td>8.0</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>




```python
data = pd.DataFrame(np.arange(6).reshape((2, 3)), index=pd.Index(['Ohio', 'Colorado'], name='state'), columns=pd.Index(['one', 'two', 'three'], name='number'))
data
result = data.stack()
result
result.unstack()  #默认操作最内层
result.unstack(0)  #指定分层编号
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>state</th>
      <th>Ohio</th>
      <th>Colorado</th>
    </tr>
    <tr>
      <th>number</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>one</th>
      <td>0</td>
      <td>3</td>
    </tr>
    <tr>
      <th>two</th>
      <td>1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>three</th>
      <td>2</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
data = pd.DataFrame(np.arange(6).reshape((2, 3)), index=pd.Index(['Ohio', 'Colorado'], name='state'), columns=pd.Index(['one', 'two', 'three'], name='number'))
```


```python
data
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>number</th>
      <th>one</th>
      <th>two</th>
      <th>three</th>
    </tr>
    <tr>
      <th>state</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Ohio</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>Colorado</th>
      <td>3</td>
      <td>4</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
result = data.stack()
result
```




    state     number
    Ohio      one       0
              two       1
              three     2
    Colorado  one       3
              two       4
              three     5
    dtype: int32




```python
result.unstack()  #默认操作最内层
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>number</th>
      <th>one</th>
      <th>two</th>
      <th>three</th>
    </tr>
    <tr>
      <th>state</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Ohio</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>Colorado</th>
      <td>3</td>
      <td>4</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
result.unstack(0)  #指定操作最内层
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>state</th>
      <th>Ohio</th>
      <th>Colorado</th>
    </tr>
    <tr>
      <th>number</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>one</th>
      <td>0</td>
      <td>3</td>
    </tr>
    <tr>
      <th>two</th>
      <td>1</td>
      <td>4</td>
    </tr>
    <tr>
      <th>three</th>
      <td>2</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
s1 = pd.Series([0, 1, 2, 3], index=['a', 'b', 'c', 'd'])
s2 = pd.Series([4, 5, 6], index=['c', 'd', 'e'])
data2 = pd.concat([s1, s2], keys=['one', 'two'])
data2
data2.unstack() #默认引入缺失数据
data2.unstack().stack()
data2.unstack().stack(dropna=False)
```




    one  a    0.0
         b    1.0
         c    2.0
         d    3.0
         e    NaN
    two  a    NaN
         b    NaN
         c    4.0
         d    5.0
         e    6.0
    dtype: float64




```python
s1 = pd.Series([0, 1, 2, 3], index=['a', 'b', 'c', 'd'])
s2 = pd.Series([4, 5, 6], index=['c', 'd', 'e'])
data2 = pd.concat([s1, s2], keys=['one', 'two'])
data2
```




    one  a    0
         b    1
         c    2
         d    3
    two  c    4
         d    5
         e    6
    dtype: int64




```python
data2.unstack() #默认引入缺失数据

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
      <th>e</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>one</th>
      <td>0.0</td>
      <td>1.0</td>
      <td>2.0</td>
      <td>3.0</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>two</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>4.0</td>
      <td>5.0</td>
      <td>6.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
data2.unstack().stack()

```




    one  a    0.0
         b    1.0
         c    2.0
         d    3.0
    two  c    4.0
         d    5.0
         e    6.0
    dtype: float64




```python
data2.unstack().stack(dropna=False)
```




    one  a    0.0
         b    1.0
         c    2.0
         d    3.0
         e    NaN
    two  a    NaN
         b    NaN
         c    4.0
         d    5.0
         e    6.0
    dtype: float64




```python
df = pd.DataFrame({'left': result, 'right': result + 5}, columns=pd.Index(['left', 'right'], name='side'))
```


```python
df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>side</th>
      <th>left</th>
      <th>right</th>
    </tr>
    <tr>
      <th>state</th>
      <th>number</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="3" valign="top">Ohio</th>
      <th>one</th>
      <td>0</td>
      <td>5</td>
    </tr>
    <tr>
      <th>two</th>
      <td>1</td>
      <td>6</td>
    </tr>
    <tr>
      <th>three</th>
      <td>2</td>
      <td>7</td>
    </tr>
    <tr>
      <th rowspan="3" valign="top">Colorado</th>
      <th>one</th>
      <td>3</td>
      <td>8</td>
    </tr>
    <tr>
      <th>two</th>
      <td>4</td>
      <td>9</td>
    </tr>
    <tr>
      <th>three</th>
      <td>5</td>
      <td>10</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.unstack('state')
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th>side</th>
      <th colspan="2" halign="left">left</th>
      <th colspan="2" halign="left">right</th>
    </tr>
    <tr>
      <th>state</th>
      <th>Ohio</th>
      <th>Colorado</th>
      <th>Ohio</th>
      <th>Colorado</th>
    </tr>
    <tr>
      <th>number</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>one</th>
      <td>0</td>
      <td>3</td>
      <td>5</td>
      <td>8</td>
    </tr>
    <tr>
      <th>two</th>
      <td>1</td>
      <td>4</td>
      <td>6</td>
      <td>9</td>
    </tr>
    <tr>
      <th>three</th>
      <td>2</td>
      <td>5</td>
      <td>7</td>
      <td>10</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.unstack('state').stack('side')
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>state</th>
      <th>Colorado</th>
      <th>Ohio</th>
    </tr>
    <tr>
      <th>number</th>
      <th>side</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2" valign="top">one</th>
      <th>left</th>
      <td>3</td>
      <td>0</td>
    </tr>
    <tr>
      <th>right</th>
      <td>8</td>
      <td>5</td>
    </tr>
    <tr>
      <th rowspan="2" valign="top">two</th>
      <th>left</th>
      <td>4</td>
      <td>1</td>
    </tr>
    <tr>
      <th>right</th>
      <td>9</td>
      <td>6</td>
    </tr>
    <tr>
      <th rowspan="2" valign="top">three</th>
      <th>left</th>
      <td>5</td>
      <td>2</td>
    </tr>
    <tr>
      <th>right</th>
      <td>10</td>
      <td>7</td>
    </tr>
  </tbody>
</table>
</div>




```python
data
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>number</th>
      <th>one</th>
      <th>two</th>
      <th>three</th>
    </tr>
    <tr>
      <th>state</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Ohio</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>Colorado</th>
      <td>3</td>
      <td>4</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
data
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>number</th>
      <th>one</th>
      <th>two</th>
      <th>three</th>
    </tr>
    <tr>
      <th>state</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Ohio</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>Colorado</th>
      <td>3</td>
      <td>4</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
data = pd.DataFrame({'k1': ['one', 'two'] * 3 + ['two'], 'k2': [1, 1, 2, 3, 3, 4, 4]})
data
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>k1</th>
      <th>k2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>one</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>two</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>one</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>two</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>one</td>
      <td>3</td>
    </tr>
    <tr>
      <th>5</th>
      <td>two</td>
      <td>4</td>
    </tr>
    <tr>
      <th>6</th>
      <td>two</td>
      <td>4</td>
    </tr>
  </tbody>
</table>
</div>




```python
data.duplicated() #默认判断全部列
```




    0    False
    1    False
    2    False
    3    False
    4    False
    5    False
    6     True
    dtype: bool




```python
data.drop_duplicates() #默认保留第一次出现的值
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>k1</th>
      <th>k2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>one</td>
      <td>1</td>
    </tr>
    <tr>
      <th>1</th>
      <td>two</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>one</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>two</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>one</td>
      <td>3</td>
    </tr>
    <tr>
      <th>5</th>
      <td>two</td>
      <td>4</td>
    </tr>
  </tbody>
</table>
</div>




```python
data['v1'] = range(7)
data.drop_duplicates(['k1'])

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>k1</th>
      <th>k2</th>
      <th>v1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>one</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>two</td>
      <td>1</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>




```python
data.drop_duplicates(['k1', 'k2'], keep='last')

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>k1</th>
      <th>k2</th>
      <th>v1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>one</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>two</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>one</td>
      <td>2</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>two</td>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>one</td>
      <td>3</td>
      <td>4</td>
    </tr>
    <tr>
      <th>6</th>
      <td>two</td>
      <td>4</td>
      <td>6</td>
    </tr>
  </tbody>
</table>
</div>




```python
data = pd.DataFrame({'food': ['bacon', 'pulled pork', 'bacon', 'Pastrami', 'corned beef', 'Bacon',
                'pastrami', 'honey ham', 'nova lox'], 'ounces': [4, 3, 12, 6, 7.5, 8, 3, 5, 6]})
data
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>food</th>
      <th>ounces</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>bacon</td>
      <td>4.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>pulled pork</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>bacon</td>
      <td>12.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Pastrami</td>
      <td>6.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>corned beef</td>
      <td>7.5</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Bacon</td>
      <td>8.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>pastrami</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>honey ham</td>
      <td>5.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>nova lox</td>
      <td>6.0</td>
    </tr>
  </tbody>
</table>
</div>




```python
meat_to_animal = {
  'bacon': 'pig',
  'pulled pork': 'pig',
  'pastrami': 'cow',
  'corned beef': 'cow',
  'honey ham': 'pig',
  'nova lox': 'salmon'
}

```


```python
lowercased = data['food'].str.lower()
lowercased

```




    0          bacon
    1    pulled pork
    2          bacon
    3       pastrami
    4    corned beef
    5          bacon
    6       pastrami
    7      honey ham
    8       nova lox
    Name: food, dtype: object




```python
data['animal'] = lowercased.map(meat_to_animal)
data

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>food</th>
      <th>ounces</th>
      <th>animal</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>bacon</td>
      <td>4.0</td>
      <td>pig</td>
    </tr>
    <tr>
      <th>1</th>
      <td>pulled pork</td>
      <td>3.0</td>
      <td>pig</td>
    </tr>
    <tr>
      <th>2</th>
      <td>bacon</td>
      <td>12.0</td>
      <td>pig</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Pastrami</td>
      <td>6.0</td>
      <td>cow</td>
    </tr>
    <tr>
      <th>4</th>
      <td>corned beef</td>
      <td>7.5</td>
      <td>cow</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Bacon</td>
      <td>8.0</td>
      <td>pig</td>
    </tr>
    <tr>
      <th>6</th>
      <td>pastrami</td>
      <td>3.0</td>
      <td>cow</td>
    </tr>
    <tr>
      <th>7</th>
      <td>honey ham</td>
      <td>5.0</td>
      <td>pig</td>
    </tr>
    <tr>
      <th>8</th>
      <td>nova lox</td>
      <td>6.0</td>
      <td>salmon</td>
    </tr>
  </tbody>
</table>
</div>




```python
data['food'].map(lambda x: meat_to_animal[x.lower()])
```




    0       pig
    1       pig
    2       pig
    3       cow
    4       cow
    5       pig
    6       cow
    7       pig
    8    salmon
    Name: food, dtype: object




```python
data = pd.Series([1., -999., 2., -999., -1000., 3.])
data

```




    0       1.0
    1    -999.0
    2       2.0
    3    -999.0
    4   -1000.0
    5       3.0
    dtype: float64




```python
data.replace(-999, np.nan)

```




    0       1.0
    1       NaN
    2       2.0
    3       NaN
    4   -1000.0
    5       3.0
    dtype: float64




```python
data.replace([-999, -1000], [np.nan, 0])

```




    0    1.0
    1    NaN
    2    2.0
    3    NaN
    4    0.0
    5    3.0
    dtype: float64




```python
data.replace({-999: np.nan, -1000: 0})

```




    0    1.0
    1    NaN
    2    2.0
    3    NaN
    4    0.0
    5    3.0
    dtype: float64




```python
data = pd.DataFrame(np.arange(12).reshape((3, 4)), index=['Ohio', 'Colorado', 'New York'],                   columns=['one', 'two', 'three', 'four'])
data.rename(index=str.title, columns=str.upper)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ONE</th>
      <th>TWO</th>
      <th>THREE</th>
      <th>FOUR</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Ohio</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>Colorado</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>New York</th>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
transform = lambda x: x[:4].upper()
data.index.map(transform)

```




    Index(['OHIO', 'COLO', 'NEW '], dtype='object')




```python
data.index=data.index.map(transform)
data

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>one</th>
      <th>two</th>
      <th>three</th>
      <th>four</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>OHIO</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>COLO</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>NEW</th>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
data.rename(index={'OHIO': 'INDIANA'},  columns={'three': 'peekaboo'})

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>one</th>
      <th>two</th>
      <th>peekaboo</th>
      <th>four</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>INDIANA</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>COLO</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>NEW</th>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
data.rename(index={'OHIO': 'INDIANA'}, inplace=True)
data 

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>one</th>
      <th>two</th>
      <th>three</th>
      <th>four</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>INDIANA</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>COLO</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>NEW</th>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
ages = [20, 22, 25, 27, 21, 23, 37, 31, 61, 45, 41, 32]
bins = [18, 25, 35, 60, 100]
cats = pd.cut(ages, bins)
cats
```




    [(18, 25], (18, 25], (18, 25], (25, 35], (18, 25], ..., (25, 35], (60, 100], (35, 60], (35, 60], (25, 35]]
    Length: 12
    Categories (4, interval[int64, right]): [(18, 25] < (25, 35] < (35, 60] < (60, 100]]




```python
cats.codes       #分组的编码
```




    array([0, 0, 0, 1, 0, 0, 2, 1, 3, 2, 2, 1], dtype=int8)




```python
cats.categories

```




    IntervalIndex([(18, 25], (25, 35], (35, 60], (60, 100]], dtype='interval[int64, right]')




```python
pd.value_counts(cats)
```




    (18, 25]     5
    (25, 35]     3
    (35, 60]     3
    (60, 100]    1
    dtype: int64




```python
pd.cut(ages, [18, 26, 36, 61, 100], right=False)

```




    [[18, 26), [18, 26), [18, 26), [26, 36), [18, 26), ..., [26, 36), [61, 100), [36, 61), [36, 61), [26, 36)]
    Length: 12
    Categories (4, interval[int64, left]): [[18, 26) < [26, 36) < [36, 61) < [61, 100)]




```python
group_names = ['Youth', 'YoungAdult', 'MiddleAged', 'Senior']
pd.cut(ages, bins, labels=group_names)

```




    ['Youth', 'Youth', 'Youth', 'YoungAdult', 'Youth', ..., 'YoungAdult', 'Senior', 'MiddleAged', 'MiddleAged', 'YoungAdult']
    Length: 12
    Categories (4, object): ['Youth' < 'YoungAdult' < 'MiddleAged' < 'Senior']




```python
data = np.random.rand(20)

```


```python
data
```




    array([0.12967787, 0.87168374, 0.24167497, 0.56688941, 0.22964312,
           0.30205167, 0.88297675, 0.22349301, 0.18292263, 0.81072534,
           0.25054152, 0.99378214, 0.78439125, 0.3970331 , 0.89049743,
           0.51677834, 0.76808437, 0.54701119, 0.79386529, 0.25451132])




```python
temp=pd.cut(data, 4, precision=2)   #划分的分组数而不是边界，边界按最大最小平均分
temp

```




    [(0.13, 0.35], (0.78, 0.99], (0.13, 0.35], (0.56, 0.78], (0.13, 0.35], ..., (0.35, 0.56], (0.56, 0.78], (0.35, 0.56], (0.78, 0.99], (0.13, 0.35]]
    Length: 20
    Categories (4, interval[float64, right]): [(0.13, 0.35] < (0.35, 0.56] < (0.56, 0.78] < (0.78, 0.99]]




```python
pd.value_counts(temp)

```




    (0.13, 0.35]    8
    (0.78, 0.99]    7
    (0.35, 0.56]    3
    (0.56, 0.78]    2
    dtype: int64




```python
data = np.random.randn(1000)  # Normally distributed
cats = pd.qcut(data, 4)  #将所有数据平均分为4部分
cats

```




    [(-0.726, -0.00747], (-0.00747, 0.636], (-3.057, -0.726], (-3.057, -0.726], (-0.00747, 0.636], ..., (-0.726, -0.00747], (-0.726, -0.00747], (-0.726, -0.00747], (0.636, 2.834], (-3.057, -0.726]]
    Length: 1000
    Categories (4, interval[float64, right]): [(-3.057, -0.726] < (-0.726, -0.00747] < (-0.00747, 0.636] < (0.636, 2.834]]




```python
pd.value_counts(cats)

```




    (-3.057, -0.726]      250
    (-0.726, -0.00747]    250
    (-0.00747, 0.636]     250
    (0.636, 2.834]        250
    dtype: int64




```python
pd.qcut(data, [0, 0.1, 0.5, 0.9, 1.])

```




    [(-1.239, -0.00747], (-0.00747, 1.338], (-3.057, -1.239], (-3.057, -1.239], (-0.00747, 1.338], ..., (-1.239, -0.00747], (-1.239, -0.00747], (-1.239, -0.00747], (1.338, 2.834], (-3.057, -1.239]]
    Length: 1000
    Categories (4, interval[float64, right]): [(-3.057, -1.239] < (-1.239, -0.00747] < (-0.00747, 1.338] < (1.338, 2.834]]




```python
data = pd.DataFrame(np.random.randn(1000, 4))
data.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
      <th>2</th>
      <th>3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>1000.000000</td>
      <td>1000.000000</td>
      <td>1000.000000</td>
      <td>1000.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>-0.068024</td>
      <td>0.015781</td>
      <td>0.048655</td>
      <td>-0.019467</td>
    </tr>
    <tr>
      <th>std</th>
      <td>1.050557</td>
      <td>0.963683</td>
      <td>0.972374</td>
      <td>1.031390</td>
    </tr>
    <tr>
      <th>min</th>
      <td>-3.617567</td>
      <td>-2.550853</td>
      <td>-3.372664</td>
      <td>-3.196753</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>-0.718715</td>
      <td>-0.591289</td>
      <td>-0.606569</td>
      <td>-0.712316</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>-0.066156</td>
      <td>0.004574</td>
      <td>0.068207</td>
      <td>0.000122</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>0.627520</td>
      <td>0.662984</td>
      <td>0.747493</td>
      <td>0.673216</td>
    </tr>
    <tr>
      <th>max</th>
      <td>2.940831</td>
      <td>2.865724</td>
      <td>3.369795</td>
      <td>3.364796</td>
    </tr>
  </tbody>
</table>
</div>




```python
col=data[2]
col[np.abs(col) > 3]
```




    340    3.196054
    445   -3.159953
    533   -3.156547
    628    3.369795
    698   -3.372664
    Name: 2, dtype: float64




```python
data[(np.abs(data) > 3).any(1)] #选出超过3的行
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
      <th>2</th>
      <th>3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>55</th>
      <td>-3.157032</td>
      <td>-0.841691</td>
      <td>1.018759</td>
      <td>-0.018302</td>
    </tr>
    <tr>
      <th>340</th>
      <td>0.456149</td>
      <td>0.854559</td>
      <td>3.196054</td>
      <td>0.353166</td>
    </tr>
    <tr>
      <th>343</th>
      <td>-3.283047</td>
      <td>-0.316560</td>
      <td>-0.121576</td>
      <td>0.584322</td>
    </tr>
    <tr>
      <th>407</th>
      <td>-0.089158</td>
      <td>-0.604724</td>
      <td>1.028259</td>
      <td>3.364796</td>
    </tr>
    <tr>
      <th>445</th>
      <td>0.300672</td>
      <td>-0.848071</td>
      <td>-3.159953</td>
      <td>0.870023</td>
    </tr>
    <tr>
      <th>533</th>
      <td>-0.048864</td>
      <td>0.152498</td>
      <td>-3.156547</td>
      <td>-0.968370</td>
    </tr>
    <tr>
      <th>628</th>
      <td>1.119083</td>
      <td>0.171787</td>
      <td>3.369795</td>
      <td>-0.550373</td>
    </tr>
    <tr>
      <th>698</th>
      <td>-0.517293</td>
      <td>-1.208259</td>
      <td>-3.372664</td>
      <td>-0.418606</td>
    </tr>
    <tr>
      <th>824</th>
      <td>-3.459360</td>
      <td>-0.702142</td>
      <td>0.325501</td>
      <td>0.653165</td>
    </tr>
    <tr>
      <th>873</th>
      <td>-3.617567</td>
      <td>-1.302917</td>
      <td>-0.577524</td>
      <td>0.859530</td>
    </tr>
    <tr>
      <th>923</th>
      <td>-0.920904</td>
      <td>-0.103102</td>
      <td>-0.581829</td>
      <td>-3.196753</td>
    </tr>
    <tr>
      <th>981</th>
      <td>0.672200</td>
      <td>-0.274157</td>
      <td>-0.883970</td>
      <td>-3.038320</td>
    </tr>
  </tbody>
</table>
</div>




```python
data[np.abs(data) > 3] = np.sign(data) * 3
data.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
      <th>2</th>
      <th>3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>1000.000000</td>
      <td>1000.000000</td>
      <td>1000.000000</td>
      <td>1000.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>-0.066507</td>
      <td>0.015781</td>
      <td>0.048779</td>
      <td>-0.019597</td>
    </tr>
    <tr>
      <th>std</th>
      <td>1.045975</td>
      <td>0.963683</td>
      <td>0.968296</td>
      <td>1.029555</td>
    </tr>
    <tr>
      <th>min</th>
      <td>-3.000000</td>
      <td>-2.550853</td>
      <td>-3.000000</td>
      <td>-3.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>-0.718715</td>
      <td>-0.591289</td>
      <td>-0.606569</td>
      <td>-0.712316</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>-0.066156</td>
      <td>0.004574</td>
      <td>0.068207</td>
      <td>0.000122</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>0.627520</td>
      <td>0.662984</td>
      <td>0.747493</td>
      <td>0.673216</td>
    </tr>
    <tr>
      <th>max</th>
      <td>2.940831</td>
      <td>2.865724</td>
      <td>3.000000</td>
      <td>3.000000</td>
    </tr>
  </tbody>
</table>
</div>




```python
df = pd.DataFrame(np.arange(5 * 4).reshape((5, 4)))
sampler = np.random.permutation(5)  #表示新顺序的数组
sampler

```




    array([1, 2, 0, 4, 3])




```python
df

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
      <th>2</th>
      <th>3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>2</th>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
    <tr>
      <th>3</th>
      <td>12</td>
      <td>13</td>
      <td>14</td>
      <td>15</td>
    </tr>
    <tr>
      <th>4</th>
      <td>16</td>
      <td>17</td>
      <td>18</td>
      <td>19</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.take(sampler)

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
      <th>2</th>
      <th>3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>2</th>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>1</td>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>16</td>
      <td>17</td>
      <td>18</td>
      <td>19</td>
    </tr>
    <tr>
      <th>3</th>
      <td>12</td>
      <td>13</td>
      <td>14</td>
      <td>15</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.sample(n=3)

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
      <th>2</th>
      <th>3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>4</th>
      <td>16</td>
      <td>17</td>
      <td>18</td>
      <td>19</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
    </tr>
    <tr>
      <th>2</th>
      <td>8</td>
      <td>9</td>
      <td>10</td>
      <td>11</td>
    </tr>
  </tbody>
</table>
</div>




```python
choices = pd.Series([5, 7, -1, 6, 4])
draws = choices.sample(n=10, replace=True)
draws

```




    1    7
    0    5
    4    4
    0    5
    3    6
    3    6
    1    7
    4    4
    1    7
    1    7
    dtype: int64




```python
df = pd.DataFrame({'key': ['b', 'b', 'a', 'c', 'a', 'b'],  'data1': range(6)})
df

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key</th>
      <th>data1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>b</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>b</td>
      <td>1</td>
    </tr>
    <tr>
      <th>2</th>
      <td>a</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>c</td>
      <td>3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>a</td>
      <td>4</td>
    </tr>
    <tr>
      <th>5</th>
      <td>b</td>
      <td>5</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.get_dummies(df['key'])

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>




```python
dummies = pd.get_dummies(df['key'], prefix='key')
df_with_dummy = df[['data1']].join(dummies)
df_with_dummy

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>data1</th>
      <th>key_a</th>
      <th>key_b</th>
      <th>key_c</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>5</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
  </tbody>
</table>
</div>




```python
data = {'Dave': 'dave@google.com', 'Steve': 'steve@gmail.com', 'Rob': 'rob@gmail.com', 'Wes': np.nan}
data = pd.Series(data)
data

```




    Dave     dave@google.com
    Steve    steve@gmail.com
    Rob        rob@gmail.com
    Wes                  NaN
    dtype: object




```python
data.isnull()

```




    Dave     False
    Steve    False
    Rob      False
    Wes       True
    dtype: bool




```python
data.str.contains('gmail') #data.map可以将字符串函数作用于各个值，但是遇见NaN会报错，str不会

```




    Dave     False
    Steve     True
    Rob       True
    Wes        NaN
    dtype: object




```python
import re
pattern='([A-Z0-9._%+-]+)@([A-Z0-9._-]+)\\.([A-Z]{2,4})'
data.str.findall(pattern, flags=re.IGNORECASE)

```




    Dave     [(dave, google, com)]
    Steve    [(steve, gmail, com)]
    Rob        [(rob, gmail, com)]
    Wes                        NaN
    dtype: object




```python
df = pd.DataFrame({'key1' : ['a', 'a', 'b', 'b', 'a'], 'key2' : ['one', 'two', 'one', 'two', 'one'],
                   'data1' : np.random.randn(5), 'data2' : np.random.randn(5)})
df

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2</th>
      <th>data1</th>
      <th>data2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>a</td>
      <td>one</td>
      <td>-0.083293</td>
      <td>0.456279</td>
    </tr>
    <tr>
      <th>1</th>
      <td>a</td>
      <td>two</td>
      <td>-0.442362</td>
      <td>-0.337304</td>
    </tr>
    <tr>
      <th>2</th>
      <td>b</td>
      <td>one</td>
      <td>0.244770</td>
      <td>0.943875</td>
    </tr>
    <tr>
      <th>3</th>
      <td>b</td>
      <td>two</td>
      <td>0.862879</td>
      <td>0.444040</td>
    </tr>
    <tr>
      <th>4</th>
      <td>a</td>
      <td>one</td>
      <td>0.858584</td>
      <td>0.527193</td>
    </tr>
  </tbody>
</table>
</div>




```python
grouped = df['data1'].groupby(df['key1'])
grouped

```




    <pandas.core.groupby.generic.SeriesGroupBy object at 0x0000024CEBF7B880>




```python
grouped.mean()

```




    key1
    a    0.110977
    b    0.553824
    Name: data1, dtype: float64




```python
means = df['data1'].groupby([df['key1'], df['key2']]).mean()
means

```




    key1  key2
    a     one     0.387646
          two    -0.442362
    b     one     0.244770
          two     0.862879
    Name: data1, dtype: float64




```python
means.unstack()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>key2</th>
      <th>one</th>
      <th>two</th>
    </tr>
    <tr>
      <th>key1</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0.387646</td>
      <td>-0.442362</td>
    </tr>
    <tr>
      <th>b</th>
      <td>0.244770</td>
      <td>0.862879</td>
    </tr>
  </tbody>
</table>
</div>




```python
states = np.array(['Ohio', 'California', 'California', 'Ohio', 'Ohio'])
years = np.array([2005, 2005, 2006, 2005, 2006])
df['data1'].groupby([states, years]).mean()

```




    California  2005   -0.442362
                2006    0.244770
    Ohio        2005    0.389793
                2006    0.858584
    Name: data1, dtype: float64




```python
df.groupby('key1').mean()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>data1</th>
      <th>data2</th>
    </tr>
    <tr>
      <th>key1</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>0.110977</td>
      <td>0.215390</td>
    </tr>
    <tr>
      <th>b</th>
      <td>0.553824</td>
      <td>0.693958</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.groupby(['key1', 'key2']).mean()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th></th>
      <th>data1</th>
      <th>data2</th>
    </tr>
    <tr>
      <th>key1</th>
      <th>key2</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2" valign="top">a</th>
      <th>one</th>
      <td>0.387646</td>
      <td>0.491736</td>
    </tr>
    <tr>
      <th>two</th>
      <td>-0.442362</td>
      <td>-0.337304</td>
    </tr>
    <tr>
      <th rowspan="2" valign="top">b</th>
      <th>one</th>
      <td>0.244770</td>
      <td>0.943875</td>
    </tr>
    <tr>
      <th>two</th>
      <td>0.862879</td>
      <td>0.444040</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.groupby(['key1', 'key2']).size()  #忽略缺失值

```




    key1  key2
    a     one     2
          two     1
    b     one     1
          two     1
    dtype: int64




```python
for name, group in df.groupby('key1'):
    print(name)
    print(group)  

```

    a
      key1 key2     data1     data2
    0    a  one -0.083293  0.456279
    1    a  two -0.442362 -0.337304
    4    a  one  0.858584  0.527193
    b
      key1 key2     data1     data2
    2    b  one  0.244770  0.943875
    3    b  two  0.862879  0.444040
    


```python
for (k1, k2), group in df.groupby(['key1', 'key2']):
    print((k1, k2))
    print(group)

```

    ('a', 'one')
      key1 key2     data1     data2
    0    a  one -0.083293  0.456279
    4    a  one  0.858584  0.527193
    ('a', 'two')
      key1 key2     data1     data2
    1    a  two -0.442362 -0.337304
    ('b', 'one')
      key1 key2    data1     data2
    2    b  one  0.24477  0.943875
    ('b', 'two')
      key1 key2     data1    data2
    3    b  two  0.862879  0.44404
    


```python
pieces = dict(list(df.groupby('key1')))
pieces['b']

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2</th>
      <th>data1</th>
      <th>data2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>2</th>
      <td>b</td>
      <td>one</td>
      <td>0.244770</td>
      <td>0.943875</td>
    </tr>
    <tr>
      <th>3</th>
      <td>b</td>
      <td>two</td>
      <td>0.862879</td>
      <td>0.444040</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.dtypes

```




    key1      object
    key2      object
    data1    float64
    data2    float64
    dtype: object




```python
grouped = df.groupby(df.dtypes, axis=1)
for dtype, group in grouped:
    print(dtype)
    print(group)  

```

    float64
          data1     data2
    0 -0.083293  0.456279
    1 -0.442362 -0.337304
    2  0.244770  0.943875
    3  0.862879  0.444040
    4  0.858584  0.527193
    object
      key1 key2
    0    a  one
    1    a  two
    2    b  one
    3    b  two
    4    a  one
    


```python
people = pd.DataFrame(np.random.randn(5, 5), columns=['a', 'b', 'c', 'd', 'e'], index=['Joe', 'Steve', 'Wes', 'Jim', 'Travis'])
people.iloc[2:3, [1, 2]] = np.nan # Add a few NA values
people

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
      <th>e</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Joe</th>
      <td>0.231080</td>
      <td>-0.440371</td>
      <td>0.409642</td>
      <td>-0.114867</td>
      <td>0.328406</td>
    </tr>
    <tr>
      <th>Steve</th>
      <td>-0.775944</td>
      <td>-1.258328</td>
      <td>-2.723042</td>
      <td>0.615950</td>
      <td>-1.263696</td>
    </tr>
    <tr>
      <th>Wes</th>
      <td>1.965413</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>-1.284734</td>
      <td>0.204553</td>
    </tr>
    <tr>
      <th>Jim</th>
      <td>-0.097869</td>
      <td>0.182042</td>
      <td>0.061867</td>
      <td>-0.648661</td>
      <td>-0.217448</td>
    </tr>
    <tr>
      <th>Travis</th>
      <td>-0.006042</td>
      <td>-0.612533</td>
      <td>0.537186</td>
      <td>0.646037</td>
      <td>1.339316</td>
    </tr>
  </tbody>
</table>
</div>




```python
mapping = {'a': 'red', 'b': 'red', 'c': 'blue', 'd': 'blue', 'e': 'red', 'f' : 'orange'}
by_column = people.groupby(mapping, axis=1)
by_column.sum()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>blue</th>
      <th>red</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Joe</th>
      <td>0.294776</td>
      <td>0.119115</td>
    </tr>
    <tr>
      <th>Steve</th>
      <td>-2.107092</td>
      <td>-3.297967</td>
    </tr>
    <tr>
      <th>Wes</th>
      <td>-1.284734</td>
      <td>2.169965</td>
    </tr>
    <tr>
      <th>Jim</th>
      <td>-0.586794</td>
      <td>-0.133276</td>
    </tr>
    <tr>
      <th>Travis</th>
      <td>1.183222</td>
      <td>0.720741</td>
    </tr>
  </tbody>
</table>
</div>




```python
map_series = pd.Series(mapping)
map_series

```




    a       red
    b       red
    c      blue
    d      blue
    e       red
    f    orange
    dtype: object




```python
people.groupby(map_series, axis=1).count()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>blue</th>
      <th>red</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Joe</th>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>Steve</th>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>Wes</th>
      <td>1</td>
      <td>2</td>
    </tr>
    <tr>
      <th>Jim</th>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>Travis</th>
      <td>2</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>




```python
people.groupby(len).sum()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
      <th>e</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>3</th>
      <td>2.098624</td>
      <td>-0.258329</td>
      <td>0.471509</td>
      <td>-2.048262</td>
      <td>0.315510</td>
    </tr>
    <tr>
      <th>5</th>
      <td>-0.775944</td>
      <td>-1.258328</td>
      <td>-2.723042</td>
      <td>0.615950</td>
      <td>-1.263696</td>
    </tr>
    <tr>
      <th>6</th>
      <td>-0.006042</td>
      <td>-0.612533</td>
      <td>0.537186</td>
      <td>0.646037</td>
      <td>1.339316</td>
    </tr>
  </tbody>
</table>
</div>




```python
key_list = ['one', 'one', 'one', 'two', 'two']
people.groupby([len, key_list]).min()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th></th>
      <th>a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
      <th>e</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="2" valign="top">3</th>
      <th>one</th>
      <td>0.231080</td>
      <td>-0.440371</td>
      <td>0.409642</td>
      <td>-1.284734</td>
      <td>0.204553</td>
    </tr>
    <tr>
      <th>two</th>
      <td>-0.097869</td>
      <td>0.182042</td>
      <td>0.061867</td>
      <td>-0.648661</td>
      <td>-0.217448</td>
    </tr>
    <tr>
      <th>5</th>
      <th>one</th>
      <td>-0.775944</td>
      <td>-1.258328</td>
      <td>-2.723042</td>
      <td>0.615950</td>
      <td>-1.263696</td>
    </tr>
    <tr>
      <th>6</th>
      <th>two</th>
      <td>-0.006042</td>
      <td>-0.612533</td>
      <td>0.537186</td>
      <td>0.646037</td>
      <td>1.339316</td>
    </tr>
  </tbody>
</table>
</div>




```python
columns = pd.MultiIndex.from_arrays([['US', 'US', 'US', 'JP', 'JP'], [1, 3, 5, 1, 3]], names=['cty', 'tenor'])
hier_df = pd.DataFrame(np.random.randn(4, 5), columns=columns)
hier_df

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th>cty</th>
      <th colspan="3" halign="left">US</th>
      <th colspan="2" halign="left">JP</th>
    </tr>
    <tr>
      <th>tenor</th>
      <th>1</th>
      <th>3</th>
      <th>5</th>
      <th>1</th>
      <th>3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.860698</td>
      <td>-0.379994</td>
      <td>0.644758</td>
      <td>-0.231480</td>
      <td>0.346634</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1.237142</td>
      <td>0.038387</td>
      <td>0.600247</td>
      <td>0.431467</td>
      <td>0.137392</td>
    </tr>
    <tr>
      <th>2</th>
      <td>-2.211133</td>
      <td>1.528952</td>
      <td>0.056726</td>
      <td>-0.629724</td>
      <td>-0.125510</td>
    </tr>
    <tr>
      <th>3</th>
      <td>-1.272170</td>
      <td>-1.088555</td>
      <td>-1.950819</td>
      <td>-0.253229</td>
      <td>0.910727</td>
    </tr>
  </tbody>
</table>
</div>




```python
hier_df.groupby(level='cty', axis=1).count()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>cty</th>
      <th>JP</th>
      <th>US</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>3</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2</td>
      <td>3</td>
    </tr>
  </tbody>
</table>
</div>




```python
df
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>key1</th>
      <th>key2</th>
      <th>data1</th>
      <th>data2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>a</td>
      <td>one</td>
      <td>-0.083293</td>
      <td>0.456279</td>
    </tr>
    <tr>
      <th>1</th>
      <td>a</td>
      <td>two</td>
      <td>-0.442362</td>
      <td>-0.337304</td>
    </tr>
    <tr>
      <th>2</th>
      <td>b</td>
      <td>one</td>
      <td>0.244770</td>
      <td>0.943875</td>
    </tr>
    <tr>
      <th>3</th>
      <td>b</td>
      <td>two</td>
      <td>0.862879</td>
      <td>0.444040</td>
    </tr>
    <tr>
      <th>4</th>
      <td>a</td>
      <td>one</td>
      <td>0.858584</td>
      <td>0.527193</td>
    </tr>
  </tbody>
</table>
</div>




```python
grouped = df.groupby('key1')
grouped['data1'].quantile(0.9)  #计算该百分位的值，如果没有则插值

```




    key1
    a    0.670209
    b    0.801068
    Name: data1, dtype: float64




```python
def peak_to_peak(arr): return arr.max() - arr.min()
grouped.agg(peak_to_peak)
```

    C:\Users\HP\AppData\Local\Temp\ipykernel_20412\238647417.py:2: FutureWarning: ['key2'] did not aggregate successfully. If any error is raised this will raise in a future version of pandas. Drop these columns/ops to avoid this warning.
      grouped.agg(peak_to_peak)
    




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>data1</th>
      <th>data2</th>
    </tr>
    <tr>
      <th>key1</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>1.300946</td>
      <td>0.864497</td>
    </tr>
    <tr>
      <th>b</th>
      <td>0.618109</td>
      <td>0.499836</td>
    </tr>
  </tbody>
</table>
</div>




```python
grouped.describe()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead tr th {
        text-align: left;
    }

    .dataframe thead tr:last-of-type th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr>
      <th></th>
      <th colspan="8" halign="left">data1</th>
      <th colspan="8" halign="left">data2</th>
    </tr>
    <tr>
      <th></th>
      <th>count</th>
      <th>mean</th>
      <th>std</th>
      <th>min</th>
      <th>25%</th>
      <th>50%</th>
      <th>75%</th>
      <th>max</th>
      <th>count</th>
      <th>mean</th>
      <th>std</th>
      <th>min</th>
      <th>25%</th>
      <th>50%</th>
      <th>75%</th>
      <th>max</th>
    </tr>
    <tr>
      <th>key1</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a</th>
      <td>3.0</td>
      <td>0.110977</td>
      <td>0.671878</td>
      <td>-0.442362</td>
      <td>-0.262827</td>
      <td>-0.083293</td>
      <td>0.387646</td>
      <td>0.858584</td>
      <td>3.0</td>
      <td>0.215390</td>
      <td>0.479958</td>
      <td>-0.337304</td>
      <td>0.059488</td>
      <td>0.456279</td>
      <td>0.491736</td>
      <td>0.527193</td>
    </tr>
    <tr>
      <th>b</th>
      <td>2.0</td>
      <td>0.553824</td>
      <td>0.437069</td>
      <td>0.244770</td>
      <td>0.399297</td>
      <td>0.553824</td>
      <td>0.708352</td>
      <td>0.862879</td>
      <td>2.0</td>
      <td>0.693958</td>
      <td>0.353437</td>
      <td>0.444040</td>
      <td>0.568999</td>
      <td>0.693958</td>
      <td>0.818916</td>
      <td>0.943875</td>
    </tr>
  </tbody>
</table>
</div>




```python
tips = pd.read_csv('examples/tips.csv')
tips['tip_pct'] = tips['tip'] / tips['total_bill']
tips[:4]

```


    ---------------------------------------------------------------------------

    FileNotFoundError                         Traceback (most recent call last)

    Input In [135], in <cell line: 1>()
    ----> 1 tips = pd.read_csv('examples/tips.csv')
          2 tips['tip_pct'] = tips['tip'] / tips['total_bill']
          3 tips[:4]
    

    File E:\anaconda\lib\site-packages\pandas\util\_decorators.py:311, in deprecate_nonkeyword_arguments.<locals>.decorate.<locals>.wrapper(*args, **kwargs)
        305 if len(args) > num_allow_args:
        306     warnings.warn(
        307         msg.format(arguments=arguments),
        308         FutureWarning,
        309         stacklevel=stacklevel,
        310     )
    --> 311 return func(*args, **kwargs)
    

    File E:\anaconda\lib\site-packages\pandas\io\parsers\readers.py:680, in read_csv(filepath_or_buffer, sep, delimiter, header, names, index_col, usecols, squeeze, prefix, mangle_dupe_cols, dtype, engine, converters, true_values, false_values, skipinitialspace, skiprows, skipfooter, nrows, na_values, keep_default_na, na_filter, verbose, skip_blank_lines, parse_dates, infer_datetime_format, keep_date_col, date_parser, dayfirst, cache_dates, iterator, chunksize, compression, thousands, decimal, lineterminator, quotechar, quoting, doublequote, escapechar, comment, encoding, encoding_errors, dialect, error_bad_lines, warn_bad_lines, on_bad_lines, delim_whitespace, low_memory, memory_map, float_precision, storage_options)
        665 kwds_defaults = _refine_defaults_read(
        666     dialect,
        667     delimiter,
       (...)
        676     defaults={"delimiter": ","},
        677 )
        678 kwds.update(kwds_defaults)
    --> 680 return _read(filepath_or_buffer, kwds)
    

    File E:\anaconda\lib\site-packages\pandas\io\parsers\readers.py:575, in _read(filepath_or_buffer, kwds)
        572 _validate_names(kwds.get("names", None))
        574 # Create the parser.
    --> 575 parser = TextFileReader(filepath_or_buffer, **kwds)
        577 if chunksize or iterator:
        578     return parser
    

    File E:\anaconda\lib\site-packages\pandas\io\parsers\readers.py:933, in TextFileReader.__init__(self, f, engine, **kwds)
        930     self.options["has_index_names"] = kwds["has_index_names"]
        932 self.handles: IOHandles | None = None
    --> 933 self._engine = self._make_engine(f, self.engine)
    

    File E:\anaconda\lib\site-packages\pandas\io\parsers\readers.py:1217, in TextFileReader._make_engine(self, f, engine)
       1213     mode = "rb"
       1214 # error: No overload variant of "get_handle" matches argument types
       1215 # "Union[str, PathLike[str], ReadCsvBuffer[bytes], ReadCsvBuffer[str]]"
       1216 # , "str", "bool", "Any", "Any", "Any", "Any", "Any"
    -> 1217 self.handles = get_handle(  # type: ignore[call-overload]
       1218     f,
       1219     mode,
       1220     encoding=self.options.get("encoding", None),
       1221     compression=self.options.get("compression", None),
       1222     memory_map=self.options.get("memory_map", False),
       1223     is_text=is_text,
       1224     errors=self.options.get("encoding_errors", "strict"),
       1225     storage_options=self.options.get("storage_options", None),
       1226 )
       1227 assert self.handles is not None
       1228 f = self.handles.handle
    

    File E:\anaconda\lib\site-packages\pandas\io\common.py:789, in get_handle(path_or_buf, mode, encoding, compression, memory_map, is_text, errors, storage_options)
        784 elif isinstance(handle, str):
        785     # Check whether the filename is to be opened in binary mode.
        786     # Binary mode does not support 'encoding' and 'newline'.
        787     if ioargs.encoding and "b" not in ioargs.mode:
        788         # Encoding
    --> 789         handle = open(
        790             handle,
        791             ioargs.mode,
        792             encoding=ioargs.encoding,
        793             errors=errors,
        794             newline="",
        795         )
        796     else:
        797         # Binary mode
        798         handle = open(handle, ioargs.mode)
    

    FileNotFoundError: [Errno 2] No such file or directory: 'examples/tips.csv'



```python
frame = pd.DataFrame({'data1': np.random.randn(1000), 'data2': np.random.randn(1000)})
quartiles = pd.cut(frame.data1, 4)
quartiles[:10]

```




    0     (-0.436, 1.211]
    1     (-0.436, 1.211]
    2      (1.211, 2.858]
    3     (-0.436, 1.211]
    4      (1.211, 2.858]
    5    (-2.083, -0.436]
    6    (-2.083, -0.436]
    7      (1.211, 2.858]
    8     (-0.436, 1.211]
    9    (-2.083, -0.436]
    Name: data1, dtype: category
    Categories (4, interval[float64, right]): [(-3.737, -2.083] < (-2.083, -0.436] < (-0.436, 1.211] < (1.211, 2.858]]




```python
def get_stats(group):
    return {'min': group.min(), 'max': group.max(), 'count': group.count(), 'mean': group.mean()}
grouped = frame.data2.groupby(quartiles)
grouped.apply(get_stats).unstack()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>min</th>
      <th>max</th>
      <th>count</th>
      <th>mean</th>
    </tr>
    <tr>
      <th>data1</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>(-3.737, -2.083]</th>
      <td>-1.417666</td>
      <td>1.053207</td>
      <td>15.0</td>
      <td>-0.021193</td>
    </tr>
    <tr>
      <th>(-2.083, -0.436]</th>
      <td>-2.815877</td>
      <td>2.712397</td>
      <td>296.0</td>
      <td>-0.097675</td>
    </tr>
    <tr>
      <th>(-0.436, 1.211]</th>
      <td>-2.950480</td>
      <td>3.093977</td>
      <td>568.0</td>
      <td>0.006707</td>
    </tr>
    <tr>
      <th>(1.211, 2.858]</th>
      <td>-2.621023</td>
      <td>2.433423</td>
      <td>121.0</td>
      <td>-0.102975</td>
    </tr>
  </tbody>
</table>
</div>




```python
grouping = pd.qcut(frame.data1, 10, labels=False) #平均分
grouped = frame.data2.groupby(grouping)
grouped.apply(get_stats).unstack()

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>min</th>
      <th>max</th>
      <th>count</th>
      <th>mean</th>
    </tr>
    <tr>
      <th>data1</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>-1.979885</td>
      <td>2.546603</td>
      <td>100.0</td>
      <td>0.015369</td>
    </tr>
    <tr>
      <th>1</th>
      <td>-2.815877</td>
      <td>2.560098</td>
      <td>100.0</td>
      <td>-0.189069</td>
    </tr>
    <tr>
      <th>2</th>
      <td>-2.367227</td>
      <td>2.290479</td>
      <td>100.0</td>
      <td>-0.097540</td>
    </tr>
    <tr>
      <th>3</th>
      <td>-2.057884</td>
      <td>3.093977</td>
      <td>100.0</td>
      <td>0.000976</td>
    </tr>
    <tr>
      <th>4</th>
      <td>-2.314728</td>
      <td>2.157829</td>
      <td>100.0</td>
      <td>0.125600</td>
    </tr>
    <tr>
      <th>5</th>
      <td>-2.944465</td>
      <td>1.991280</td>
      <td>100.0</td>
      <td>-0.092507</td>
    </tr>
    <tr>
      <th>6</th>
      <td>-2.503720</td>
      <td>2.415097</td>
      <td>100.0</td>
      <td>-0.045530</td>
    </tr>
    <tr>
      <th>7</th>
      <td>-2.950480</td>
      <td>2.553021</td>
      <td>100.0</td>
      <td>0.057286</td>
    </tr>
    <tr>
      <th>8</th>
      <td>-2.688502</td>
      <td>2.356049</td>
      <td>100.0</td>
      <td>-0.059030</td>
    </tr>
    <tr>
      <th>9</th>
      <td>-2.339079</td>
      <td>2.433423</td>
      <td>100.0</td>
      <td>-0.094356</td>
    </tr>
  </tbody>
</table>
</div>




```python
tips.pivot_table(index=['day', 'smoker'])  #默认计算分组平均数

```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    Input In [139], in <cell line: 1>()
    ----> 1 tips.pivot_table(index=['day', 'smoker'])
    

    NameError: name 'tips' is not defined



```python
from io import StringIO
data = """\
Sample  Nationality  Handedness
1   USA  Right-handed
2   Japan    Left-handed
3   USA  Right-handed
4   Japan    Right-handed
5   Japan    Left-handed
6   Japan    Right-handed
7   USA  Right-handed
8   USA  Left-handed
9   Japan    Right-handed
10  USA  Right-handed"""
data = pd.read_table(StringIO(data), sep='\s+')

```


```python
pd.crosstab(data.Nationality, data.Handedness, margins=True)

```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th>Handedness</th>
      <th>Left-handed</th>
      <th>Right-handed</th>
      <th>All</th>
    </tr>
    <tr>
      <th>Nationality</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Japan</th>
      <td>2</td>
      <td>3</td>
      <td>5</td>
    </tr>
    <tr>
      <th>USA</th>
      <td>1</td>
      <td>4</td>
      <td>5</td>
    </tr>
    <tr>
      <th>All</th>
      <td>3</td>
      <td>7</td>
      <td>10</td>
    </tr>
  </tbody>
</table>
</div>




```python
pd.crosstab([tips.time, tips.day], tips.smoker, margins=True)

```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    Input In [142], in <cell line: 1>()
    ----> 1 pd.crosstab([tips.time, tips.day], tips.smoker, margins=True)
    

    NameError: name 'tips' is not defined



```python

```
