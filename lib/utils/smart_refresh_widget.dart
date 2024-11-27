import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartRefreshWidget extends StatefulWidget {
  final Function()? onRefresh;
  final Function()? onLoad;
  final RefreshController refreshController;
  final Widget child;

  const SmartRefreshWidget(
      {Key? key,
        required this.onRefresh,
        this.onLoad,
        required this.refreshController,
        required this.child})
      : super(key: key);

  @override
  State<SmartRefreshWidget> createState() => _SmartRefreshWidgetState();
}

class _SmartRefreshWidgetState extends State<SmartRefreshWidget> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: widget.refreshController,
      enablePullDown: true,
      enablePullUp: true,
      header: const ClassicHeader(
        refreshingIcon: CupertinoActivityIndicator(),
        releaseText: 'ปล่อยเพื่อรีเฟรช',
        refreshingText: 'กำลังรีเฟรช',
        completeText: 'รีเฟรชสำเร็จ',
        failedText: 'รีเฟรชล้มเหลว',
        idleText: 'ดึงลงเพื่อรีเฟรช',
      ),
      onRefresh: widget.onRefresh,
      onLoading: widget.onLoad,
      footer: CustomFooter(
        builder: (BuildContext context, mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = const Text("ดึงขึ้นเพื่อโหลดเพิ่มเติม");
          } else if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = const Text("ปล่อยเพื่อโหลดเพิ่มเติม");
          } else {
            body = const Text("ไม่มีข้อมูลเพิ่มเติมแล้ว");
          }
          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      child: widget.child,
    );
  }
}
