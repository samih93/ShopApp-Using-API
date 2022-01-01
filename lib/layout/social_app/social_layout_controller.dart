import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:udemy_flutter/models/social_app/post_model.dart';
import 'package:udemy_flutter/models/social_app/social_usermodel.dart';
import 'package:udemy_flutter/modules/social_app/chats/chat_screen.dart';
import 'package:udemy_flutter/modules/social_app/feeds/feeds_screen.dart';
import 'package:udemy_flutter/modules/social_app/new_post/new_post_screen.dart';
import 'package:udemy_flutter/modules/social_app/settings/setting_screen.dart';
import 'package:udemy_flutter/modules/social_app/users/users_screen.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SocialLayoutController extends GetxController {
  SocialLayoutController() {
    getUserData();
  }

// NOTE: -------------------Bottom Navigation------------------------
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
    BottomNavigationBarItem(icon: Icon(Icons.post_add_sharp), label: "Post"),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Users",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];

  //NOTE: ---------------------------Screens and Titles----------------------------
  final screens = [
    SocialFeedsScreen(),
    SocialChatScreen(),
    NewPostScreen(),
    SocialUsersScreen(),
    SocialSettingScreen()
  ];

  final appbar_title = ['Home', 'Chat', 'Post', 'Users', 'Settings'];

  //NOTE:  -------------------- Get User Data-------------------------
  SocialUserModel? _socialUserModel;
  SocialUserModel? get socialUserModel => _socialUserModel;

  void getUserData() {
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      _socialUserModel = SocialUserModel.fromJson(value.data()!);
      print("get user email :" + _socialUserModel!.email.toString());
      update();
    });
  }

  // NOTE: --------------------- On Change Index Of Screens ------------------

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void onchangeIndex(int index) {
    _currentIndex = index;
    update();
  }

//NOTE :----------------------- Pick Profile Image and Cover Image-------------------------------
  File? _profileimage;
  File? get profileimage => _profileimage;

  File? _coverimage;
  File? get coverimage => _coverimage;

  var picker = ImagePicker();

  Future<void> pickImage(bool isForProfile) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (isForProfile) {
        _profileimage = File(pickedFile.path);
        //NOTE :upload profile image to firebase storage
        uploadProfileImage();
      } else {
        _coverimage = File(pickedFile.path);
        //NOTE :upload cover image to firebase storage
        uploadCoverImage();
      }
      update();
    } else {
      print('no image selected');
    }
  }

//NOTE ------------------ Upload profile image --------------------

  bool? _isloadingUrlProfile = false;
  bool? get isloadingUrlProfile => _isloadingUrlProfile;

  String? _imageProfileUrl = null;
  String? get imageProfileUrl => _imageProfileUrl;

  Future<void> uploadProfileImage() async {
    _isloadingUrlProfile = true;
    update();
    FirebaseStorage.instance
        .ref('')
        .child('users/${Uri.file(_profileimage!.path).pathSegments.last}')
        .putFile(_profileimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        _imageProfileUrl = value;
        _isloadingUrlProfile = false;
        update();
      }).catchError((error) {
        {
          print(error.toString());
        }
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

//NOTE  ------------- Uplaod cover image ---------------------

  bool? _isloadingUrlcover = false;
  bool? get isloadingUrlcover => _isloadingUrlcover;

  String? _imagecoverUrl = null;
  String? get imageCoverUrl => _imagecoverUrl;

  Future<void> uploadCoverImage() async {
    _isloadingUrlcover = true;
    update();
    FirebaseStorage.instance
        .ref('')
        .child('users/${Uri.file(_coverimage!.path).pathSegments.last}')
        .putFile(_coverimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        _imagecoverUrl = value;
        _isloadingUrlcover = false;
        update();
      }).catchError((error) {
        {
          print(error.toString());
        }
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

//NOTE :---------------------- update user --------------------------
  bool? _isloadingupdateUser = false;
  bool? get isloadingupdateUser => _isloadingupdateUser;

  Future<void> updateUser(
      {required String name,
      required String phone,
      required String bio}) async {
    print("Profile :" + _imageProfileUrl.toString());
    print("cover : " + _imagecoverUrl.toString());
    _isloadingupdateUser = true;
    update();
    SocialUserModel model = SocialUserModel(
        name: name,
        phone: phone,
        bio: bio,
        email: _socialUserModel!.email,
        image: _imageProfileUrl ?? _socialUserModel!.image.toString(),
        coverimage: _imagecoverUrl ?? _socialUserModel!.coverimage.toString(),
        uId: _socialUserModel!.uId);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_socialUserModel!.uId)
        .update(model.toJson())
        .then((value) {
      print("User Updated");

      _profileimage = null;
      _coverimage = null;
      _imageProfileUrl = null;
      _imagecoverUrl = null;
      _isloadingupdateUser = false;
      getUserData();
    }).catchError((error) {
      print(error.toString());
    });
  }

  //NOTE :---------------------- Manage New Post  --------------------------

  File? _postimage;
  File? get postimage => _postimage;

  Future<void> pickPostImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _postimage = File(pickedFile.path);
      //NOTE :upload post image to firebase storage
      uploadPostImage();
      update();
    } else {
      print('no image selected');
    }
  }

// NOTE :  upload post image
  bool? _isloadingurlPost = false;
  bool? get isloadingurlPost => _isloadingurlPost;

  String? _imagePostUrl = null;
  String? get imagePostUrl => _imagePostUrl;

  Future<void> uploadPostImage() async {
    _isloadingurlPost = true;
    update();
    FirebaseStorage.instance
        .ref('')
        .child('posts/${Uri.file(_postimage!.path).pathSegments.last}')
        .putFile(_postimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        _imagePostUrl = value;
        _isloadingurlPost = false;
        update();
      }).catchError((error) {
        {
          print(error.toString());
        }
      });
    }).catchError((error) {
      print(error.toString());
    });
  }

// NOTE : create post
  bool? _isloadingcreatePost = false;
  bool? get isloadingcreatePost => _isloadingcreatePost;

  Future<void> createNewPost({
    required String postdate,
    required String text,
  }) async {
    _isloadingcreatePost = true;
    update();
    PostModel model = PostModel(
        name: _socialUserModel!.name,
        image: _socialUserModel!.image.toString(),
        uId: _socialUserModel!.uId,
        postdate: postdate,
        text: text,
        postImage: _imagePostUrl ?? '');
    await FirebaseFirestore.instance
        .collection('posts')
        // NOTE .doc('1').set() set data under document Id =1
        .add(model.toJson()) // NOTE .add will generate new Id
        .then((value) {
      _postimage = null;
      _imagePostUrl = null;
      _isloadingcreatePost = false;
      update();
    }).catchError((error) {
      print(error.toString());
    });
  }

  void removePostImage() {
    _postimage = null;
    _imagePostUrl = null;
    update();
  }
}
