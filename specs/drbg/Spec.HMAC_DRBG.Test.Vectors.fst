module Spec.HMAC_DRBG.Test.Vectors

open Lib.Meta
open Spec.Hash.Definitions

#set-options "--fuel 0 --ifuel 0"

///
/// HMAC-DRBG test vectors from NIST CAVP
/// https://csrc.nist.gov/projects/cryptographic-algorithm-validation-program/random-number-generators#DRBG
///

type vec = {
  a: hash_alg;
  entropy_input: hex_string;
  nonce: hex_string;
  personalization_string: hex_string;
  entropy_input_reseed: hex_string;
  additional_input_reseed: hex_string;
  additional_input_1: hex_string;
  additional_input_2: hex_string;
  returned_bits: hex_string;
}

let test_vectors : list vec = [
  { a = SHA1;
    entropy_input = "7cad65e5cc2888ae4e960f5d143c1425";
    nonce = "fc0785db471cc55e";
    personalization_string = "";
    entropy_input_reseed = "66451d29cf65d899a281905ff9b29e87";
    additional_input_reseed = "800d583b2560d2a2300132ee2d13f19f";
    additional_input_1 = "42eae705c2225d212fa0554ac6ac564b";
    additional_input_2 = "72081e7e70200f1982c3ad9cb1d3ddbe";
    returned_bits = "953e92258be7ff61b97077252ab9835231e366dfa5b635fb889c337562a2641d3aa9e46feeb2a4ea03cb73f1f801594c3cc71d2945c11a52bb0e93419df5d0854ad5f2e36d223c119e145cad507495a7";
  } ;
  { a = SHA1;
    entropy_input = "0736a083595a8397cb9e676cb37bfb5a";
    nonce = "0b184a6d0a630abb";
    personalization_string = "c302503d86a2bde46a0c63561a86cfd9";
    entropy_input_reseed = "4b50977033483277647945ffefa109e2";
    additional_input_reseed = "4dad813744f54324b3046a85be3cc3c8";
    additional_input_1 = "7441fefa60f7ee48ff387b587efcb3e6";
    additional_input_2 = "f0d005289a9d3993c44bb750d96cc1bc";
    returned_bits = "c03971897b854585994eeb8e3d6b556e1a8df18a7ff88f83e8fe17e6dd9071070a6dbef67cb612acf122caa7f817704b3efc6e1b1fd6c330e0a732abea93c00818e12c504fd8e0b36c88f84a95b49362";
  } ;
  { a = SHA1;
    entropy_input = "172054c827aa895fa1239b7a484752f2";
    nonce = "edb272c0a98c7592";
    personalization_string = "47bc78bfbd1bb7e2dcdbf4ebe42c5293";
    entropy_input_reseed = "29f92a0e5d24e19af698877f69a0efb5";
    additional_input_reseed = "";
    additional_input_1 = "";
    additional_input_2 = "";
    returned_bits = "6464bdaed23245db1f6510f8659e1b19881d606220997b837684a7f88a166cb75ce6829cb3f11e55d2b7ad349cc1f4ba02e30a76f970613aa74635b0034f8e985cde4f1fddb964657a169386e20767d1";
  } ;
  { a = SHA1;
    entropy_input = "b1a19bb07c30ca4f49dc69130d23c0a7";
    nonce = "2c06067297058ec5";
    personalization_string = "";
    entropy_input_reseed = "840802cea2e55a3b1e487bb7aee62b42";
    additional_input_reseed = "";
    additional_input_1 = "";
    additional_input_2 = "";
    returned_bits = "f41bb7ae532344a90d413b66a94ee1d0254a5d5e974e36b1993b1042586f54728d1ebb7c5d351558ed675177e432360708c008984c41bc4c828d83ddeca9ef8ecd9da880a135400a43f91f4ca6d59d00";
  } ;
  { a = SHA1;
    entropy_input = "343f9dde89a9e3ecc4f9653c8b392dab";
    nonce = "c4fb3606d8f62db1";
    personalization_string = "";
    entropy_input_reseed = "021fc3ead46ff8bda3b79701b7893a39";
    additional_input_reseed = "8918831e15d430616f4bd91046fe0930";
    additional_input_1 = "a8772304a1accb16662218a748bb4fd8";
    additional_input_2 = "4bf9f2b9d15ec3071ff3674ad7418759";
    returned_bits = "9782b2111c985bcaab0b8905ad9bcb97eb3f3554c68d79ee5ca1dcfbd0d7850f65090c79d21d1c6253cf493f08392cfb60461fbc20beb4cf3e022123816f0bc597abebc775633db324c7c1c7cd5e8c56";
  } ;
  { a = SHA1;
    entropy_input = "0a086726f66f2ac9e7daa61908f63319";
    nonce = "debf011d406a5b23";
    personalization_string = "58582da74f8f91db0444beae39016857";
    entropy_input_reseed = "c92ba2900ab0a4ca3553806392b6b3e5";
    additional_input_reseed = "5604a76e74ef4b304466f21df57c70f3";
    additional_input_1 = "e1e4d0754cc306a1752b50c5c446a3d0";
    additional_input_2 = "71dacf61875cbf3655e4f7d2e081d493";
    returned_bits = "afbb3a05e753f6ebf026594a03b22b3f032edb873b9e1e22532e360a097d7e0d4585bbf82f9b12d7a88630efcadeb8ffdc8b7c8a53fe94eea9d2cd6cf90828c3511fc936222ba845fc77995a03855578";
  } ;
  { a = SHA2_256;
    entropy_input = "14683ec508a29d7812e0f04a3e9d87897000dc07b4fbcfda58eb7cdabc492e58";
    nonce = "b2243e744eb980b3ece25ce76383fd46";
    personalization_string = "";
    entropy_input_reseed = "18590e0ef4ee2bdae462f76d9324b3002559f74c370cfccf96a571d6955703a7";
    additional_input_reseed = "9ea3ccca1e8d791d22fcda621fc4d51b882df32d94ea8f20ee449313e6909b78";
    additional_input_1 = "16366a578b5ea4d0cb547790ef5b4fd45d7cd845bc8a7c45e99419c8737debb4";
    additional_input_2 = "a68caa29a53f1ba857e484d095805dc319fe6963e4c4daaf355f722eba746b92";
    returned_bits = "c4e7532ee816789c2d3da9ff9f4b37139a8515dbf8f9e1d0bf00c12addd79ebbd76236f75f2aa705a09f7955038ebff0d566911c5ea13214e2c2eeb46d23ad86a33b60f7b9448d63eec3e1d59f48b39552857447dc5d7944667a230e3dbfa30ca322f6eacaf7536a286706a627c5083c32de0658b9073857c30fb1d86eb8ad1b";
  } ;
  { a = SHA2_256;
    entropy_input = "a1d5bb7d70621dee6b668b28c56d5610c2f8ced30284cc3e0e48de331af05062";
    nonce = "88a49e3e54c5ea54c98b95de81bcc807";
    personalization_string = "";
    entropy_input_reseed = "b4e2426e98f6eed97a6cdf690a89ee109e84c3dca16c883c26fa4ac671638d8d";
    additional_input_reseed = "5bd1e086ed228cfd8b55c1731fea40c3a63d022599ca2da4bb23118f4821ba62";
    additional_input_1 = "b754b53ac226e8ebe47a3d31496ec822de06fca2e7ef5bf1dec6c83d05368ec3";
    additional_input_2 = "fa7e76b2805d90b3d89fff545010d84f67aa3a2c9eb2ba232e75f4d53267dac3";
    returned_bits = "df6b2460688fa537df3ddfe5575fca5eb8abad56cbc4e5a618a2b4a7daf6e215c3a497974c502f9d0ec35de3fc2ea5d4f10de9b2aee66dcc7e7ae6357983095959b817f0383e3030771bd2ed97406acf78a1a4a5f30fa0992289c9202e69e3eb1eabe227c11409ff430f6dfca1a923a8b17bc4b87e908007f5e9759c41482b01";
  } ;
  { a = SHA2_256;
    entropy_input = "68f21d14525d56233c7e263482d344c388a840103a77fb20ac60ce463cabdc79";
    nonce = "59fa80ae570f3e0c60ac7e2578cec3cb";
    personalization_string = "";
    entropy_input_reseed = "7584b4166530442f06e241dd904f562167e2fdae3247ab853a4a9d4884a5fa46";
    additional_input_reseed = "f6a5482f139045c5389c9246d772c782c4ebf79c3a84b5cf779f458a69a52914";
    additional_input_1 = "9d37b1ce99f8079993ddf0bd54bab218016685b22655a678ce4300105f3a45b7";
    additional_input_2 = "4c97c67026ff43c2ee730e7b2ce8cce4794fd0588deb16185fa6792ddd0d46de";
    returned_bits = "e5f8874be0a8345aabf2f829a7c06bb40e60869508c2bdef071d73692c0265f6a5bf9ca6cf47d75cbd9df88b9cb236cdfce37d2fd4913f177dbd41887dae116edfbdad4fd6e4c1a51aad9f9d6afe7fcafced45a4913d742a7ec00fd6170d63a68f986d8c2357765e4d38835d3fea301afab43a50bd9edd2dec6a979732b25292";
  } ;
  { a = SHA2_256;
    entropy_input = "1ae12a5e4e9a4a5bfa79da30a9e6c62ffc639572ef1254194d129a16eb53c716";
    nonce = "5399b3481fdf24d373222267790a0fec";
    personalization_string = "8280cfdcd7a575816e0199e115da0ea77cae9d30b49c891a6c225e9037ba67e2";
    entropy_input_reseed = "681554ff702658122e91ba017450cfdfc8e3f4911153f7bcc428403e9c7b9d68";
    additional_input_reseed = "226732b7a457cf0ac0ef09fd4f81296573b49a68de5e7ac3070e148c95e8e323";
    additional_input_1 = "45942b5e9a1a128e85e12c34596374ddc85fd7502e5633c7390fc6e6f1e5ef56";
    additional_input_2 = "6fc59929b41e77072886aff45f737b449b105ed7eacbd74c7cbfedf533dbeaa1";
    returned_bits = "b7547332e1509663fcfea2128f7f3a3df484cd8df034b00199157d35d61e35f1a9d481c7d2e81305616d70fc371ee459b0b2267d627e928590edcac3231898b24ef378aa9c3d381619f665379be76c7c1bd535505c563db3725f034786e35bdd90429305fd71d7bf680e8cdd6d4c348d97078f5cf5e89dee2dc410fad4f2a30f";
  } ;
  { a = SHA2_256;
    entropy_input = "10b8789cdbd6778442a45edf228b9923f452631ad0fe9e608d10826ba71da7ca";
    nonce = "159fc5d8e50eb56e22974789b1dc20d1";
    personalization_string = "2dd59e37766c667571b779c06e12ba219188489772f48631a6728b5b867e3cf4";
    entropy_input_reseed = "966d942038030509b20e610062042b6bf104812818893292a68d57d1ce865151";
    additional_input_reseed = "";
    additional_input_1 = "";
    additional_input_2 = "";
    returned_bits = "3e6acd8b4e85b4a0f7928f6bd41a8e6b52524fe72723a0509637d33f15afe7d8da6a15209b9e4149576fbb1fd831f784c04439abda4605d06556dc3002055b5855fba201f6daef79f78d001ed69eca8a418513d02464e8d742c2799cd68edfbe88ae9b35a0aa065c42a4770058c4b026d0350a7afa9c52c3c7fa054f8a96d887";
  } ;
  { a = SHA2_256;
    entropy_input = "e5fa73bed99340c91ab17d039efd248fcd1ab8b0a0f655dd3149949685ecadbd";
    nonce = "af4b94f08300a1eb059ad6a687a22fd1";
    personalization_string = "d0095a4fd7f6d6de2a1f0b292c47ece8565bf8c202f0723d0de7f2f7904537bf";
    entropy_input_reseed = "4dd81fad534aa36e174d06666e95a4d9b3622bf60d8a562c764541ea7c974fe9";
    additional_input_reseed = "117ca0aa9d57973005fad1f8a02f2d62ac701758556b42a8d5382ee55540a86b";
    additional_input_1 = "a36ba41e095a40f37985a5cd7315f3773132f491ef8a453d3970ae72f41c5365";
    additional_input_2 = "abba1d162556eaab729252cd48dead2d7d50a6385b1d270591d465fa38c5597d";
    returned_bits = "2bef01bea1fb0ab5fccbb474a1bacb361ffcc326f1d9f1969048c392f2761ed0a37126433311dec9db18596448cb814eda151b264e3ca464b25de401b0e38b43e93c64f675f37ad91e95c24e6997dc4032fa62ba00f3c8a792d6b539a4e8290b10173b6b35f7278f34f40df7c4cf26518350dfa7e24362320c8446963a9a1369";
  } ;
  { a = SHA2_256;
    entropy_input = "0c2c24287f264c1d5329d18989e7f9ce06b8a9446d26cd90ed718792b13dad94";
    nonce = "fd01d038386b37709f8da03579f82bcc";
    personalization_string = "";
    entropy_input_reseed = "05b523ccf880bfb0da83a05e4eb2ea28cc75a1e4f9e09c8a3959b18622453bdc";
    additional_input_reseed = "85e06a8ca3a741821c3a2a8818131675136efd5841cb96e7ddec7943cc169fa3";
    additional_input_1 = "6b842e1cfdcc6203fa3750cfb3c722f7a85014c06e78da8ea61f0f9e7c20cb4a";
    additional_input_2 = "7ba4a1494a0b498388f94d1726b8baf63e44a03c2bfbbff35ad039b39881720a";
    returned_bits = "b1001e78fdb26dc92e2389ec0eb5eb3059f44ab4f2ead6c74a7615ab8687381898f5b0d838247f41786bb83c077713ff84540ed54061f4d00264699df476873c0dd0c363b998054edc64084efeed7dcf28d7719979978448d7dce8f8aa3868e56b89eebf275f000a39c4cfb5af16a64302a90986cc3042d8826f2e3f7fdb859d";
  } ;
  { a = SHA2_256;
    entropy_input = "c13d6cd63bb7931174696f3e04a0c41cb0b2561134e847ce03e36326b803f8ab";
    nonce = "2084ab32374392ea9f6e8a474f18e9d7";
    personalization_string = "";
    entropy_input_reseed = "aec5a6a7232a52b81ce7e981a359cef1bbd2f1eff8488371468cd1f4147a89c2";
    additional_input_reseed = "";
    additional_input_1 = "";
    additional_input_2 = "";
    returned_bits = "daea78881737cb26d60c36ceb9fec3d281c7aec54b4b9850937b373b2b2621fe077585a1fe88265d84f225552e5c85cbec8d00069648065ac12073aedce8c940460949b597667ecfcedabd7a86a979b904a24d32db10223eae5a98a0d1b6571b8643df2c6265a5d66cee9f4abfc5778146d6fb2b853d82636c1325b2d1ef4576";
  } ;
  { a = SHA2_256;
    entropy_input = "88a76c16d3270ed3fcd176f9d793fa0c35516574c1cef425b6007628afa35e2b";
    nonce = "ff16cf7cb8e49d482cfd3994abc5ef8a";
    personalization_string = "9213c54e3d002df8741163ab9d7e0757cd512c691ad64bafef95cb72539b0ac6";
    entropy_input_reseed = "493b647ff0b3faa2921f12f8f57b919329f2af2fc1f14576d9df2f8cc2ada7a6";
    additional_input_reseed = "";
    additional_input_1 = "";
    additional_input_2 = "";
    returned_bits = "f1330a85f90037876b3749203e849287444a827f0a58c249ff868fc1adba4dce285e076a1f8ae1da8cf9fe14931e8164186c97a8feaf24583451f116e65f8e432e7ed55a36683120377e23128dca1540fefbf3af1b56d5c74187f5286d0a95fb55931770543060ce8df08f3c1959a1f4fc36b64671e0654fffe70d96d521be21";
  } ;
  { a = SHA2_384;
    entropy_input = "e8e99ffcf08aad8e50386f5d079d79d3db783a74165c6126b42b3140f744a7c7";
    nonce = "23541930c8c772adb62981dbef8d054e";
    personalization_string = "";
    entropy_input_reseed = "cdcf1c30228904bd7ba31798bfbbd64757aa251ac9a1ae8c20a050670feac59b";
    additional_input_reseed = "546e04247d6cb5212a57b62f99e1cca767a5768cf79296f45f0db24732ba6368";
    additional_input_1 = "fd45f66c8dede41387373c38674605f3e075c9b7cfc66123a5478b8f8e3ab276";
    additional_input_2 = "39911a79c6edbbc805a50d2aa018742094177a8e216d647c64428c00169ab2d6";
    returned_bits = "871577ddf34b29e5caf132aa82e1d2f1586b76e39aab62acd02f6d4440908a772ac5f6fd48c5f55f1ebe0e76221ac46b834a8a4f5dd9958721ee053ba3aef1574ebd980a5da6a94693662717ee548af0f921421d1afb814e4d1799d351889d2a1bdd57570a913e428e6613b16e158c1cfed038f6578920d60db73dc10a40da9bc363a0206b4e7e49670eccea866efd9a05bc237042cf052f2a4140f9377e3c6792b88ea06323fcebb99c643fc1c3653758d6866cdb148837fb0fdf77de1564cf";
  } ;
  { a = SHA2_384;
    entropy_input = "9319148fb7c2389793e9f53cd3b4ad8f1bb75710088f1c9a18434ce13b190da2";
    nonce = "11fdc53c13aea33985ba2678e8d86d09";
    personalization_string = "";
    entropy_input_reseed = "8619290e975f1c50f6606c7027efe9c8438d3209db71edd023af0eb024a282d2";
    additional_input_reseed = "";
    additional_input_1 = "";
    additional_input_2 = "";
    returned_bits = "30c2327eddb5c3942d90006eadccfc26d27b149f195389abba507c0746e41d7fb8cf30c15f2cdff73ff3d77b4ca0d289f0660073f2c73f83ce819a6a7d8fe911fd109778b501357eca73079d86bed0916deede54e2e86eca2c04f3d0706e2a55ff84942cbfee22b5a92d309b84b8dd3decb9f3f2c4b24efb4f382833ffb867b5fe054b21d47db6c52ff52faa13ce2abdf7996e23a8c96bac48c02980d96234e478370027d55ba8752c17c7a1bf6253084654e79c13bacc51c1815c8b647e36cb";
  } ;
  { a = SHA2_384;
    entropy_input = "f9e25060675e4c5734d818d9c31a0b232474520577e42f8c53f803aee2349f4a";
    nonce = "9a62a41cf3f5a9e198dff8c907a35a3f";
    personalization_string = "";
    entropy_input_reseed = "888a7529909ae36053c75badb44d103118e171784a7b67dc0d7a4e1b1d44391a";
    additional_input_reseed = "10a25d0027b1c55f615d3b7c3f235d791a81dfe8215315e0c38fccde27a5d8da";
    additional_input_1 = "7b10e25044abd0917490e7f1a8cfd24966803fc9be260f3ab5bf954693f60885";
    additional_input_2 = "a3563ec5c089fff127b2a2eaef12bd0cb3b18f3a0999754666113a052fd443f9";
    returned_bits = "83b9fef4f31c71aebf3753d0404208678987fc4cb2d293a8ac8a547aed18a7a9e09d8196a07d6e97c909e64aef00d9b9530ca1cd69d65807857d9b30a74924a6be96dd96fc48ad5931892736a77f62f68c3fca75af3e2ea5b2a336f1e080a24fa28f81fd8b1a34d3c8aac650acaad25ed1e00bc44092a13940c821942add18bf0ed70c578c305711b0a4991ec5bddfaecee804619b197fd716aa2e6713c0cf91ea0a6d46a4d0ea80a7f70f4fc75307d342e69d1fdff989808b7500275cd05218";
  } ;
  { a = SHA2_512;
    entropy_input = "58ebcec4539f4af1b32a854181dd0f512b8c704fa47537096a769eff28c59165";
    nonce = "a18226cfc779efc9550f7be02006d83c";
    personalization_string = "";
    entropy_input_reseed = "230cd6e6909e301d1e99ecd1fff2b2cd00a56c7a684c8907bbb13ce3e9a0cbce";
    additional_input_reseed = "";
    additional_input_1 = "";
    additional_input_2 = "";
    returned_bits = "6f4e86f309f69144603961c5366e4f9b16d10c10593ea689a8e7435a327d2524f4468813ea7f3248d8d4bbe17b175cfc40617149983928b267dc0c4db46d2c17fe8bc0764386758af1a824e12eb897feafc1c7ef66f80ffcd993aa016e139991cde8435ee6bb0de45a7fb61eb1a6beb76e012b848ea003f687537e4bd00ced37efdda66333b53a8dd5220c281fbf68bfd9e72285e78197881efc540da4c1ba80a226013a2d7098d34af4112e7b8c865af15409f6901b952fee4a474e4027051e1dce879ddf5e84f3947dc9b94119d67e6b48ed6fd6b1f813c13d3ff30e121efce7918533925f50c8e381e87ea685f993619bacc9efc0aebc884b450646eeaa5e";
  } ;
  { a = SHA2_512;
    entropy_input = "e1d2d72e7907e7214cb266f1ef641395e54b39e8365304661b0bee371f324652";
    nonce = "8417ffd58420e48ec063de5df4462e39";
    personalization_string = "";
    entropy_input_reseed = "e6cae1b5f3a3a12faaaf39b98ee592c8d4f56b9d4534add5104b357d788c23ab";
    additional_input_reseed = "";
    additional_input_1 = "";
    additional_input_2 = "";
    returned_bits = "626a0863321ac75e0b6240ea6a619458634a978245c1533819c97114e63914009c9cab732f1310f60f64f033b00729424228671f33425099820ab108412d460f32c0015b73987e937b9bbdd29e5bfb8dbb6c95d2b69fccbc26b060cf0a5dc0992fb0e76b38bcd64fd7a726714e8c8542d44b2f9c5d2f2f8cb370b95e086b07e88f492f51fe6c288d78b76d0c3a6146c9dfce53e76cdbbd158d2944dd10197247004954d92f6b1df4badeb4bb1c98d7d3da2054e3300f6d8dda8863422e6a042c2d84b2bbed6be88f0704763410771b3786d2f6d968b6c224e0cf535e8d02c178b2e0b90e8a7fca0c431b7f3cf41b0a7c17778fe8c2eeb442c910ba88c7c364cd";
  } ;
  { a = SHA2_512;
    entropy_input = "47c42df62b4dd570efd3c2722ad39a2df5f969a13f645fd27b5290877ba70916";
    nonce = "c591934d4f66000ebf8c508fafc44f75";
    personalization_string = "94822903cb5c2003c31c6d072ab0dda435add0de7d8f9d5f08b5cba410d888fd";
    entropy_input_reseed = "d16a2c72c63580b9bcf156862214533a47b1686c871a0165604fdd00a412a484";
    additional_input_reseed = "";
    additional_input_1 = "";
    additional_input_2 = "";
    returned_bits = "f78e61b443b5a97b7e493a8ce35a43545290dd33d15ba4bf0ff78f34a25c46c4ff4cd485964cc96e90fe847d9fc9e42d96e4f5aaccf976a84e3e12100c28b0f7addb1c76f89663e11890f09e4beefe928a1e0b304f1d9dd0414cd115a01b641fd69c7071f2ca7c7f2e53560f4e91010ba11948195bc5deb556686feb0bb92fe61b3171e639ef47418f02be37796efdb6920952f3a8c766b52fccfa757e923e38028a84f9be1b802c1fbbbb4aef825f4c5e4fc1bf6e96f33ab90ea486710718c9e4f3247b2a55ccef5a5d342cac757f0b9f90bcdcc8c2ec3a43149bbd3924c85f0b5b7ae42151f4ded826ee6d47849ef4e8af64adf6863982503c23c4a0514ce0";
  } ;
  { a = SHA2_512;
    entropy_input = "f840c75ce0cdb200a3bd980d6cedf1c7321e5f303cd0446c7afd2d2d66657447";
    nonce = "b215333b15d55326bc9bebae6ae36efe";
    personalization_string = "6d5ca4b1edf6c0afbdce02ecb30923b2f4f2b33121e21b2ffee964cc7de1abe8";
    entropy_input_reseed = "a3a337c6fbeb6a979a4783f2b7f0f0dd6d3a9d3747de639a9047248a04a19f5b";
    additional_input_reseed = "f56d2b1584ba2f129c77b29590c4e1dfdab5527b1791e3e445750ca6d4ae3542";
    additional_input_1 = "05bd799249411b37b80590d49f3348631b06a2408a61635c70687003a8485302";
    additional_input_2 = "12d26ac3b87924cda5d78a3e3c0bd81280e340723643ed1b2ebf2dfd52f5dc43";
    returned_bits = "b48c13af7a9b6fa6385a7ee5d2ab97dcebf71a715dc465f413cb0962292df84c9c83c4093309f749359b0a0ddcc13162cb4ab8ff7b3a6336351ed79ebf47730f97accb6a960a9c5c25e0920a06cccc3b3f62b616c15ca18d7e0b5c2e7d8ad2518d1ef0bef515af866893e9378b56deec32825fe0a2c5a9729f658915b99ab22a03b7187e83d2d0f41b9467c8326f7bc87189dd8ade18b3a7edf0c0ea462dc22109ec91294cf8ce69c8cd0c129b423edadda8fbd25f4983a70d75001576a26405188bb0284975203694c318f3aa7fe47ec041bc4c11c9bceb1b131f74adcd72fc4d2813564de6d4711017800377be9e4c579e88464d67ea6e457a30f8f652375a";
  } ;
  { a = SHA2_512;
    entropy_input = "46dfb4e82fc784ad0094dc81136834e5abc767fff2b876a06b1dbd2508dbed3a";
    nonce = "64d40d3886ac152838f6853121fd68b7";
    personalization_string = "";
    entropy_input_reseed = "329004b8bb439305c4b2dcdd54ca97a4f54cb720a8582cdc03ac26f8a603f3fd";
    additional_input_reseed = "";
    additional_input_1 = "";
    additional_input_2 = "";
    returned_bits = "1887eb4c57b63109f7e446bf0a6c598de093a6013009503925d620f40cf98c8774a6c4a1affe57f8e6b190d0504ff4c4eb55ba4e8a2642d230ee845ed4e31d8adddb1a21dd45346cbda9884a322e6e8f38a82e888f81264a2e254ec2ad5ad4d60a162287e48bc39776eb57dce88cfe467b042d037d1b06877acc39f31b08b1aa13805fe0440a3506a7f59dc6e2376147acf87b78bbaef4c15b579335794688d142eedc231829a34a5c6976e0c8c4649edc178c8f7d8f9ae92f05e3d54df6e47cf9260a5a582a7d3b0030e9a5de912d0f7e4d3103233dcfa8dc0caeddf12a8502c7d941de883690d47bd1a1b61d723abaf0c31d67136fb427edcaa9526a9dc9fa";
  } ;
  { a = SHA2_512;
    entropy_input = "12738c0ddd0c9ce0393d2acabdfa592286072a362e332ca3f8c401f01d610026";
    nonce = "b983dcfd4af5e451f6efe155fcf3ec14";
    personalization_string = "";
    entropy_input_reseed = "07c8b69898caec3a1104e2e30b811ea095384cc636b9bd24e0f9837d3b8e0b4c";
    additional_input_reseed = "fee06814eab6e55cb799e815d84f07278ec6c12d82dea12e261c5b72d0a4eaa5";
    additional_input_1 = "f29287d46d517f090df11af46703d5de778028c787a3aa1e5904ed737b776912";
    additional_input_2 = "0ce576cae56c46042ff27f9f11ed88f1ba534cf5f2581e5ad6bb69b642897886";
    returned_bits = "6293103d028540484c262770ecf7c47c93e778daeda0a5d17a838a5933871af041ac603d81c4a8d73f4cacff06cee74424b57e8440e83939509ea1861adcaa29332bbce015c2b4d6c74154b52a6de9b4c5ec9edb4f54b7be42142b9be07bec5052b78bbc4bb742ee89f0399071f49a73df87b3fe762d1656346c9e8bf8e4b4b8b55e4e1ff23662b6586bf0f105e9d001f1593c175c9a234cbb17cfdafd90ba85f347cb79b0046fb5715bbf35f08345c8fbc26e4722425f04ba431c48ecffcacf15d09ea5abda92f541e46bb63e3933a2c053be4565275d34fa085baf555f92f446ba5e5d05fa0c63c53042092cb66c406d9b6b36b00e76d51b49b75c36e41e52";
  } ;
  { a = SHA2_512;
    entropy_input = "6a2baf90d2e8b83355a0230a8fc7237c140f7699f40026e276deaefd4faa8e06";
    nonce = "b2eecce638bd9fa485e9c9e0d94c3a78";
    personalization_string = "a9ea2c4b2aba1f48f2c71ae1a7fee90e073912c833f2de9c5f802ac2ddc57fbd";
    entropy_input_reseed = "820fc963827166de710208a7dc33936471e491fc21fb0119a252b49fefb28a01";
    additional_input_reseed = "9a463484d172108807c43c048bd13a72d15b470c3443390774a55572d03f47b1";
    additional_input_1 = "d98671978ae14b3531394a0785f78242d4b32eb61cffec6088efb8625693276a";
    additional_input_2 = "b9aef32c40b7aa4fd732e4431bedce071e4f64405be1c85de03c7faa0aa7270f";
    returned_bits = "f55791fdc9d763c34c0fc4cc457a438496f18f483cc60c493fcd0549812fad792f92381532548a8c2257c6e424fa570af260bd47de92f248f57291fead3a68c94be9dc12a656630622be9b602d4fc5037c29bbb5fa92fed2235186048f652131f845f01ed718baf05957e863239e94a5613aa47dd25d5bc9f170e4047e86ef1eefa60e359f2204a3f453c9b37dcfd9410736ee14e296abcdc185f3ed31d8ad461a81479f957e69c34334a24e22f4a69606db8bca6cb189e7de4b83d8a10461fba1942c83aa2e5f84dced9440f10a54c74153643287313ae7fe1bf23c6abecc55c4a3f5540495b7d29a302d426ee2f13dd9ed7a5a6618724544da63527c702e4c";
  } ;
  { a = SHA2_512;
    entropy_input = "47139f544af9f6b0b8022bbae5b936a3f4bf8a0f1cd10c8c5fb8bb7363df6411";
    nonce = "b99640f70c7b55605f7bee6753f30675";
    personalization_string = "0f88357519e8f2c05495c595056e6023460bea47e79f72b113784eb6a77f9f28";
    entropy_input_reseed = "83ed7fb5ae85138161fe90b14b15295b11d81b0ecbd9f1838a2858cf9e822886";
    additional_input_reseed = "e973ea2d399b9c4ad685411a619b7a5ce6f6568bc66efb8855a69f256829a62d";
    additional_input_1 = "1bd8090104b78844f6d615e93b7ae0c921517c97735c0aaa28cdee1eb0a14659";
    additional_input_2 = "4d57d04fc0a2adc6ebb618f1236fee0eb00e38ff82137f5e375be00ad1aac35e";
    returned_bits = "8c4ce3292ae500557b40e4215665c8db5ccba13fbd2d26ca8d1fdad9dca158371ec0003cf801fd28741a2fd31d15e4c0612c68e19fa4e19c626ce4b0184303f4544c414a6541c7d4ac5e6555d22e21c09a096aa9ec09c902eb67a2de9eba94b719ec1ba4dd5dbafee93fcd5125223eaae0bf0d8e7eb92ea0610cc32b69584c0a1565802028f31e6910021d618e5138137eccab894a5385ca4544fdf20919ef2216a3eaf44fdacc7fe05ce22e565a5ab013cd6c9e0a80b430fa8b72127f84f3a780d4ee92c72901eafc8a21c56dcc687ac4ce464cce068895471b36f7b58987ae3272581f00f8d667085bdeadcb06ffef5b1b329bf1db71ce101a2d694de9e322";
  } ;
  { a = SHA2_512;
    entropy_input = "2886ff4e11950c1e639398b2c7d6908d5c2e4daeb7719e6dd98a39b1428ea7df";
    nonce = "8cbb97f58cf243045bdadb2f9bbdab10";
    personalization_string = "";
    entropy_input_reseed = "f487b94b5e4eda49e933e0c268eb5042c422df88061ebffd893d39fafd58efd3";
    additional_input_reseed = "ff8e7656a21bcced082972719ebf87539c4825cb0f4beabd12a12d544dea87af";
    additional_input_1 = "f64dd3b0efc5c8c146f9b9b8f0ec7ccb784e87c16268a4aab31e9eddf2c9b83e";
    additional_input_2 = "9dc16b955ae805f10ebbdc3794a2abe671a339ca148b46ef6ea208698a54a0d8";
    returned_bits = "0e8c9cb99fec37602b291e508e43c2ab323d05764184379ca3a2ca4080ed26c2dbfdf3d1916485c7eba49077ca881fb03d07f967cad9b477959f007a6188150b6630218af55fdd7be2eb88d48b5ec6b6876ec25665c0310624283d2b5460e3736f8b9f0b84095aa4754ac59067a7cc73402c09b1768972b3abd49e0e237a741649ea7888ea4a024c0952b94af27c53b13afcaa4fb7976f65443809d1bbd7e4b741bcd6c4a3f2cdf863e719e5d5e60043e771ce5355dee1c5299ddfa54d77ddde2924271c0ece1e1e1e8aa6218c08aee40993eed58959af430c7d53b4179aa355febcc40124cb7a1d2965e36832e5f42f9a48275888725cba28d72398fbefac94";
  } ;
    { a = SHA2_512;
    entropy_input = "2886ff4e11950c1e639398b2c7d6908d5c2e4daeb7719e6dd98a39b1428ea7df";
    nonce = "8cbb97f58cf243045bdadb2f9bbdab10";
    personalization_string = "";
    entropy_input_reseed = "f487b94b5e4eda49e933e0c268eb5042c422df88061ebffd893d39fafd58efd3";
    additional_input_reseed = "ff8e7656a21bcced082972719ebf87539c4825cb0f4beabd12a12d544dea87af";
    additional_input_1 = "f64dd3b0efc5c8c146f9b9b8f0ec7ccb784e87c16268a4aab31e9eddf2c9b83e";
    additional_input_2 = "9dc16b955ae805f10ebbdc3794a2abe671a339ca148b46ef6ea208698a54a0d8";
    returned_bits = "0e8c9cb99fec37602b291e508e43c2ab323d05764184379ca3a2ca4080ed26c2dbfdf3d1916485c7eba49077ca881fb03d07f967cad9b477959f007a6188150b6630218af55fdd7be2eb88d48b5ec6b6876ec25665c0310624283d2b5460e3736f8b9f0b84095aa4754ac59067a7cc73402c09b1768972b3abd49e0e237a741649ea7888ea4a024c0952b94af27c53b13afcaa4fb7976f65443809d1bbd7e4b741bcd6c4a3f2cdf863e719e5d5e60043e771ce5355dee1c5299ddfa54d77ddde2924271c0ece1e1e1e8aa6218c08aee40993eed58959af430c7d53b4179aa355febcc40124cb7a1d2965e36832e5f42f9a48275888725cba28d72398fbefac";
  } ;
]
