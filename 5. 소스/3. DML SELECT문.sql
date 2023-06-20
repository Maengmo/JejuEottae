-- select 문

select * from Owner;

select * from activity;

select * from advertisement;

select * from Rentcar;

select * from Accommodate;

select * from Tour_area;

select * from Notice;

select * from Business;

select * from Rentcar_reservation;

select * from Reservation;

select * from review_reply;

select * from review;

select * from users;

select * from payment;

select * from Question_kind;

select * from Question;

select * from bookmark;

select * from scheduler;

select * from charge_record;

select * from Admin;

select * from Question_reply;

select * from Oil_bank;

select * from Electronic_charge;

select * from Tour;

-------------------------------------------------------------------------------------------------
-- 1번
-- 관리자

-- 전체 사업장 목록
select * from business;

-- 전체 광고 목록
select * from advertisement;

-- 사업장 찾기 > where문으로 찾기
select * from business where business_seq = ?;
select * from business where Owner_seq = ?;
select * from business where business_kind = ?;
select * from business where business_name = ?;
select * from business where business_address = ?;

-- 광고 찾기 > where문으로 찾기
select * from Advertisement where Ad_seq = ?;
select * from Advertisement where business_seq = ?;
select * from Advertisement where Owner_seq = ?;

-- 여행정보 관리
-- 관광지 목록
select * from Tour_area;

-- 주유소 목록
select * from Oil_bank;

-- 전기차 충전소 목록
select * from Electronic_charge;

-- 투어 목록
select * from Tour;
-----------------------------------------------------------------------------------------------------------------------------------------
-- 2번
-- 사업장 전체 예약 조회
SELECT * FROM reservation ORDER BY reservation_seq DESC;

-- 렌트카 전체 예약 조회
SELECT * FROM rentcar_reservation ORDER BY rentcar_reservation_seq DESC;

-- 사업장 예약 검색(ID)
SELECT
    *
FROM reservation r
    INNER JOIN users u on r.user_seq = u.user_seq
        WHERE u.user_id = ?
            ORDER BY reservation_seq DESC;
            
-- 사업장 예약 검색(이름)
SELECT
    *
FROM reservation r
    INNER JOIN users u on r.user_seq = u.user_seq
        WHERE u.user_name = ?
            ORDER BY reservation_seq DESC;
            
-- 사업장 예약 검색(상호명)
SELECT
    *
FROM reservation r
    INNER JOIN business b ON r.business_seq = b.business_seq
        WHERE u.business_name = ?
            ORDER BY reservation_seq DESC;
            
-- 렌트카 예약 검색(ID)
SELECT
    *
FROM rentcar_reservation r
    INNER JOIN users u on r.user_seq = u.user_seq
        WHERE u.users_name = ?
            ORDER BY rentcar_reservation_seq DESC;
            
-- 렌트카 예약 검색(이름)
SELECT
    *
FROM rentcar_reservation r
    INNER JOIN users u on r.user_seq = u.user_seq
        WHERE u.user_name = ?
            ORDER BY rentcar_reservation_seq DESC;
            
-- 렌트카 예약 검색(상호명)
SELECT
    *
FROM rentcar_reservation r
    INNER JOIN business b ON r.business_seq = b.business_seq
        WHERE u.business_name = ?
            ORDER BY rentcar_reservation_seq DESC;

-- 충전내역 전체 조회
SELECT 
    cr.charge_record_seq,
    u.user_id,
    u.user_name,
    cr.charge_amount,
    cr.charge_date
FROM charge_record cr
    INNER JOIN users u on cr.user_seq = u.user_seq
ORDER BY charge_record_seq DESC;

-- 포인트 충전 정보 검색(ID 검색)
SELECT 
    charge_record_seq,
    user_id,
    user_name,
    charge_amount,
    charge_date
FROM charge_record cr
    INNER JOIN users u on cr.user_seq = u.user_seq
   WHERE user_id = ?
