import 'package:test_koffie_soft/index.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'home'.tr,
          style: const TextStyle(color: ColorConstants.blue600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8.0,
          child: ListTile(
            leading: Image.network(
                AppConfigs.baseUrl + '/static' + controller.userInfo.photo.uri),
            title: Text(controller.userInfo.firstname +
                ' ' +
                controller.userInfo.lastname),
            subtitle: Text(controller.userInfo.email),
          ),
        ),
      ),
    );
  }
}
