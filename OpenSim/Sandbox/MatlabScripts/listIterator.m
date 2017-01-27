function count = listIterator(ListRef)

import org.opensim.modeling.*

% get the list size
listIter = ListRef.begin();
count = 0;
while ~listIter.equals(ListRef.end())
    listIter.next();
    count = count + 1;
end