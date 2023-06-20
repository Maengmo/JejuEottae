-- select ��

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
-- 1��
-- ������

-- ��ü ����� ���
select * from business;

-- ��ü ���� ���
select * from advertisement;

-- ����� ã�� > where������ ã��
select * from business where business_seq = ?;
select * from business where Owner_seq = ?;
select * from business where business_kind = ?;
select * from business where business_name = ?;
select * from business where business_address = ?;

-- ���� ã�� > where������ ã��
select * from Advertisement where Ad_seq = ?;
select * from Advertisement where business_seq = ?;
select * from Advertisement where Owner_seq = ?;

-- �������� ����
-- ������ ���
select * from Tour_area;

-- ������ ���
select * from Oil_bank;

-- ������ ������ ���
select * from Electronic_charge;

-- ���� ���
select * from Tour;
-----------------------------------------------------------------------------------------------------------------------------------------
-- 2��
-- ����� ��ü ���� ��ȸ
SELECT * FROM reservation ORDER BY reservation_seq DESC;

-- ��Ʈī ��ü ���� ��ȸ
SELECT * FROM rentcar_reservation ORDER BY rentcar_reservation_seq DESC;

-- ����� ���� �˻�(ID)
SELECT
    *
FROM reservation r
    INNER JOIN users u on r.user_seq = u.user_seq
        WHERE u.user_id = ?
            ORDER BY reservation_seq DESC;
            
-- ����� ���� �˻�(�̸�)
SELECT
    *
FROM reservation r
    INNER JOIN users u on r.user_seq = u.user_seq
        WHERE u.user_name = ?
            ORDER BY reservation_seq DESC;
            
-- ����� ���� �˻�(��ȣ��)
SELECT
    *
FROM reservation r
    INNER JOIN business b ON r.business_seq = b.business_seq
        WHERE u.business_name = ?
            ORDER BY reservation_seq DESC;
            
-- ��Ʈī ���� �˻�(ID)
SELECT
    *
FROM rentcar_reservation r
    INNER JOIN users u on r.user_seq = u.user_seq
        WHERE u.users_name = ?
            ORDER BY rentcar_reservation_seq DESC;
            
-- ��Ʈī ���� �˻�(�̸�)
SELECT
    *
FROM rentcar_reservation r
    INNER JOIN users u on r.user_seq = u.user_seq
        WHERE u.user_name = ?
            ORDER BY rentcar_reservation_seq DESC;
            
-- ��Ʈī ���� �˻�(��ȣ��)
SELECT
    *
FROM rentcar_reservation r
    INNER JOIN business b ON r.business_seq = b.business_seq
        WHERE u.business_name = ?
            ORDER BY rentcar_reservation_seq DESC;

-- �������� ��ü ��ȸ
SELECT 
    cr.charge_record_seq,
    u.user_id,
    u.user_name,
    cr.charge_amount,
    cr.charge_date
FROM charge_record cr
    INNER JOIN users u on cr.user_seq = u.user_seq
ORDER BY charge_record_seq DESC;

-- ����Ʈ ���� ���� �˻�(ID �˻�)
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

-- ����Ʈ ���� ���� �˻�(�̸� �˻�)
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

-- ��ü ���� ��� ��ȸ
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
                
-- ���� �˻�(ID)
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
                    
-- ���� �˻�(��ȣ��)
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
                    
-- ���� �˻�(��������)
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
-- 3��
-- ��ü�������� ��ȸ
select * from notice;
-- �������� ��ȣ �޾Ƽ� ��ȸ
select * from notice where notice_seq=3;

--��ü ���ǻ��� ��ȸ
select * from question;

--���ǻ��� ���� ��ȣ �޾Ƽ� ������ ���ǻ��� ��ȸ
select * from question where question_kind_seq = 1;
--������ȣ �޾Ƽ� ���ǻ��� ��ȸ
select * from question where user_seq = 1;

