//manage places provided
import 'package:flutter/foundation.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier{
  //ChangeNotifier IS MIX sO we can call notifylisteners
  List<Place>_items=[];
  List<Place>get items{
    return [... _items];// copy of items
  }
}
