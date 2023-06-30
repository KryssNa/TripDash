// // import 'package:flutter/material.dart';
// // import 'package:aeroplane/shared/theme.dart';
// //
// // class SeatItem extends StatelessWidget {
// //   //NOTE : 0. Available 1. Selected 2. Unavailable
// //
// //   final int status;
// //
// //   const SeatItem({Key? key, required this.status}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     backgroundColor() {
// //       switch (status) {
// //         case 0:
// //           return kAvailableColor;
// //         case 1:
// //           return kPrimaryColor;
// //         case 2:
// //           return kUnavailableColor;
// //         default:
// //           return kUnavailableColor;
// //       }
// //     }
// //
// //     borderColor() {
// //       switch (status) {
// //         case 0:
// //           return kPrimaryColor;
// //         case 1:
// //           return kPrimaryColor;
// //         case 2:
// //           return kUnavailableColor;
// //         default:
// //           return kUnavailableColor;
// //       }
// //     }
// //
// //     child() {
// //       switch (status) {
// //         case 0:
// //           return SizedBox();
// //         case 1:
// //           return Center(
// //             child: Text(
// //               'You',
// //               style: whiteTextStyle.copyWith(fontWeight: semiBold),
// //             ),
// //           );
// //         case 2:
// //           return SizedBox();
// //         default:
// //           return SizedBox();
// //       }
// //     }
// //
// //     return Container(
// //         width: 48,
// //         height: 48,
// //         decoration: BoxDecoration(
// //             color: backgroundColor(),
// //             borderRadius: BorderRadius.circular(15),
// //             border: Border.all(color: borderColor(), width: 2)),
// //         child: child());
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:aeroplane/shared/theme.dart';
//
// // class SeatItem extends StatelessWidget {
// //   final int status;
// //   final VoidCallback onTap;
// //
// //   const SeatItem({Key? key, required this.status, required this.onTap}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     Color backgroundColor() {
// //       switch (status) {
// //         case 0:
// //           return kAvailableColor;
// //         case 1:
// //           return kPrimaryColor;
// //         case 2:
// //           return kUnavailableColor;
// //         default:
// //           return kUnavailableColor;
// //       }
// //     }
// //
// //     Color borderColor() {
// //       switch (status) {
// //         case 0:
// //           return kPrimaryColor;
// //         case 1:
// //           return kPrimaryColor;
// //         case 2:
// //           return kUnavailableColor;
// //         default:
// //           return kUnavailableColor;
// //       }
// //     }
// //
// //     Widget child() {
// //       switch (status) {
// //         case 0:
// //           return SizedBox();
// //         case 1:
// //           return Center(
// //             child: Text(
// //               'You',
// //               style: whiteTextStyle.copyWith(fontWeight: FontWeight.w600),
// //             ),
// //           );
// //         case 2:
// //           return SizedBox();
// //         default:
// //           return SizedBox();
// //       }
// //     }
// //
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         width: 48,
// //         height: 48,
// //         decoration: BoxDecoration(
// //           color: backgroundColor(),
// //           borderRadius: BorderRadius.circular(15),
// //           border: Border.all(color: borderColor(), width: 2),
// //         ),
// //         child: child(),
// //       ),
// //     );
// //   }
// // }
// //
//
//
// class SeatItem extends StatelessWidget {
//   //NOTE : 0. Available 1. Selected 2. Unavailable
//
//   final int status;
//   final VoidCallback onTap;
//
//   const SeatItem({Key? key, required this.status, required this.onTap}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Color backgroundColor() {
//       switch (status) {
//         case 0:
//           return kAvailableColor;
//         case 1:
//           return kPrimaryColor;
//         case 2:
//           return kUnavailableColor;
//         default:
//           return kUnavailableColor;
//       }
//     }
//
//     Color borderColor() {
//       switch (status) {
//         case 0:
//           return kPrimaryColor;
//         case 1:
//           return kPrimaryColor;
//         case 2:
//           return kUnavailableColor;
//         default:
//           return kUnavailableColor;
//       }
//     }
//
//     Widget child() {
//       switch (status) {
//         case 0:
//           return SizedBox();
//         case 1:
//           return Center(
//             child: Text(
//               'You',
//               style: whiteTextStyle.copyWith(fontWeight: FontWeight.w600),
//             ),
//           );
//         case 2:
//           return Center(
//             child: Text(
//               'Booked',
//               style: whiteTextStyle.copyWith(fontWeight: FontWeight.w600),
//             ),
//           );
//         default:
//           return SizedBox();
//       }
//     }
//
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 48,
//         height: 48,
//         decoration: BoxDecoration(
//           color: backgroundColor(),
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: borderColor(), width: 2),
//         ),
//         child: child(),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:aeroplane/shared/theme.dart';

class SeatItem extends StatelessWidget {
  final int status;
  final VoidCallback onTap;

  const SeatItem({Key? key, required this.status, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor() {
      switch (status) {
        case 0:
          return kAvailableColor;
        case 1:
          return kPrimaryColor;
        case 2:
          return kUnavailableColor;
        default:
          return kUnavailableColor;
      }
    }

    Color borderColor() {
      switch (status) {
        case 0:
          return kPrimaryColor;
        case 1:
          return kPrimaryColor;
        case 2:
          return kUnavailableColor;
        default:
          return kUnavailableColor;
      }
    }

    Widget child() {
      switch (status) {
        case 0:
          return SizedBox();
        case 1:
          return Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 24,
          );
        case 2:
          return SizedBox();
        default:
          return SizedBox();
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 4), // Add margin to maintain space between seats
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor(), width: 2),
        ),
        child: child(),
      ),
    );
  }
}