ORDER BY charge_record_seq DESC;

-- 포인트 충전 정보 검색(이름 검색)
SELECT 
    charge_record_seq,
    user_id,
    user_name,
    charge_amount,
    charge_date
FROM charge_record cr
    INNER JOIN users u on cr.user_seq = u.user_seq
   WHERE user_name = ?
ORDER BY charge_record_seq DESC;

-- 전체 리뷰 목록 조회
SELECT
    r.review_seq,
    u.user_id,
    n.business_name,
    t.tour_area_name,
    r.review_content,
    r.review_open
FROM review r
    INNER JOIN business n ON r.business_seq = n.business_seq
        INNER JOIN tour_area t ON t.tour_area_seq = n.tour_area_seq
            INNER JOIN users u ON u.user_seq = r.user_seq
                ORDER BY review_seq DESC;
                
-- 리뷰 검색(ID)
SELECT
    r.review_seq,
    u.user_id,
    n.business_name,
    t.tour_area_name,
    r.review_content,
    r.review_open
FROM review r
    INNER JOIN business n ON r.business_seq = n.business_seq
        INNER JOIN tour_area t ON t.tour_area_seq = n.tour_area_seq
            INNER JOIN users u ON u.user_seq = r.user_seq
                WHERE u.user_id = ?
                    ORDER BY review_seq DESC;
                    
-- 리뷰 검색(상호명)
SELECT
    r.review_seq,
    u.user_id,
    n.business_name,
    t.tour_area_name,
    r.review_content,
    r.review_open
FROM review r
    INNER JOIN business n ON r.business_seq = n.business_seq
        INNER JOIN tour_area t ON t.tour_area_seq = n.tour_area_seq
            INNER JOIN users u ON u.user_seq = r.user_seq
                WHERE n.business_name = ?
                    ORDER BY review_seq DESC;
                    
-- 리뷰 검색(관광지명)
SELECT
    r.review_seq,
    u.user_id,
    n.business_name,
    t.tour_area_name,
    r.review_content,
    r.review_open
FROM review r
    INNER JOIN business n ON r.business_seq = n.business_seq
        INNER JOIN tour_area t ON t.tour_area_seq = n.tour_area_seq
            INNER JOIN users u ON u.user_seq = r.user_seq
                WHERE t.tour_area_name = ?
                    ORDER BY review_seq DESC;
-----------------------------------------------------------------------------------------------------------------------------------------
-- 3번
-- 전체공지사항 조회
select * from notice;
-- 공지사항 번호 받아서 조회
select * from notice where notice_seq=3;

--전체 문의사항 조회
select * from question;

--문의사항 종류 번호 받아서 종류별 문의사항 조회
select * from question where question_kind_seq = 1;
--유저번호 받아서 문의사항 조회
select * from question where user_seq = 1;

-- 문의 처리 조회
select 
    *   
from 
    question_reply qr 
        inner join question q 
            on qr.question_seq = q.question_seq
                where q.question_seq = 1;

-- 미처리 문의??

--사업자 계정 전체 조회
select * from Owner;

--사업자 번호 받아서 해당 사업자 계정 조회
select * from Owner where Owner_seq = 2;

--유저 계정 전체 조회
select * from users;

--유저 번호 받아서 유저번호 있는 테이블 전부 조회
select 
    * 
from Rentcar_reservation rr
    inner join Reservation r
        on rr.user_seq = r.user_seq
            inner join Users u
                on u.user_seq = r.user_seq
                    inner join Review rv
                        on u.user_seq = rv.user_seq
                            inner join Payment p
                                on p.user_seq = u.user_seq
                                    inner join Question q
                                        on u.user_seq = q.user_seq
                                            inner join bookmark b
                                                on u.user_seq = b.user_seq
                                                    inner join scheduler s
                                                        on s.user_seq = u.user_seq
                                                            inner join charge_record c
                                                                on c.user_seq = u.user_seq);
                                                                
