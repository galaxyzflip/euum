<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 
 <style>
        div {
            margin: 0;
            padding: 0;

        }

        .container {
            margin-top: 150px;
            margin-bottom: 100px;

        }

        .account-box {
            flex-direction: row;

        }

        .find-id-form,
        .find-pw-form {
            border: 1px solid black;
            margin: 10px;
            padding: 10px;
            display: flex;

        }

        .input-form input {
            display: block;
        }

        .account-box>div {
            width: 300px;
            margin: auto;
            display: flex;

        }

        .mb-3 {
            margin-bottom: 0px !important;
            border-radius: 0;
        }

        .nav-link {
            margin: 0px;


        }

        .target-box {
            width: 300px;
            color: white;
            /* border:1px solid black; */
            padding-top: 0px;
            padding-bottom: 0px;
            margin: auto;
            border: 1px black solid;
            border-bottom:none;
        }

        #pills-tab {
            margin: auto;
        }

        .nav-pills .nav-link {
            border-radius: 0
        }

        .id-tab{
            width:149px;
        }

        .pw-tab{
            width: 149px;;
        }
        </style>
    
    <script>
    
    </script>
    
    
    	
 	 <div class="container">
        <div class="target-box">
            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active id-tab" id="pills-home-tab" data-bs-toggle="pill"
                        data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                        aria-selected="true">아이디찾기</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link pw-tab" id="pills-profile-tab" data-bs-toggle="pill"
                        data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile"
                        aria-selected="false">비밀번호 찾기</button>
                </li>
            </ul>
        </div>
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab"
                tabindex="0">
                <div class="account-box">

                    <div class="find-id-form">
                        <div class="input-form">
                            <form method="post" action="/member/findIdPro">
                                <div>
                                    <label>이름</label>
                                    <input type="text" name="memberName">
                                </div>
                                <div>
                                    <label>휴대폰번호</label>
                                    <input type="text" name="memberMobile">
                                </div>
                                <button type="submit" class="btn btn-danger">아이디 찾기</button>
                            </form>

                        </div>
                    </div>
                </div>


            </div>
            <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab"
                tabindex="0">
                <div class="account-box">

                    <div class="find-pw-form">
                        <div class="input-form">

                            <form method="post" action="/member/findPwPro">

                                <div>
                                    <label>이름</label>
                                    <input type="text" name="memberName">
                                </div>
                                <div>
                                    <label>아이디(이메일)</label>
                                    <input type="text" name="memberEmail">
                                </div>
                                <div>
                                    <label>휴대폰번호</label>
                                    <input type="text" name="memberMobile">
                                </div>

                                <button type="submit">비밀번호 찾기</button>
                            </form>


                        </div>
                    </div>
                </div>

            </div>
        </div>




    </div>
