# Daily report 8/3/2017
----------
[TOC]

##What is git, github, repository?
### What is git?
[**Git**][1] là một trong những Hệ thống Quản lý Phiên bản Phân tán (Distributed Version Control System – DVCS). Trên [**Git**][1], ta có thể lưu trạng thái của file dưới dạng lịch sử cập nhật. Vì thế, có thể đưa file đã chỉnh sửa một lần về trạng thái cũ hay có thể biết được file đã được chỉnh sửa chỗ nào.
### What is github?
Github chính là một dịch vụ máy chủ các kho chứa(repository) công cộng, mỗi người có thể tạo tài khoản trên đó để tạo ra các kho chứa của riêng mình để có thể làm việc.
### What is repository?
Repository hay được gọi tắt là Repo, đơn giản là nơi chứa tất cả những thông tin cần thiết để duy trì và quản lý các sửa đổi và lịch sử của toàn bộ project.
Repository của Git được phân thành 2 loại là remote repository và local repository.
Remote repository: Là repository để chia sẻ giữa nhiều người và bố trí trên server chuyên dụng.
Local repository: Là repository bố trí trên máy của bản thân mình, dành cho một người dùng sử dụng.
##What is branch, pull request?
###What is branch?
Đây là một trong những thế mạnh của git là nhánh. Với git, việc quản lý nhánh rất dễ dàng. Mỗi nhánh trong Git gần giống như một workspace. Việc nhảy vào một nhánh để làm việc trong đó tương tự việc chuyển qua ngữ cảnh làm việc mới, và sau đó có thể nhanh chóng quay lại ngữ cảnh cũ.

Nhánh (branch) được dùng để phát triển tính năng mới mà không làm ảnh hưởng đến code hiện tại.

Nhánh master là nhánh “mặc định” khi bạn tạo một repository.
Nhánh master thông thường là nhánh chính của ứng dụng. Ví dụ bạn thử nghiệm một tính năng mới và muốn không ảnh hưởng đến code chính bạn có thể tạo một nhánh mới và sau khi xong sẽ hợp nhất lại với nhánh master.
###What is pull request?
Đề đảm bảo cho việc tương tác nhóm được tốt hơn, và hạn chế tối đa conflict có thể xảy ra, cũng như dễ dàng theo dấu dự án (để khôi phục trạng thái nếu lỡ có biến cố xảy ra), hay để cộng đồng nguồn mở có thể tham gia đóng góp cho dự án được thuận tiện và nhiều lợi ích khác, pull request ra đời.
Pull request là yêu cầu để ghộp code của mình vào nhánh chính của dự án.
##What is git commit, git add, git push, git log?
### What is git add?
Git add là một câu lệnh đa chức năng - bạn có thể dùng nó để bắt đầu theo dõi tập tin, tổ chức tập tin, hoặc các việc khác như đánh dấu đã giải quyết xong các tập tin có nội dung mâu thuẫn nhau khi tích hợp .
Cập nhật tình trạng các file( thêm, xóa, sửa) trong project được quản lý bởi GIT
Cú pháp
>Cập nhật tất cả
git add .
Cập nhật tất cả các file có dạng
git add *.<tên đuôi>
Cập nhật file theo tên
git add <tên file 1> [<tên file 2> ... <Tên file n>]
### What is git commit?
Để ghi lại việc thêm/thay đổi file hay thư mục vào repository thì sẽ thực hiện thao tác gọi là Commit.
Khi thực hiện commit, trong repository sẽ tạo ra commit (hoặc revision) đã ghi lại sự khác biệt từ trạng thái đã commit lần trước với trạng thái hiện tại.
Commit này đang được chứa tại repository, các commit nối tiếp với nhau theo thứ tự thời gian. Bằng việc lần theo commit này từ trạng thái mới nhất thì có thể biết được lịch sử thay đổi trong quá khứ hoặc nội dung thay đổi đó.
Các commit này, được đặt tên bởi 40 ký tự alphabet (mã md5 thì phải) không trùng nhau được băm từ thông tin commit. Bằng việc đặt tên cho commit, có thể chỉ định commit nào từ trong repository.
Mỗi commit đều có yêu cầu phải có commit message, để giải thích commit này là bạn đã làm gì trong này. 
###What is git push?

Công dụng: Cập nhật những thay đổi của project và gửi lên server