-- Rentcar_reservation, Reservation, Review, users, Payment, Question, Bookmark, Scheduler, charge_record
create view ALLUSER
as
select *
from Rentcar_reservation r
inner join Reservation re
    on r.user_seq = re.user_seq
inner join Review rv
    on r.user_seq = rv.user_seq
inner join users u
    on u.user_seq = r.user_seq
inner join payment p
    on u.user_seq = p.user_seq
inner join Question q
    on u.user_seq = q.user_seq
inner join Bookmark b
    on u.user_seq = b.user_seq
inner join Scheduler s
    on u.user_seq = s.user_seq
inner join charge_record c
    on c.user_seq = u.user_seq;

------------------------------------------------------------------------------------------------------------------------------------------
-- 4번
--내 사업장 조회
select * from business where owner_seq = ?;

--내 사업장 관리(광고조회)
select * from advertisement where business_seq = ?;

--2. 리뷰 관리
select * from review where business_seq = ?;
select * from review r 
    inner join business b on r.business_seq = b.business_seq
    inner join owner o on o.owner_seq = b.owner_seq
    where b.business_seq = ?;
    
--리뷰 답글
select * from review r inner join review_reply p on r.review_seq = p.review_seq where business_seq = ?;

--3. 예약 관리
select * from reservation where business_seq = ?;

--렌트카 예약관리
select * from rentcar_reservation where business_seq = ?;

--4. 계정 관리
select * from owner where owner_seq = ?;

--5. 공지사항 조회
select * from notice;

-- 예약 조회 > where 절
select r.reservation_seq, r.user_seq, r.Business_seq, r.reservation_begin, r.reservation_end 
from Reservation r
inner join Business b
on r.business_seq = b.business_seq
inner join owner o
on o.owner_seq = b.owner_seq
where o.owner_seq = 38;

-----------------------------------------------------------------------------------------------------------------------------------------------
-- 5번
--1. 맛집, 카페 조회
select 
    * 
from Business 
where Business_kind = '맛집' and Business_kind = '카페';

--2. 액티비티 조회
select 
    * 
from Business
where Business_kind = '액티비티';

--2.5 관광지 조회
select
    *
from Tour_area;

--3. 숙소 조회
select
    *
from Business
where Business_kind = '숙소';

--4. 렌트카
select
    *
from Business
where Business_kind = '렌트카';

--4.5 주유소/전기차 충전소 조회

select
    *
from Oil_bank;

select
    *
from Electronic_charge;

--5. 투어 조회
select
    *
from Tour;

--6. 내 즐겨찾기 조회
select
    *
from Bookmark
where User_seq = 로그인한 유저 번호;

--7. 여행 스케줄러 조회
select
    *
from Scheduler
where User_seq = 로그인한 유저 번호;

--8. 내 예약 관리
select
    * -- 서버에서 뭘 조회할지 확인해봐야함
from Rentcar_reservation rr
    inner join Reservation r on rr.User_seq = r.User_seq
        where r.User_seq = 로그인한 유저 번호;

--9. 리뷰 관리
--9.1 리뷰 조회
select
    *
from Review
where User_seq = 로그인한 유저 번호; 
--9.2 리뷰 등록
insert into Review values (Review_seq.nextVal, 로그인한 유저 번호, 리뷰등록하려는 사업장 번호, 리뷰등록하려는 관광지 번호, 리뷰내용, 공개여부);

--10. 내 포인트 관리
select
    User_money
from Users
where User_seq = 로그인한 유저 번호;

--11. 공지사항 보기
select
    *
from Notice;

--12. 관리자에게 문의하기 
insert into Question values (Question_seq.nextVal, 로그인한 유저 번호, 문의종류번호, 신고내용);

--13. 계정 관리
update user set 업데이트할려는 컬럼 where User_seq = 로그인한 유저 번호;

--0. 로그아웃
--------------------------------------------------------------------------------------------------------------------------------



