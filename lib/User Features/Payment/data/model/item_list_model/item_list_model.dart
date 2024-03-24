import 'package:ghosn_app/User%20Features/Payment/data/model/item_list_model/items.dart';



class ItemListModel {
	List<OrderItemModel>? orders;

	ItemListModel({this.orders});

	factory ItemListModel.fromJson(Map<String, dynamic> json) => ItemListModel(
				orders: (json['items'] as List<dynamic>?)
						?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'items': orders?.map((e) => e.toJson()).toList(),
			};
}