Cú pháp
>git push origin <Tên nhánh>

Nếu bạn chưa clone một repository hiện có và muốn kết nối repository của bạn đến máy chủ remote, bạn phải thêm nó với
>git remote add origin <máy-chủ>

Bây giờ bạn đã có thể đẩy các thay đổi của mình vào máy chủ đã chọn
###What is git log?
Để xem lịch sử của các lần commit trước đó ta sử dụng Git log :
>$ git log
commit e5e9809a0a097cd48041010e6e60df97f0b978f2
Merge: 947cc56 1525b74
Author: Trang Truong c <tnkttruong@gmail.com>
Date:   Wed Mar 8 14:59:18 2017 +0700

    Merge branch 'develop' into day_01_conflict


----------


 Mỗi lần commit sẽ có một checksum riêng, và nó cũng có ghi rõ ai là người commit vào và commit vào ngày bao nhiêu, lúc nào.
 Có thể chèn thêm tham số -p vào để hiển thị chi tiết của mỗi lần commit.
 
>$ git log -p
commit 947cc565707f725cd0090e0a601f25cdce9f451f
Author: Trang Truong c <tnkttruong@gmail.com>
Date:   Wed Mar 8 14:55:55 2017 +0700

    commit day_01.rd from day_01_conflict to develop

diff --git a/day_01.rd b/day_01.rd
index 8b13789..1a49668 100644
--- a/day_01.rd
+++ b/day_01.rd
@@ -1 +1 @@
-
+xin chao

commit fe5031e834cbe0540ff9c943b07dbe6f264cb1a9
Author: Trang Truong c <tnkttruong@gmail.com>
Date:   Wed Mar 8 14:53:23 2017 +0700

    commit day_01.rd from day_01 to develop

diff --git a/day_01.rd b/day_01.rd
index 8b13789..9369771 100644
--- a/day_01.rd
+++ b/day_01.rd
@@ -1 +1 @@
-
:

----------
Nếu log quá dài, dùng phím mũi tên lên xuống để đọc tiếp và ấn Ctrl + Z để thoát.

Hoặc nếu muốn chỉ muốn xem 1 lần commit gần nhất thì thêm tham số -1 vào.
Có thể sử dụng thêm một số tùy chọn xem log sau để tối ưu hơn quy trình đọc log.
- **- -since, - -after**: Xem các lần commit kể từ ngày nhất định.
- **- -until **: Xem các lần commit trước từ ngày nhất định.
- **- -author**: Xem các lần commit của một người nào đó.
- **- -grep,**: Lọc các chuỗi trong log và in ra.



----------
##How to create branch, Pull Request?
###How to create branch?
	git branch <Tên nhánh>
	hoặc
	git checkout -b <Tên nhánh>
###How to create Pull Request?
Để [**Tạo một pull request**][2] ta thực hiện các bước sau:
   1. Đưa về nhánh chính.
   2. Chọn nhánh có chưa commit muốn tạo pull request.![Alt text](./1488966041156.png)

   3. Click vào New pull request.![Alt text](./1488966047235.png)

   4. Chọn nhánh muốn merge vào và nhánh của mình muốn được merge.![Alt text](./1488966052563.png)

   5. Comment về pull request.![Alt text](./1488966059147.png)

   6. Click Create pull request.![Alt text](./1488966074120.png)

##How to delete branch?
Cú pháp
> $ git branch -d [tên nhánh]


Để xóa nhánh ở remote repo

> $git push origin --delete [Tên nhánh]

##How to resolve conflict?
Giải quyết xung đột:
1. Đưa về nhánh chính: 
2. Chuyển sang nhánh bị xung đột.
3. Pull code từ github
4. Merge với nhánh chính
5. Sửa đổi file xung đột
6. Add, commit, push lên github
##Compare rebase and merge
- Sử dụng git rebase nếu như  muốn các sự thay đổi thuộc về branch luôn luôn là mới nhất.
- Sử dụng git merge nếu muốn sắp xếp các commit theo mặc định.
Khuyết điểm của git merge là làm cho git commit list dài ra. Khó trace log. Nhất là trong 1 dự án dài hơi, việc nhìn lại log của vài tháng trước có thể sẽ là vấn đề.
[1]: https://blog.duyet.net/2015/04/git-va-cac-khai-niem-co-ban.html
[2]: https://help.github.com/articles/creating-a-pull-request/
