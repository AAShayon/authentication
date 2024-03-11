import 'package:excel_hrm/utils/constants/image_strings.dart';

class ImageTitle{

  String title;
  String imagUrl;

  ImageTitle({required this.title,required this.imagUrl});
}

final List<ImageTitle> imageTitleList=[
  ImageTitle(title: 'Employees', imagUrl: HMImages.employees),
  ImageTitle(title: 'payroll', imagUrl: HMImages.payroll),
  ImageTitle(title: 'timesheet', imagUrl: HMImages.timeSheet),
  ImageTitle(title: 'Accounts', imagUrl: HMImages.account),
  ImageTitle(title: 'Training', imagUrl: HMImages.training),
  ImageTitle(title: 'Recruitment', imagUrl: HMImages.recruitment),
  ImageTitle(title: 'Ticket', imagUrl: HMImages.ticket),
  ImageTitle(title: 'Event', imagUrl: HMImages.event),
  ImageTitle(title: 'Document', imagUrl: HMImages.document),
  ImageTitle(title:'Report' , imagUrl: HMImages.report)
  
];