-- ���� ó�� ��ȸ
select 
    *   
from 
    question_reply qr 
        inner join question q 
            on qr.question_seq = q.question_seq
                where q.question_seq = 1;

-- ��ó�� ����??

--����� ���� ��ü ��ȸ
select * from Owner;

--����� ��ȣ �޾Ƽ� �ش� ����� ���� ��ȸ
select * from Owner where Owner_seq = 2;

--���� ���� ��ü ��ȸ
select * from users;

--���� ��ȣ �޾Ƽ� ������ȣ �ִ� ���̺� ���� ��ȸ
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
-- 4��
--�� ����� ��ȸ
select * from business where owner_seq = ?;

--�� ����� ����(������ȸ)
select * from advertisement where business_seq = ?;

--2. ���� ����
select * from review where business_seq = ?;
select * from review r 
    inner join business b on r.business_seq = b.business_seq
    inner join owner o on o.owner_seq = b.owner_seq
    where b.business_seq = ?;
    
--���� ���
select * from review r inner join review_reply p on r.review_seq = p.review_seq where business_seq = ?;

--3. ���� ����
select * from reservation where business_seq = ?;

--��Ʈī �������
select * from rentcar_reservation where business_seq = ?;

--4. ���� ����
select * from owner where owner_seq = ?;

--5. �������� ��ȸ
select * from notice;

-- ���� ��ȸ > where ��
select r.reservation_seq, r.user_seq, r.Business_seq, r.reservation_begin, r.reservation_end 
from Reservation r
inner join Business b
on r.business_seq = b.business_seq
inner join owner o
on o.owner_seq = b.owner_seq
where o.owner_seq = 38;

-----------------------------------------------------------------------------------------------------------------------------------------------
-- 5��
--1. ����, ī�� ��ȸ
select 
    * 
from Business 
where Business_kind = '����' and Business_kind = 'ī��';

--2. ��Ƽ��Ƽ ��ȸ
select 
    * 
from Business
where Business_kind = '��Ƽ��Ƽ';

--2.5 ������ ��ȸ
select
    *
from Tour_area;

--3. ���� ��ȸ
select
    *
from Business
where Business_kind = '����';

--4. ��Ʈī
select
    *
from Business
where Business_kind = '��Ʈī';

--4.5 ������/������ ������ ��ȸ

select
    *
from Oil_bank;

select
    *
from Electronic_charge;

--5. ���� ��ȸ
select
    *
from Tour;

--6. �� ���ã�� ��ȸ
select
    *
from Bookmark
where User_seq = �α����� ���� ��ȣ;

--7. ���� �����ٷ� ��ȸ
select
    *
from Scheduler
where User_seq = �α����� ���� ��ȣ;

--8. �� ���� ����
select
    * -- �������� �� ��ȸ���� Ȯ���غ�����
from Rentcar_reservation rr
    inner join Reservation r on rr.User_seq = r.User_seq
        where r.User_seq = �α����� ���� ��ȣ;

--9. ���� ����
--9.1 ���� ��ȸ
select
    *
from Review
where User_seq = �α����� ���� ��ȣ; 
--9.2 ���� ���
insert into Review values (Review_seq.nextVal, �α����� ���� ��ȣ, �������Ϸ��� ����� ��ȣ, �������Ϸ��� ������ ��ȣ, ���䳻��, ��������);

--10. �� ����Ʈ ����
select
    User_money
from Users
where User_seq = �α����� ���� ��ȣ;

--11. �������� ����
select
    *
from Notice;

--12. �����ڿ��� �����ϱ� 
insert into Question values (Question_seq.nextVal, �α����� ���� ��ȣ, ����������ȣ, �Ű���);

--13. ���� ����
update user set ������Ʈ�ҷ��� �÷� where User_seq = �α����� ���� ��ȣ;

--0. �α׾ƿ�
--------------------------------------------------------------------------------------------------------------------------------



