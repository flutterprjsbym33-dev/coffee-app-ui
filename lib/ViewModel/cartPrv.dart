import 'package:coffeariverpod/ViewModel/ItemsPv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




final cartuse = StateNotifierProvider<CartPrv , CartUseCases>((ref){
  return  CartPrv();
});



class CartPrv extends StateNotifier<CartUseCases>
{
  CartPrv() : super(CartUseCases(cartItems: [], qty: 0));

  List<PopularModel> pmList  = [];

  void addItemsToCart(PopularModel pm, int qty)
  {
    pmList.add(pm);
    state = state.copyWith(pmList, qty);


  }


}

class CartUseCases{
  List<PopularModel> cartItems;
  int qty;

  CartUseCases({required this.cartItems,
               required this.qty});


  CartUseCases copyWith(List<PopularModel> cartItems, int qty)
{
  return CartUseCases(cartItems: cartItems ?? this.cartItems, qty: qty ?? this.qty);

}
}