function object = listIterator(ListRef)


%ListRef = model.getListRef();

listIter = ListRef.begin();
count = 0;


while ~listIter.equals(ListRef.end())
    
    listIter.get_max_isometric_force();
    
    listIter.next();
    count = count + 1;
end