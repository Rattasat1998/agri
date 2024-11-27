import 'tractor_model.dart';

class MemberModel {
  final String name;
  final String profile;
  final int riceField;
  final List<TractorModel> tractors;

  MemberModel({
    required this.name,
    required this.profile,
    required this.riceField,
     this.tractors = const [],
  });

  static final members = [
    MemberModel(
      name: 'สมหญิง',
      profile: 'https://cdn.pixabay.com/photo/2016/11/18/19/07/happy-1836445_640.jpg',
      riceField: 50,
        tractors: [
          TractorModel(
            name: 'รถไถทดสอบ1',
            ownerName: 'สมหญิง',
            groupName: 'กลุ่มเกษตรกรที่ 1',
            phoneNumber: '0927043617',
            star: 2.5,
            detail:
            'แทรกเตอร์ M6240SUH 62 แรงม้า พร้อมพาคุณลุยได้ทุกงาน ไม่ว่าจะเป็นงานนาหรืองานไร่ มาพร้อมกับความคล่องตัวในการใช้งานด้วยเกียร์เปลี่ยนทิศทางไฮดรอลิคชัทเทิล เปลี่ยนเกียร์ได้โดยไม่ต้องเหยียบคลัตช์ ช่วยเพิ่มประสิทธิภาพในการทำงาน',
            countOfRented: 22,
            countOfUsage: 150,
            images: [
              'https://cdn.pixabay.com/photo/2018/07/30/00/05/tractor-3571452_640.jpg',
              'https://cdn.pixabay.com/photo/2018/05/08/10/26/tractor-3382681_640.jpg',
              'https://cdn.pixabay.com/photo/2014/07/08/12/40/soil-386749_640.jpg',
            ],
          ),
          TractorModel(
            name: 'รถไถทดสอบ2',
            ownerName: 'สมหญิง',
            groupName: 'กลุ่มเกษตรกรที่ 1',
            phoneNumber: '0927043617',
            star: 4.5,
            detail:
            'แทรกเตอร์ M6240SUH 70 แรงม้า พร้อมพาคุณลุยได้ทุกงาน ไม่ว่าจะเป็นงานนาหรืองานไร่ มาพร้อมกับความคล่องตัวในการใช้งานด้วยเกียร์เปลี่ยนทิศทางไฮดรอลิคชัทเทิล เปลี่ยนเกียร์ได้โดยไม่ต้องเหยียบคลัตช์ ช่วยเพิ่มประสิทธิภาพในการทำงาน',
            countOfRented: 55,
            countOfUsage: 350,
            images: [
              'https://cdn.pixabay.com/photo/2017/04/29/21/04/tractor-2271577_640.jpg',
              'https://cdn.pixabay.com/photo/2020/05/11/09/22/agriculture-5157184_640.jpg',
              'https://cdn.pixabay.com/photo/2022/07/02/17/57/tractor-7297718_640.jpg',
            ],
          ),
        ],
    ),
    MemberModel(
      name: 'สมชาย',
      profile: 'https://cdn.pixabay.com/photo/2016/11/29/09/38/adult-1868750_640.jpg',
      riceField: 25,
    ),
    MemberModel(
      name: 'สมหมาย',
      profile: 'https://cdn.pixabay.com/photo/2016/03/24/09/10/man-1276384_640.jpg',
      riceField: 55,
      tractors: [
        TractorModel(
          name: 'รถไถทดสอบ1',
          ownerName: 'สมหมาย',
          groupName: 'กลุ่มเกษตรกรที่ 1',
          phoneNumber: '0927043617',
          star: 2.5,
          detail:
          'แทรกเตอร์ M6240SUH 62 แรงม้า พร้อมพาคุณลุยได้ทุกงาน ไม่ว่าจะเป็นงานนาหรืองานไร่ มาพร้อมกับความคล่องตัวในการใช้งานด้วยเกียร์เปลี่ยนทิศทางไฮดรอลิคชัทเทิล เปลี่ยนเกียร์ได้โดยไม่ต้องเหยียบคลัตช์ ช่วยเพิ่มประสิทธิภาพในการทำงาน',
          countOfRented: 22,
          countOfUsage: 150,
          images: [
            'https://cdn.pixabay.com/photo/2018/07/30/00/05/tractor-3571452_640.jpg',
            'https://cdn.pixabay.com/photo/2018/05/08/10/26/tractor-3382681_640.jpg',
            'https://cdn.pixabay.com/photo/2014/07/08/12/40/soil-386749_640.jpg',
          ],
        ),
        TractorModel(
          name: 'รถไถทดสอบ2',
          ownerName: 'สมหมาย',
          groupName: 'กลุ่มเกษตรกรที่ 1',
          phoneNumber: '0927043617',
          star: 4.5,
          detail:
          'แทรกเตอร์ M6240SUH 70 แรงม้า พร้อมพาคุณลุยได้ทุกงาน ไม่ว่าจะเป็นงานนาหรืองานไร่ มาพร้อมกับความคล่องตัวในการใช้งานด้วยเกียร์เปลี่ยนทิศทางไฮดรอลิคชัทเทิล เปลี่ยนเกียร์ได้โดยไม่ต้องเหยียบคลัตช์ ช่วยเพิ่มประสิทธิภาพในการทำงาน',
          countOfRented: 55,
          countOfUsage: 350,
          images: [
            'https://cdn.pixabay.com/photo/2017/04/29/21/04/tractor-2271577_640.jpg',
            'https://cdn.pixabay.com/photo/2020/05/11/09/22/agriculture-5157184_640.jpg',
            'https://cdn.pixabay.com/photo/2022/07/02/17/57/tractor-7297718_640.jpg',
          ],
        ),
        TractorModel(
          name: 'รถไถทดสอบ3',
          ownerName: 'สมหมาย',
          groupName: 'กลุ่มเกษตรกรที่ 1',
          phoneNumber: '0927043617',
          star: 2.5,
          detail:
          'แทรกเตอร์ M6240SUH 62 แรงม้า พร้อมพาคุณลุยได้ทุกงาน ไม่ว่าจะเป็นงานนาหรืองานไร่ มาพร้อมกับความคล่องตัวในการใช้งานด้วยเกียร์เปลี่ยนทิศทางไฮดรอลิคชัทเทิล เปลี่ยนเกียร์ได้โดยไม่ต้องเหยียบคลัตช์ ช่วยเพิ่มประสิทธิภาพในการทำงาน',
          countOfRented: 22,
          countOfUsage: 150,
          images: [
            'https://cdn.pixabay.com/photo/2018/07/30/00/05/tractor-3571452_640.jpg',
            'https://cdn.pixabay.com/photo/2018/05/08/10/26/tractor-3382681_640.jpg',
            'https://cdn.pixabay.com/photo/2014/07/08/12/40/soil-386749_640.jpg',
          ],
        ),
        TractorModel(
          name: 'รถไถทดสอบ4',
          ownerName: 'สมหมาย',
          groupName: 'กลุ่มเกษตรกรที่ 1',
          phoneNumber: '0927043617',
          star: 4.5,
          detail:
          'แทรกเตอร์ M6240SUH 70 แรงม้า พร้อมพาคุณลุยได้ทุกงาน ไม่ว่าจะเป็นงานนาหรืองานไร่ มาพร้อมกับความคล่องตัวในการใช้งานด้วยเกียร์เปลี่ยนทิศทางไฮดรอลิคชัทเทิล เปลี่ยนเกียร์ได้โดยไม่ต้องเหยียบคลัตช์ ช่วยเพิ่มประสิทธิภาพในการทำงาน',
          countOfRented: 55,
          countOfUsage: 350,
          images: [
            'https://cdn.pixabay.com/photo/2017/04/29/21/04/tractor-2271577_640.jpg',
            'https://cdn.pixabay.com/photo/2020/05/11/09/22/agriculture-5157184_640.jpg',
            'https://cdn.pixabay.com/photo/2022/07/02/17/57/tractor-7297718_640.jpg',
          ],
        ),
      ],
    ),
    MemberModel(
      name: 'สมปอง',
      profile: 'https://cdn.pixabay.com/photo/2018/11/08/23/52/man-3803551_640.jpg',
      riceField: 32,
      tractors: [
        TractorModel(
          name: 'รถไถทดสอบ1',
          ownerName: 'สมปอง',
          groupName: 'กลุ่มเกษตรกรที่ 1',
          phoneNumber: '0927043617',
          star: 2.5,
          detail:
          'แทรกเตอร์ M6240SUH 62 แรงม้า พร้อมพาคุณลุยได้ทุกงาน ไม่ว่าจะเป็นงานนาหรืองานไร่ มาพร้อมกับความคล่องตัวในการใช้งานด้วยเกียร์เปลี่ยนทิศทางไฮดรอลิคชัทเทิล เปลี่ยนเกียร์ได้โดยไม่ต้องเหยียบคลัตช์ ช่วยเพิ่มประสิทธิภาพในการทำงาน',
          countOfRented: 22,
          countOfUsage: 150,
          images: [
            'https://cdn.pixabay.com/photo/2018/07/30/00/05/tractor-3571452_640.jpg',
            'https://cdn.pixabay.com/photo/2018/05/08/10/26/tractor-3382681_640.jpg',
            'https://cdn.pixabay.com/photo/2014/07/08/12/40/soil-386749_640.jpg',
          ],
        ),
        TractorModel(
          name: 'รถไถทดสอบ2',
          ownerName: 'สมปอง',
          groupName: 'กลุ่มเกษตรกรที่ 1',
          phoneNumber: '0927043617',
          star: 4.5,
          detail:
          'แทรกเตอร์ M6240SUH 70 แรงม้า พร้อมพาคุณลุยได้ทุกงาน ไม่ว่าจะเป็นงานนาหรืองานไร่ มาพร้อมกับความคล่องตัวในการใช้งานด้วยเกียร์เปลี่ยนทิศทางไฮดรอลิคชัทเทิล เปลี่ยนเกียร์ได้โดยไม่ต้องเหยียบคลัตช์ ช่วยเพิ่มประสิทธิภาพในการทำงาน',
          countOfRented: 55,
          countOfUsage: 350,
          images: [
            'https://cdn.pixabay.com/photo/2017/04/29/21/04/tractor-2271577_640.jpg',
            'https://cdn.pixabay.com/photo/2020/05/11/09/22/agriculture-5157184_640.jpg',
            'https://cdn.pixabay.com/photo/2022/07/02/17/57/tractor-7297718_640.jpg',
          ],
        ),
      ],
    ),
    MemberModel(
      name: 'สมหญิง',
      profile: 'https://cdn.pixabay.com/photo/2015/07/20/12/57/ambassador-852766_640.jpg',
      riceField: 50,
    ),

    MemberModel(
      name: 'สมหญิง',
      profile: 'https://cdn.pixabay.com/photo/2016/11/18/19/07/happy-1836445_640.jpg',
      riceField: 50,
    ),
    MemberModel(
      name: 'สมชาย',
      profile: 'https://cdn.pixabay.com/photo/2016/11/29/09/38/adult-1868750_640.jpg',
      riceField: 25,
    ),
    MemberModel(
      name: 'สมหมาย',
      profile: 'https://cdn.pixabay.com/photo/2016/03/24/09/10/man-1276384_640.jpg',
      riceField: 55,
    ),
    MemberModel(
      name: 'สมปอง',
      profile: 'https://cdn.pixabay.com/photo/2018/11/08/23/52/man-3803551_640.jpg',
      riceField: 32,
    ),
    MemberModel(
      name: 'สมหญิง',
      profile: 'https://cdn.pixabay.com/photo/2015/07/20/12/57/ambassador-852766_640.jpg',
      riceField: 50,
    ),

  ];
}
