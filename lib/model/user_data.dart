class User {
  /*
  * pk 값 (고유 프라이머리 키)  UID -> non -nullable로 만들면됨 (파이어베이스에서 자동생성됨) (UUID로 하지않음)
  * 이름
  * 이메일(아이디)
  * 회원가입 경로 ( 0.카카오, 1.애플, 2.구글, 3.네이버)
  *
  * */
}

/*

당장 고민해야할것은 아니지만 후에 결제 시스템이 생긴다면
결제 내역에 관한 데이터 클래스가 필요할지
payment 를 따로 만들고 , field중 하나 uid 값을 연결

다이어리 저장 내역을 유저에 저장해야하는지 ?

*/