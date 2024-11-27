class TractorModel {
  final String name;
  final String ownerName;
  final String groupName;
  final List<String> images;
  final String phoneNumber;
  final double star;
  final String detail;
  final double countOfRented;
  final double countOfUsage;

  TractorModel({
    required this.name,
    required this.ownerName,
    this.images = const [],
    required this.groupName,
    required this.phoneNumber,
    required this.star,
    required this.detail,
    required this.countOfRented,
    required this.countOfUsage,
  });

  static final tractors = [
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
      ownerName: 'สมศรี',
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
      ownerName: 'สมชาย',
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
      ownerName: 'สมศรี',
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
      ownerName: 'สมชาย',
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
      ownerName: 'สมศรี',
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
      ownerName: 'สมชาย',
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
      ownerName: 'สมศรี',
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
      ownerName: 'สมชาย',
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
  ];
}
